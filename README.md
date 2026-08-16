# Becoming Fluent in Data

**A Personal Journey – Every Time.**

An open textbook on empirical research with R: how data comes to exist, what shape it arrives in, and what can honestly be concluded from it.

📖 **Read it online:** <https://becoming-fluent-in-data.com/>

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Built with bookdown](https://img.shields.io/badge/built%20with-bookdown-blue.svg)](https://bookdown.org/)

---

## About

Most statistics courses start with the test and work backwards. This book starts with the data: where it came from, who decided what to measure, what shape it arrived in, and what it quietly leaves out. Methods appear when a question needs them, and each one is worked through on real data — a stork census, a German household panel, seven cohorts of students, eighty-seven dog breeds — so that every number on the page can be recomputed from the repository.

It is written for two audiences. **Students** get a route from no prior knowledge to reading, producing and criticising empirical work, with interactive exercises in every chapter. **Instructors** get an open educational resource with a modular structure: chapters and sections stand alone well enough to be reordered, excerpted, or dropped into an existing syllabus.

## How the book is organised

| Part | Chapter | Sections |
|:--|:--|:--|
| **Introduction** | Preface · Software | |
| **Data** | 1 Foundations | Data is Everywhere · Stories and Visuals |
| | 2 Structured Data | Tabular · Panel · Time |
| | 3 Unstructured Data | Web · Text · Geo |
| | 4 Imperfect Data | Missing · Synthetic |
| **Analysis** | 5 Compare | Relationships · Comparing Means · Partitioning Variation |
| | 6 Model | Regression · Linear Models · Decomposing Differences · Logistic · Interactions · Marginal Effects · Generalized · Learning from Data · Tests as Linear Models |
| | 7 Structure | Time · Longitudinal · Multilevel · Places |
| | 8 Reveal | Components · Clusters · Latent Variables · Factors · SEM · Items |
| | 9 Identify | Experiments · Matching · Diff-in-Diff · Discontinuities · Instruments |
| | 10 Extract | Text Mining |

The two parts mirror each other: Data asks what a row *means*, Analysis asks what a difference *means*.

## Repository layout

```
index.Rmd              Preface, and the YAML that configures the whole book
Lnn-mm-name.Rmd        Chapter nn, section mm  (mm = 00 is the chapter wrapper)
X-references.Rmd       Bibliography page

_bookdown.yml          Which files are included, and in what order
_output.yml            Output format defaults
                       (note: index.Rmd's own `output:` block wins over this)

css/                   Stylesheets: boxes, animation, layout, TOC
www/  include/         webex.css and webex.js for the interactive exercises
js/                    Collapse, dropdown and code-folding helpers
scripts/webex.R        Loaded before every chapter, sets up webexercises
data/                  All datasets used in the book, by topic
images/                Figures, logo, cover
docs/                  The rendered site — published by GitHub Pages
references.bib         Bibliography
```

Filenames sort in reading order in any file browser: `L06-00-model.Rmd` comes before `L06-01-regression.Rmd`, and the chapter number in the filename is the chapter number in the book.

## Building the book locally

You need [R](https://cloud.r-project.org/) and, for the PDF output, a LaTeX installation ([TinyTeX](https://yihui.org/tinytex/) is the easiest).

```r
# 1. install the toolchain
install.packages(c("bookdown", "rmarkdown", "knitr", "remotes", "tinytex"))

# 2. install every package the chapters use
remotes::install_deps()
```

The second command reads the `Imports:` field of the `DESCRIPTION` file in this repository. That file is the single machine-readable list of dependencies. Keeping the same list by hand in this README turned out to be a reliable way of forgetting a package until a render failed on a fresh machine.

After adding a `library()` call to a chapter, check whether the list is still complete:

```r
source("scripts/update-dependencies.R")
```

It scans every `.Rmd` for `library()` and `package::function()` calls and prints what is missing from `DESCRIPTION`.

Then render:

```r
bookdown::render_book()          # the whole book into docs/
bookdown::serve_book()           # live preview, rebuilds on save
```

To iterate on a single chapter without rebuilding everything, knit its `.Rmd` on its own — but remember that section files are children of their `Lnn-00-*.Rmd` wrapper, so knit the wrapper rather than the section.

Rendering writes to `docs/`, which is what GitHub Pages serves. Commit `docs/` along with your source changes or the published site will not update.

## Configuration notes

**The book's output settings live in `index.Rmd`, not in `_output.yml`.** Because `index.Rmd` declares its own `output: bookdown::gitbook:` block, that block takes precedence. If a change to `_output.yml` seems to have no effect, this is why — edit the YAML in `index.Rmd` instead.

The `includes:` field there pulls in three small HTML fragments:

| File | Where | What it does |
|:--|:--|:--|
| `hypothesis.html` | `in_header` | Loads the Hypothes.is annotation layer, so readers can comment on any paragraph |
| `google_analytics.html` | `in_header` | Google Analytics 4 tag |
| `top_message.html` | `before_body` | The "Work in Progress" banner at the top of every page |

## Feedback

The book is a work in progress and reader feedback shapes it. Select any passage on the site and annotate it with [Hypothes.is](https://web.hypothes.is/), or open an [issue](../../issues) for anything larger — an error in a figure, a dataset that no longer downloads, a section that does not land.

## Citation

> Kühne, M. *Becoming Fluent in Data: A Personal Journey – Every Time.* <https://becoming-fluent-in-data.com/>

## License

Licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/) (CC BY-NC-SA 4.0). See [LICENSE](LICENSE).

You are free to share and adapt this material, provided that you give appropriate credit (**BY**), do not use it commercially without permission (**NC**), and distribute any derivative work under the same licence (**SA**). Educational and personal use is explicitly welcome — that is what it is for.

Datasets in `data/` remain under the licences of their original providers, which are named in the chapter that uses them.
