# A flipbook for ggplot layers, in plain R and HTML.
#
# Give it the lines of a ggplot call. It builds the plot one layer at a time,
# renders the code written so far next to the picture that comes out of it, and
# wraps everything in a slider. The reader drags through the steps and watches
# the graph appear layer by layer.
#
# Same idea as scripts/pipeline-flipbook.R, one step further: there the output
# of each step is a table, here it is an image. The HTML structure and the
# slider are deliberately identical, so both reuse the .pipeline-flipbook CSS.
#
# Images are embedded as data URIs. That keeps the flipbook self-contained -
# no extra files, no build-order surprise about whether a freshly written PNG
# is copied into docs/ - at the price of a slightly larger HTML page. Keep the
# number of steps modest and the resolution sane and it stays well under a
# megabyte.
#
# Usage inside a chunk with results = "asis", echo = FALSE:
#
#   ggplot_flipbook(c(
#     'ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g))',
#     'geom_point()',
#     'theme_minimal()'
#   ))

ggplot_flipbook <- function(lines,
                            id = paste0("ggflip", sample(1e5, 1)),
                            envir = parent.frame(),
                            width = 6.4,
                            height = 4.0,
                            res = 100,
                            note = NULL,
                            html = isTRUE(knitr::is_html_output())) {

  stopifnot(length(lines) >= 2)

  code_all <- paste(lines, collapse = " +\n  ")
  plot_final <- eval(parse(text = code_all), envir = envir)

  # Anything that is not HTML (PDF, epub, a preview in the editor) simply gets
  # the finished plot.
  if (!isTRUE(html)) {
    print(plot_final)
    return(invisible(plot_final))
  }

  render_step <- function(p) {
    file <- tempfile(fileext = ".png")
    grDevices::png(file, width = width, height = height, units = "in",
                   res = res, bg = "white")
    tryCatch(print(p), finally = grDevices::dev.off())
    uri <- xfun::base64_uri(file)
    unlink(file)
    uri
  }

  panes <- character(length(lines))

  for (i in seq_along(lines)) {
    # 1. The code written so far, joined into one ggplot call.
    code <- paste(lines[seq_len(i)], collapse = " +\n  ")
    p <- eval(parse(text = code), envir = envir)

    # 2. Highlight the layer that was added in this step.
    marked <- vapply(seq_len(i), function(k) {
      line   <- htmltools::htmlEscape(lines[k])
      plus   <- if (k < i) " +" else ""
      indent <- if (k == 1) "" else "  "
      if (k == i && i > 1) {
        paste0('<span class="flip-new">', indent, line, "</span>", plus)
      } else {
        paste0(indent, line, plus)
      }
    }, character(1))

    panes[i] <- paste0(
      '<div class="flip-pane" data-step="', i, '"',
      if (i > 1) " hidden" else "", ">\n",
      '<pre class="flip-code"><code>', paste(marked, collapse = "\n"),
      "</code></pre>\n",
      '<div class="flip-out"><img class="flip-img" loading="lazy" alt="Step ',
      i, ' of the plot" src="', render_step(p), '"></div>\n</div>'
    )
  }

  cat(
    '<div class="pipeline-flipbook" id="', id, '">\n',
    paste(panes, collapse = "\n"), "\n",
    '<input type="range" class="flip-slider" min="1" max="', length(lines),
    '" value="1" step="1" aria-label="plot layer">\n',
    '<p class="flip-caption">Layer <span class="flip-i">1</span> of ',
    length(lines),
    if (!is.null(note)) paste0(" &mdash; ", note) else "",
    "</p>\n</div>\n",
    '<script>\n(function(){\n',
    '  var box = document.getElementById("', id, '");\n',
    '  var panes = box.querySelectorAll(".flip-pane");\n',
    '  var slider = box.querySelector(".flip-slider");\n',
    '  var label = box.querySelector(".flip-i");\n',
    '  slider.addEventListener("input", function(){\n',
    '    var n = +slider.value;\n',
    '    panes.forEach(function(p){ p.hidden = (+p.dataset.step !== n); });\n',
    '    label.textContent = n;\n',
    "  });\n})();\n</script>\n",
    sep = ""
  )

  # The finished plot, so the chunk can both show and assign.
  invisible(plot_final)
}
