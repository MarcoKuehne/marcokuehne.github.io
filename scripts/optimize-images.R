# Shrink oversized images in images/.
#
# Most of the weight in this repository is not resolution, it is encoding:
# diagrams saved as 24-bit PNG carry millions of possible colours to show
# maybe two hundred. Reducing the palette is visually free and cuts 70-90 %.
#
# Nothing is touched unless you ask for it twice. The script runs as a report
# by default; only `apply_changes = TRUE` writes, and originals are copied to
# images/_originals/ first.
#
#   source("scripts/optimize-images.R")     # report only
#   optimize_images(apply_changes = TRUE)   # actually rewrite

library(magick)

# Never touched, whatever their size.
PROTECTED <- c(
  "Cover.png",   # the cover is sacred
  "Logo.png",
  "Logo.ico"
)

optimize_images <- function(dir = "images",
                            max_width = 1400,
                            min_kb = 300,
                            jpeg_quality = 85,
                            apply_changes = FALSE,
                            backup = file.path(dir, "_originals")) {

  files <- list.files(dir, full.names = TRUE,
                      pattern = "\\.(png|jpg|jpeg)$", ignore.case = TRUE)
  files <- files[!basename(files) %in% PROTECTED]
  files <- files[file.size(files) / 1024 >= min_kb]
  files <- files[order(-file.size(files))]

  if (!length(files)) {
    cat("Nothing above ", min_kb, " KB. Done.\n", sep = "")
    return(invisible(NULL))
  }

  cat(sprintf("%-28s %9s %11s %9s %8s\n",
              "file", "KB", "pixels", "new KB", "saved"))
  cat(strrep("-", 70), "\n")

  saved_kb <- 0

  for (f in files) {
    img <- image_read(f)
    inf <- image_info(img)
    old_kb <- file.size(f) / 1024

    out <- image_strip(img)                       # drop metadata
    if (inf$width > max_width) {                  # only downscale, never up
      out <- image_resize(out, paste0(max_width, "x"))
    }

    is_png <- grepl("png$", f, ignore.case = TRUE)
    tmp <- tempfile(fileext = if (is_png) ".png" else ".jpg")

    if (is_png) {
      # A palette of 256 colours is plenty for charts, screenshots, diagrams.
      image_write(image_quantize(out, max = 256), tmp)
    } else {
      image_write(out, tmp, format = "jpeg", quality = jpeg_quality)
    }

    new_kb <- file.size(tmp) / 1024

    # If the "optimised" file is bigger, the original was already good.
    if (new_kb >= old_kb) {
      cat(sprintf("%-28s %9.0f %11s %9s %8s\n", basename(f), old_kb,
                  paste0(inf$width, "x", inf$height), "-", "keep"))
      next
    }

    cat(sprintf("%-28s %9.0f %11s %9.0f %7.0f%%\n", basename(f), old_kb,
                paste0(inf$width, "x", inf$height), new_kb,
                100 * (1 - new_kb / old_kb)))
    saved_kb <- saved_kb + (old_kb - new_kb)

    if (apply_changes) {
      dir.create(backup, showWarnings = FALSE, recursive = TRUE)
      file.copy(f, file.path(backup, basename(f)), overwrite = FALSE)
      file.copy(tmp, f, overwrite = TRUE)
    }
  }

  cat(strrep("-", 70), "\n")
  cat(if (apply_changes) "Saved " else "Would save ",
      round(saved_kb / 1024, 1), " MB.\n", sep = "")
  cat("Protected and untouched: ", paste(PROTECTED, collapse = ", "), "\n", sep = "")

  if (!apply_changes) {
    cat("\nThis was a report. Look at the percentages, then run:\n")
    cat("  optimize_images(apply_changes = TRUE)\n")
  } else {
    cat("Originals kept in ", backup, ". Check the pages, then delete it.\n",
        sep = "")
  }

  invisible(NULL)
}

# Sourcing the file gives the report, never a change.
optimize_images()
