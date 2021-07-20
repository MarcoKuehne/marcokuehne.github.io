
## Welcome to My GitHub Pages / Bookdown

You can use the [editor on GitHub](https://github.com/MarcoKuehne/marcokuehne.github.io/edit/main/README.md) to maintain and preview the content for your website in Markdown files. Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

## Install Github and Git

- Get RStudio https://www.rstudio.com/products/rstudio/download/
- Get Github account <https://github.com/>
- Set up Github pages <https://pages.github.com/>
- Download Git <https://git-scm.com/>

Create a "special repository" for GitHub Pages. Only this can turn the branch into docs.

    Repository: https://github.com/MarcoKuehne/marcokuehne.github.io
    Homepage: https://marcokuehne.github.io/

Create (or re-open) your R project inside RStudio. 

In R console use `usethis::use_git()` which always gives three different answers in random order. Confirm accordingly.

## Working with Git

### Initialize 

First, configure github user information on your system. Use the R builtin terminal:

`git config --global user.email MAIL`
`git config --global user.name NAME`

Now, you can commit (upload) changes from RStudio to Github Pages.

### Some work routine

I make changes to the `README.md` via GitHub web interface. I need to `pull` these changes into RStudio. Check the right upper panel "Diff". Select `pull`.

Some more git commands for the terminal:

git init
git add .

<https://rachaellappan.github.io/bookdown/>

git commit -m "Started book"

I followed the video "How to create a bookdown book in 5 minutes":

<https://www.youtube.com/watch?v=m5D-yoH416Y>

It did not work. Next, 

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/MarcoKuehne/marcokuehne.github.io/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Upload New Stuff from RStudio 

Let's give it a try. 

### Bookdown

This is a minimal example of a book based on R Markdown and **bookdown** (https://github.com/rstudio/bookdown). Please see the page "Get Started" at https://bookdown.org/home/about/ for how to compile this example.

## Upload Routine

