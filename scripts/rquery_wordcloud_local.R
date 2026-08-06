# Local replacement for the former remote helper
# http://www.sthda.com/upload/rquery_wordcloud.r
#
# This file intentionally has no network dependency. It implements the subset
# of rquery.wordcloud() used by index.Rmd and remains useful for text/file input.

rquery.wordcloud <- function(x,
                             type = c("text", "file", "url"),
                             lang = "english",
                             min.freq = 1,
                             max.words = 200,
                             colorPalette = "Dark2",
                             excludeWords = NULL,
                             stem = FALSE,
                             scale = c(4, 0.5),
                             random.order = FALSE,
                             rot.per = 0.35,
                             ...) {
  type <- match.arg(type)

  required <- c("wordcloud", "RColorBrewer")
  missing_packages <- required[
    !vapply(required, requireNamespace, quietly = TRUE, FUN.VALUE = logical(1))
  ]
  if (length(missing_packages) > 0L) {
    stop(
      "Missing package(s): ", paste(missing_packages, collapse = ", "),
      ". Install them before rendering the book.",
      call. = FALSE
    )
  }

  text <- switch(
    type,
    text = as.character(x),
    file = {
      if (length(x) != 1L || !file.exists(x)) {
        stop("Word-cloud input file does not exist: ", paste(x, collapse = ", "), call. = FALSE)
      }
      readLines(x, warn = FALSE, encoding = "UTF-8")
    },
    url = {
      if (length(x) != 1L) {
        stop("For type = 'url', x must contain exactly one URL.", call. = FALSE)
      }
      tryCatch(
        readLines(x, warn = FALSE, encoding = "UTF-8"),
        error = function(e) {
          stop("Could not read word-cloud URL: ", conditionMessage(e), call. = FALSE)
        }
      )
    }
  )

  text <- enc2utf8(paste(text, collapse = " "))
  text <- tolower(text)
  text <- gsub("https?://[^[:space:]]+", " ", text)
  text <- gsub("[[:digit:]]+", " ", text)
  text <- gsub("[^[:alpha:]À-ÖØ-öø-ÿ'’-]+", " ", text, perl = TRUE)
  text <- gsub("['’]", "", text)
  words <- unlist(strsplit(text, "[[:space:]]+", perl = TRUE), use.names = FALSE)
  words <- words[nzchar(words)]

  stop_words <- character()
  if (requireNamespace("tm", quietly = TRUE)) {
    stop_words <- tryCatch(tm::stopwords(lang), error = function(e) character())
  }
  if (length(stop_words) == 0L && identical(tolower(lang), "english") &&
      requireNamespace("tidytext", quietly = TRUE)) {
    stop_words <- unique(tidytext::stop_words$word)
  }
  if (length(stop_words) == 0L && identical(tolower(lang), "english")) {
    stop_words <- c(
      "a", "an", "and", "are", "as", "at", "be", "by", "for", "from",
      "has", "he", "in", "is", "it", "its", "of", "on", "that", "the",
      "to", "was", "were", "will", "with", "i", "you", "we", "they"
    )
  }

  excluded <- unique(tolower(c(stop_words, excludeWords)))
  words <- words[!(words %in% excluded)]

  if (isTRUE(stem)) {
    if (!requireNamespace("SnowballC", quietly = TRUE)) {
      stop("Package 'SnowballC' is required when stem = TRUE.", call. = FALSE)
    }
    words <- SnowballC::wordStem(words, language = lang)
  }

  if (length(words) == 0L) {
    warning("No words remain after cleaning; no word cloud was drawn.", call. = FALSE)
    return(invisible(list(words = character(), frequencies = integer())))
  }

  frequencies <- sort(table(words), decreasing = TRUE)
  frequencies <- frequencies[frequencies >= min.freq]
  if (length(frequencies) == 0L) {
    warning("No words meet min.freq = ", min.freq, "; no word cloud was drawn.", call. = FALSE)
    return(invisible(list(words = character(), frequencies = integer())))
  }

  palette_info <- RColorBrewer::brewer.pal.info
  if (!colorPalette %in% rownames(palette_info)) {
    warning("Unknown RColorBrewer palette '", colorPalette, "'; using 'Dark2'.", call. = FALSE)
    colorPalette <- "Dark2"
  }
  palette_size <- min(8L, palette_info[colorPalette, "maxcolors"])
  palette_size <- max(3L, palette_size)
  colors <- RColorBrewer::brewer.pal(palette_size, colorPalette)

  wordcloud::wordcloud(
    words = names(frequencies),
    freq = as.numeric(frequencies),
    scale = scale,
    min.freq = min.freq,
    max.words = max.words,
    random.order = random.order,
    rot.per = rot.per,
    colors = colors,
    ...
  )

  invisible(list(
    words = names(frequencies),
    frequencies = as.numeric(frequencies)
  ))
}
