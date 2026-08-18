# ---------------------------------------------------------------------------
#  diagnose-build.R  (v2)  --  finds out why the book will not build.
#
#  Run from the project root, in a FRESH R session:
#
#      source("scripts/diagnose-build.R")
#
#  Everything lands in build-log.txt AND is printed to the console.
# ---------------------------------------------------------------------------

report <- character(0)
say <- function(...) {
  line <- paste0(...)
  report <<- c(report, line)
  cat(line, "\n", sep = "")
}

say("== ENVIRONMENT ==")
say("R          : ", R.version.string)
say("Library    : ", .libPaths()[1])
say("Working dir: ", getwd())
say("RStudio    : ", if (Sys.getenv("RSTUDIO") == "1") "yes" else "no (plain R session)")
say("")

## 1. Pandoc ---------------------------------------------------------------
##    The most common instant failure: R cannot find pandoc. RStudio ships
##    its own copy and only tells R about it inside RStudio.

say("== PANDOC ==")
if (requireNamespace("rmarkdown", quietly = TRUE)) {
  ok <- rmarkdown::pandoc_available()
  say("available  : ", ok)
  if (ok) {
    say("version    : ", as.character(rmarkdown::pandoc_version()))
    say("path       : ", rmarkdown::pandoc_exec())
  } else {
    say("!! No pandoc. Either run this inside RStudio, or install pandoc")
    say("!! from pandoc.org and restart R.")
  }
} else {
  say("!! rmarkdown is not installed.")
}
say("RSTUDIO_PANDOC env: ", Sys.getenv("RSTUDIO_PANDOC", "<empty>"))
say("")

## 2. Packages -------------------------------------------------------------

say("== PACKAGES ==")
needed <- c("bookdown", "rmarkdown", "knitr", "tidyverse", "haven",
            "sjlabelled", "scales", "kableExtra", "modelsummary", "DT",
            "webexercises", "tippy", "tufte")
missing <- needed[!vapply(needed, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) {
  say("MISSING: ", paste(missing, collapse = ", "))
  say('Install with: install.packages(c("',
      paste(missing, collapse = '", "'), '"))')
} else {
  say("All book-wide packages present.")
}
for (p in c("bookdown", "rmarkdown", "knitr", "xfun")) {
  if (requireNamespace(p, quietly = TRUE))
    say("  ", p, " ", as.character(utils::packageVersion(p)))
}
say("")

## 3. Do all the chapter files listed in _bookdown.yml actually exist? -----

say("== CHAPTER FILES ==")
yml <- readLines("_bookdown.yml", warn = FALSE)
listed <- sub("^\\s*-\\s*", "", grep("^\\s*-\\s+\\S+\\.Rmd\\s*$", yml, value = TRUE))
listed <- trimws(listed)
gone <- listed[!file.exists(listed)]
if (length(gone)) {
  say("MISSING FILES: ", paste(gone, collapse = ", "))
} else {
  say(length(listed), " files listed, all present.")
}

children <- unlist(lapply(listed, function(f) {
  src <- readLines(f, warn = FALSE)
  m <- regmatches(src, regexpr("child\\s*=\\s*['\"][^'\"]+['\"]", src))
  gsub(".*['\"]([^'\"]+)['\"].*", "\\1", m)
}))
gone_kids <- children[!file.exists(children)]
if (length(gone_kids)) {
  say("MISSING CHILD FILES: ", paste(gone_kids, collapse = ", "))
} else {
  say(length(children), " child files referenced, all present.")
}
say("")

## 4. Leftover merged files -----------------------------------------------

merged <- setdiff(list.files(".", pattern = "\\.Rmd$"), c(listed, children))
if (length(merged)) {
  say("== LEFTOVERS IN THE ROOT (from crashed builds) ==")
  say(paste(" ", merged, collapse = "\n"))
  say("")
}

## 5. The build ------------------------------------------------------------

say("== BUILD ==")
say("Rendering, this takes a few minutes ...")
flush.console()

knit_log <- file("build-knit.txt", open = "wt", encoding = "UTF-8")
sink(knit_log, type = "output")
sink(knit_log, type = "message")
result <- tryCatch(
  bookdown::render_book("index.Rmd", quiet = FALSE),
  error   = function(e) e,
  warning = function(w) w
)
sink(type = "message")
sink()
close(knit_log)

if (inherits(result, "error")) {
  say("")
  say("!!! BUILD FAILED !!!")
  say("")
  say("MESSAGE: ", conditionMessage(result))
  say("CALL   : ", paste(deparse(conditionCall(result)), collapse = " "))
} else if (inherits(result, "condition")) {
  say("Stopped on a condition: ", conditionMessage(result))
} else {
  say("BUILD SUCCEEDED. Output in docs/")
}

knit_lines <- if (file.exists("build-knit.txt")) readLines("build-knit.txt", warn = FALSE) else character(0)
say("")
say("== LAST 60 LINES OF KNIT OUTPUT ==")
say(paste(utils::tail(knit_lines, 60), collapse = "\n"))

writeLines(report, "build-log.txt", useBytes = TRUE)
cat("\n---\nWritten to build-log.txt\n")
