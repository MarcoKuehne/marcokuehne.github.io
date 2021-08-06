
## Welcome to My GitHub Pages / Bookdown

You can use the [editor on GitHub](https://github.com/MarcoKuehne/marcokuehne.github.io/edit/main/README.md) to maintain and preview the content for your website in Markdown files. Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

## Bookdown

This is a minimal example of a book based on R Markdown and **bookdown** (https://github.com/rstudio/bookdown). Please see the page "Get Started" at https://bookdown.org/home/about/ for how to compile this example.

## Install Github and Git

- Get RStudio <https://www.rstudio.com/products/rstudio/download/>
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

### git status and diff

Shows you which files are in this staging area, and which files have changes that haven't yet been put there. In order to compare the file as it currently is to what you last saved, you can use `git diff filename`, e.g. `git diff README.md` in the terminal. `git diff` without any filenames will show you all the changes in your repository, while git diff directory will show you the changes to the files in some directory.


## Resources

You can start reading about bookdowns from the inventor:

<https://bookdown.org/yihui/bookdown/>

This is pretty advanced and I can't understand a tiny piece of it. 

Another option is to start a repo and book by copying "awesome book" from another repo.

<https://jules32.github.io/bookdown-tutorial/setup.html>

This tutorial worked to push a book to a standard repo. But there were problem with the doc branch.

After I forgot how to start my project or where to find it, I checked:

<https://happygitwithr.com/rstudio-git-github.html#make-local-changes-save-commit>

started a new project with my repo link and a new session. This forks or fetches or pulls or downloads the repo. Now I will try to re-upload the minimal change from today. 

Another personal description can be found here:

<https://rachaellappan.github.io/bookdown/>


- `git commit -m "Started book"`

I followed the video "How to create a bookdown book in 5 minutes":

<https://www.youtube.com/watch?v=m5D-yoH416Y>

It did not work.

## Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/MarcoKuehne/marcokuehne.github.io/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

## Upload New Stuff from RStudio 

Let's give it a try. 




