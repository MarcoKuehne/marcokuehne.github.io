
## Welcome to My GitHub Pages / Bookdown

You can use the [editor on GitHub](https://github.com/MarcoKuehne/marcokuehne.github.io/edit/main/README.md) to maintain and preview the content for your website in Markdown files. Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

## Install Github and Git

- Get RStudio https://www.rstudio.com/products/rstudio/download/
- Get Github account <https://github.com/>
- Set up Github pages <https://pages.github.com/>
- Download Git <https://git-scm.com/>

## Working with Git

Create a "special repository" for GitHub Pages. Only this can turn the branch into docs.

    Repository: https://github.com/MarcoKuehne/marcokuehne.github.io
    Homepage: https://marcokuehne.github.io/

Create an R project. Remember each Rmd file contains one and only one chapter, and a chapter is defined by the first-level heading #.

In R console use usethis::use_git(). Always gives three different answers. Confirm accordingly.

I followed the video "How to create a bookdown book in 5 minutes":

<https://www.youtube.com/watch?v=m5D-yoH416Y>

It did not work. Next, configure github user information on my system. Use the R builtin terminal:

git config --global user.email MAIL 
git config --global user.name NAME  

Now, I can commit (upload) changes from RStudio to my Github pages.

Some more git commands for the terminal:

git init
git add .

<https://rachaellappan.github.io/bookdown/>

git commit -m "Started book"



### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/MarcoKuehne/marcokuehne.github.io/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### New Stuff

I can upload html markdown files and link them as a sub-page, e.g.

[First Regression](https://marcokuehne.github.io/FirstRegression.html)

### Upload New Stuff from RStudio 

Let's give it a try. 

### Bookdown

This is a minimal example of a book based on R Markdown and **bookdown** (https://github.com/rstudio/bookdown). Please see the page "Get Started" at https://bookdown.org/home/about/ for how to compile this example.


