# Keeps DESCRIPTION honest.
#
# Scans every .Rmd in the project for library(pkg) and pkg::function() calls,
# compares the result with the Imports/Suggests fields of DESCRIPTION, and
# reports both directions: packages used but not listed, and packages listed
# but no longer used.
#
# Run from the project root:  source("scripts/update-dependencies.R")

library(stringr)

rmd <- list.files(".", pattern = "\\.Rmd$", full.names = TRUE)
code <- unlist(lapply(rmd, readLines, warn = FALSE))

# library(pkg) / require(pkg), with or without quotes
from_library <- str_match(code, '(?:library|require)\\(\\s*"?([A-Za-z][A-Za-z0-9._]*)"?')[, 2]

# pkg::function()
from_colons <- unlist(str_extract_all(code, "\\b[A-Za-z][A-Za-z0-9._]*(?=::)"))

# Base packages need no entry in DESCRIPTION.
base_pkgs <- rownames(installed.packages(priority = "base"))

used <- sort(unique(na.omit(c(from_library, from_colons))))
used <- setdiff(used, base_pkgs)

desc <- read.dcf("DESCRIPTION")
listed <- unlist(strsplit(paste(desc[, intersect(colnames(desc),
                                                 c("Imports", "Suggests"))],
                                collapse = ","), ","))
listed <- sort(unique(str_squish(str_remove(listed, "\\(.*"))))
listed <- listed[listed != ""]

missing <- setdiff(used, listed)
unused  <- setdiff(listed, used)

cat("\npackages used in .Rmd :", length(used),
    "\npackages in DESCRIPTION:", length(listed), "\n")

cat("\nMISSING from DESCRIPTION (add these to Imports):\n")
if (length(missing)) cat(paste(" -", missing, collapse = "\n"), "\n") else
  cat("  none\n")

cat("\nListed but no longer used (candidates for removal):\n")
if (length(unused)) cat(paste(" -", unused, collapse = "\n"), "\n") else
  cat("  none\n")

# Which of the required packages are not installed on THIS machine?
not_installed <- setdiff(used, rownames(installed.packages()))

cat("\nNot installed here (the book will fail to render):\n")
if (length(not_installed)) {
  cat(paste(" -", not_installed, collapse = "\n"), "\n")
  cat('\n  install.packages(c("', paste(not_installed, collapse = '", "'),
      '"))\n', sep = "")
} else {
  cat("  none\n")
}
