
## Welcome to My GitHub Pages / Bookdown

You can use the [editor on GitHub](https://github.com/MarcoKuehne/marcokuehne.github.io/edit/main/README.md) to maintain and preview the content for your website in Markdown files. Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

## Bookdown

This is a minimal example of a book based on R Markdown and **bookdown** (https://github.com/rstudio/bookdown). Please see the page "Get Started" at https://bookdown.org/home/about/ for how to compile this example.

## Install Github and Git

- Get RStudio https://www.rstudio.com/products/rstudio/download/
- Get Github account <https://github.com/>
- Set up Github pages <https://pages.github.com/>
- Download Git <https://git-scm.com/>

Create a "special repository" for GitHub Pages. Only this can turn the branch into docs (1 for free).

    Repository: https://github.com/MarcoKuehne/marcokuehne.github.io
    Homepage: https://marcokuehne.github.io/

Create (or re-open) your R project inside RStudio. 

In R console use `usethis::use_git()` which always gives three different answers in random order. Confirm accordingly.

## Working with Git

Use the terminal inside RStudio. Copy paste into terminal with: `CTRL + SHIFT + V`.

### Configuration 

First, configure github user information on your system. Use the R builtin terminal:

- `git config --global user.email MAIL`
- `git config --global user.name NAME`

Now, you can commit (upload) changes from RStudio to Github Pages.

### Basic Work Routine

Make changes to the `README.md` via GitHub web interface. I need to `pull` these changes into RStudio. Check the right upper panel "Diff". Select `pull`. You can also find big blue down and green up arrows. 

I add this sentence. I save on RStudio, thus it appears as a change to `README.md` in the Git panel. I select this file and green up arrow (push). I enter my credentials and close (see <https://docs.github.com/en/get-started/getting-started-with-git/why-is-git-always-asking-for-my-password>). Here you might use a personal access token. I click `commit`, enter a commit message, click `commit` again and close the extra window. 

### git init

Use `git init` to initialize the repository. It is used to create a new empty repository or directory consisting of files' with the hidden directory. '.git' is created at the top level of your project, which places all of the revision information in one place.

Show what is connected with `git remote -v show`

### git remote add

I would like to have something like `git remote add ...` and `git push ...`, not working.

I can add and remove origins, dont know what it means: `git remote rm origin`

Use git add . in your bash to add all the files to the given folder.

Use git status in your bash to view all the files which are going to be staged to the first commit.

Create **git remote add**

git remote add origin https://github.com/MarcoKuehne/marcokuehne.github.git 
git remote add origin https://github.com/MarcoKuehne/marcokuehne.github.io
git remote add origin https://github.com/MarcoKuehne/marcokuehne.github.io.git

git remote add git@github.com:<username>/<repository-name>.git
git remote add git@github.com:MarcoKuehne/marcokuehne.github.git
git remote add git@github.com:MarcoKuehne/marcokuehne.github.io does not appear to be a repository 
git remote add git@github.com:MarcoKuehne/marcokuehne.github.io.git combine both 

### git push 

git push -u origin main
git push -u origin master
git push origin master
git push origin main 
git push --set-upstream origin main
git push -f origin main # worked somehow!!!

If positive, it asks for github credentials. 

<https://www.datacamp.com/community/tutorials/git-push-pull>


## Resources

### Easy 

Start a repo and book by copying "awesome book" from another repo.

<https://jules32.github.io/bookdown-tutorial/setup.html>

This tutorial worked to push a book to a standard repo. But there were problem with the doc branch.

After I forgot how to start my project or where to find it, I checked:

<https://happygitwithr.com/rstudio-git-github.html#make-local-changes-save-commit>

started a new project with my repo link and a new session. This forks or fetches or pulls or downloads the repo. Now I will try to re-upload the minimal change from today. 

Another personal description can be found here:

<https://rachaellappan.github.io/bookdown/>

### Difficult

<https://bookdown.org/yihui/bookdown/github.html>

- `git commit -m "Started book"`

I followed the video "How to create a bookdown book in 5 minutes":

<https://www.youtube.com/watch?v=m5D-yoH416Y>

It did not work. Next, 

## Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/MarcoKuehne/marcokuehne.github.io/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

## Upload New Stuff from RStudio 

Let's give it a try. 



First, I registered at github and created a special repository for github pages. Only this can turn the branch into docs.

- Repository: <https://github.com/MarcoKuehne/marcokuehne.github.io>
- Homepage: <https://marcokuehne.github.io/>

Create an R project. Remember each Rmd file contains one and only one chapter, and a chapter is defined by the first-level heading `#`.

<!-- To compile this example to PDF, you need XeLaTeX. You are recommended to install TinyTeX (which includes XeLaTeX): <https://yihui.org/tinytex/>. -->

```{r include=FALSE}
# automatically create a bib database for R packages
knitr::write_bib(c(
  .packages(), 'bookdown', 'knitr', 'rmarkdown'
), 'packages.bib')
```

In R console use `usethis::use_git()`. Always gives three different answers. Confirm accordingly.


# Something else


You can label chapter and section titles using `{#label}` after them, e.g., we can reference Chapter \@ref(intro). If you do not manually label them, there will be automatic labels anyway, e.g., Chapter \@ref(methods).

Figures and tables with captions will be placed in `figure` and `table` environments, respectively.

```{r nice-fig, fig.cap='Here is a nice figure!', out.width='80%', fig.asp=.75, fig.align='center'}
par(mar = c(4, 4, .1, .1))
plot(pressure, type = 'b', pch = 19)
```

Reference a figure by its code chunk label with the `fig:` prefix, e.g., see Figure \@ref(fig:nice-fig). Similarly, you can reference tables generated from `knitr::kable()`, e.g., see Table \@ref(tab:nice-tab).

```{r nice-tab, tidy=FALSE}
knitr::kable(
  head(iris, 20), caption = 'Here is a nice table!',
  booktabs = TRUE
)
```

You can write citations, too. For example, we are using the **bookdown** package [@R-bookdown] in this sample book, which was built on top of R Markdown and **knitr** [@xie2015].

  <script type="text/javascript" src="https://ssl.gstatic.com/trends_nrtr/2578_RC01/embed_loader.js"></script>
  <script type="text/javascript">
    trends.embed.renderExploreWidget("TIMESERIES", {"comparisonItem":[{"keyword":"homeoffice","geo":"DE","time":"today 5-y"}],"category":0,"property":""}, {"exploreQuery":"date=today%205-y&geo=DE&q=homeoffice","guestPath":"https://trends.google.de:443/trends/embed/"});
  </script>
  


