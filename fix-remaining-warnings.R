# Run once from the root directory of the Bookdown project:
# source("fix-remaining-warnings.R")

patch_lines <- function(path, transform) {
  if (!file.exists(path)) {
    stop("Required file not found: ", path, call. = FALSE)
  }

  original <- readLines(path, warn = FALSE, encoding = "UTF-8")
  updated <- transform(original)

  if (identical(original, updated)) {
    message(path, ": already clean; no change needed.")
    return(invisible(FALSE))
  }

  backup <- paste0(path, ".before-clean-structure")
  if (!file.exists(backup)) {
    file.copy(path, backup, overwrite = FALSE)
  }

  writeLines(updated, path, useBytes = TRUE)
  message(path, ": patched. Backup: ", backup)
  invisible(TRUE)
}

patch_lines("index.Rmd", function(x) {
  # Remove the build-time dependency on the external sthda.com script.
  remote_pattern <- paste0(
    "source\\([\"']https?://www\\.sthda\\.com/upload/",
    "rquery_wordcloud\\.r[\"']\\)"
  )
  x <- sub(
    remote_pattern,
    'source("scripts/rquery_wordcloud_local.R", local = knitr::knit_global())',
    x,
    perl = TRUE
  )

  # Avoid collisions with the Analysis chapter/section IDs {#structure}
  # and {#components}; visible heading text and content remain unchanged.
  x[x == "## Structure {-}"] <-
    "## Structure {#book-structure .unnumbered}"
  x[x == "### Components {-}"] <-
    "### Components {#book-components .unnumbered}"

  x
})

patch_lines("L02-stories.Rmd", function(x) {
  # The text references Figure \\@ref(fig:dogs), so the corresponding
  # image chunk needs the label 'dogs'.
  target <- grepl(
    '^```\\{r,.*fig\\.cap="The Ultimate Dog Data by',
    x,
    perl = TRUE
  )

  if (sum(target) > 1L) {
    stop(
      "More than one possible dog-figure chunk found in L02-stories.Rmd.",
      call. = FALSE
    )
  }

  if (sum(target) == 1L) {
    x[target] <- sub('^```\\{r,', '```{r dogs,', x[target])
  }

  x
})

if (!file.exists("scripts/rquery_wordcloud_local.R")) {
  stop(
    "scripts/rquery_wordcloud_local.R is missing. Copy it from the ZIP before rendering.",
    call. = FALSE
  )
}

message("The remaining known Bookdown warnings have been patched.")
