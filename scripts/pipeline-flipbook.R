# A flipbook for pipelines, in plain R and HTML.
#
# Give it the lines of a dplyr pipeline. It evaluates the pipeline one step at
# a time, renders the code written so far next to the table that comes out of
# it, and wraps everything in a slider. The reader drags through the steps and
# watches the data change.
#
# No extra package, no separate render, no iframe: every step is baked into the
# page as HTML, exactly like the data-ink slider in "Stories and Visuals".
#
# Usage inside a chunk with results = "asis":
#
#   pipeline_flipbook(c(
#     'viadrina',
#     'filter(term == "winter")',
#     'mutate(change = students / lag(students) - 1)',
#     'select(semester, students, change)'
#   ))

pipeline_flipbook <- function(lines,
                              n_rows = 6,
                              id = paste0("flip", sample(1e5, 1)),
                              envir = parent.frame(),
                              note = NULL) {
  stopifnot(length(lines) >= 2)

  panes <- character(length(lines))

  for (i in seq_along(lines)) {
    # 1. The code written so far, joined into one pipeline.
    code <- paste(lines[seq_len(i)], collapse = " %>%\n  ")

    # 2. Run it. The last line is the one that just appeared.
    value <- eval(parse(text = code), envir = envir)

    shown <- utils::head(as.data.frame(value), n_rows)
    shown[] <- lapply(shown, function(col) {
      if (is.numeric(col)) round(col, 3) else as.character(col)
    })

    tbl <- knitr::kable(shown, format = "html", row.names = FALSE,
                        table.attr = 'class="flip-table"')

    # 3. Highlight the line that was added in this step.
    marked <- vapply(seq_len(i), function(k) {
      line <- htmltools::htmlEscape(lines[k])
      pipe <- if (k < i) " %&gt;%" else ""
      indent <- if (k == 1) "" else "  "
      if (k == i && i > 1) {
        paste0('<span class="flip-new">', indent, line, '</span>', pipe)
      } else {
        paste0(indent, line, pipe)
      }
    }, character(1))

    panes[i] <- paste0(
      '<div class="flip-pane" data-step="', i, '"',
      if (i > 1) ' hidden' else '', '>\n',
      '<pre class="flip-code"><code>', paste(marked, collapse = "\n"),
      '</code></pre>\n',
      '<div class="flip-out">', tbl,
      '<p class="flip-dim">', nrow(as.data.frame(value)), " rows &times; ",
      ncol(as.data.frame(value)), " columns</p></div>\n</div>"
    )
  }

  cat(
    '<div class="pipeline-flipbook" id="', id, '">\n',
    paste(panes, collapse = "\n"), "\n",
    '<input type="range" class="flip-slider" min="1" max="', length(lines),
    '" value="1" step="1" aria-label="pipeline step">\n',
    '<p class="flip-caption">Step <span class="flip-i">1</span> of ',
    length(lines),
    if (!is.null(note)) paste0(" &mdash; ", note) else "",
    '</p>\n</div>\n',
    '<script>\n(function(){\n',
    '  var box = document.getElementById("', id, '");\n',
    '  var panes = box.querySelectorAll(".flip-pane");\n',
    '  var slider = box.querySelector(".flip-slider");\n',
    '  var label = box.querySelector(".flip-i");\n',
    '  slider.addEventListener("input", function(){\n',
    '    var n = +slider.value;\n',
    '    panes.forEach(function(p){ p.hidden = (+p.dataset.step !== n); });\n',
    '    label.textContent = n;\n',
    '  });\n})();\n</script>\n',
    sep = ""
  )

  # The final state of the pipeline, so the chunk can both show and assign:
  #   viadrina_display <- pipeline_flipbook(c(...))
  invisible(value)
}
