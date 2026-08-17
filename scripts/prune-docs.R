# ---------------------------------------------------------------------------
#  prune-docs.R — find (and optionally delete) files in docs/ that the book
#  does not produce any more.
#
#  Why this exists: bookdown writes the pages and figures the book has right
#  now. It never removes what it wrote last time. Rename a section and the old
#  page keeps sitting in docs/ and keeps being served by GitHub Pages, with the
#  old text. Label a chunk and the old figure file stays behind for ever.
#
#  Usage, from the project root (the folder with becomingfluent.Rproj):
#
#      source("scripts/prune-docs.R")   # renders, then REPORTS only
#      prune_docs(delete = TRUE)        # renders, then deletes
#
#  Method, in two steps:
#
#  1. Timestamp. Note the time, do a full render, and anything in docs/ older
#     than that moment was not written by this build.
#
#  2. Reference check, for everything that is not an HTML page. A CSS file, a
#     figure or a JavaScript library may be old on disk and still be linked
#     from a freshly written page. Those are kept. Only assets that no current
#     page mentions are offered for deletion. HTML pages need no such check:
#     a page that this build did not write is not part of the book.
# ---------------------------------------------------------------------------

# Files in docs/ that bookdown does NOT produce and that must survive
# everything. Losing CNAME takes the custom domain down, so this is not
# optional.
docs_keep <- c(
  "CNAME",        # becoming-fluent-in-data.com
  ".nojekyll",    # tells GitHub Pages not to run Jekyll over the output
  "404.html",     # the not-found page GitHub Pages serves
  "video"         # video/Data.mp4 is referenced only from commented-out HTML,
  # so a render does not copy it back
)

prune_docs <- function(delete = FALSE, docs = "docs", keep = docs_keep,
                       render = TRUE) {
  
  stopifnot(dir.exists(docs))
  
  started <- Sys.time() - 5
  
  if (render) {
    message("Rendering the whole book. This takes a while.")
    bookdown::render_book("index.Rmd", quiet = FALSE)
  }
  
  # --- everything in docs/, minus the protected entries ---------------------
  all_files <- list.files(docs, recursive = TRUE, all.files = TRUE, no.. = TRUE)
  protected <- vapply(
    all_files,
    function(f) any(f == keep | startsWith(f, paste0(keep, "/"))),
    logical(1)
  )
  candidates <- all_files[!protected]
  
  # --- step 1: not written by this build ------------------------------------
  stale <- candidates[file.mtime(file.path(docs, candidates)) < started]
  
  if (!length(stale)) {
    message("docs/ is clean: every file was written by this build.")
    return(invisible(character(0)))
  }
  
  is_page <- grepl("\\.html$", stale) & !grepl("/", stale)
  stale_pages  <- stale[is_page]
  stale_assets <- stale[!is_page]
  
  # --- step 2: is a stale asset still linked from a current page? -----------
  live_pages <- setdiff(
    list.files(docs, pattern = "\\.html$", full.names = TRUE),
    file.path(docs, stale_pages)
  )
  haystack <- paste(
    unlist(lapply(live_pages, function(p) readLines(p, warn = FALSE))),
    collapse = "\n"
  )
  
  referenced <- vapply(
    stale_assets,
    function(f) grepl(basename(f), haystack, fixed = TRUE),
    logical(1)
  )
  
  kept_assets <- stale_assets[referenced]
  dead_assets <- stale_assets[!referenced]
  doomed      <- c(stale_pages, dead_assets)
  
  # --- report ---------------------------------------------------------------
  show <- function(title, x) {
    if (!length(x)) return(invisible(NULL))
    kb <- round(file.size(file.path(docs, x)) / 1024)
    message("\n", title, "  (", length(x), " files, ",
            format(round(sum(kb) / 1024, 1), nsmall = 1), " MB)\n")
    print(utils::head(data.frame(file = x, KB = kb, row.names = NULL), 40))
    if (length(x) > 40) message("... and ", length(x) - 40, " more")
  }
  
  show("PAGES the book no longer produces", stale_pages)
  show("ASSETS that no current page links to", dead_assets)
  
  if (length(kept_assets)) {
    message("\nKEPT: ", length(kept_assets),
            " old file(s) are still linked from a current page. ",
            "Not deleted:")
    print(utils::head(kept_assets, 20))
  }
  
  if (!delete) {
    message(
      "\nReport only. To remove the two groups above:  prune_docs(delete = TRUE)\n",
      "Then commit the deletions, otherwise GitHub Pages keeps serving them:\n",
      "    git add -A docs && git commit -m \"Remove stale output from docs/\""
    )
    return(invisible(doomed))
  }
  
  file.remove(file.path(docs, doomed))
  
  # empty directories left behind by the deletions
  dirs <- list.dirs(docs, recursive = TRUE, full.names = TRUE)
  for (d in rev(dirs[order(nchar(dirs))])) {
    if (length(list.files(d, all.files = TRUE, no.. = TRUE)) == 0) unlink(d, recursive = TRUE)
  }
  
  message("\nDeleted ", length(doomed), " file(s). Now commit:\n",
          "    git add -A docs && git commit -m \"Remove stale output from docs/\"")
  invisible(doomed)
}

# Sourcing the file runs the safe version.
if (sys.nframe() == 0L || identical(environment(), globalenv())) {
  prune_docs(delete = FALSE)
}
