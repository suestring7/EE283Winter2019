# Open source tools for academics

In practice, much of the day-to-day work in academia relies on non-free software.  This situation is unfortunate for
many reasons.  One reason is an ethical one: if we want our work to be reproducible, requiring that someone use non-free
software (especially software requiring a fee/subscription) becomes a barrier to others reproducing your work.

This page is an incomplete list of open source alternatives to non-free software.

## Alternatives to Microsoft Office

* LaTeX
* pandoc + markdown + bibtex.  Thomas Mailund wrote a very affordable
  [ebook](https://www.amazon.com/Beginners-Guide-Markdown-Pandoc-ebook/dp/B06XYPLZC) on how to use these tools
* Libre Office

### Notes

* Google's tools are available to you via UCI's "Gsuite".  These are free, but not open source.  However, they are more
  than good enough for writing manuscripts, etc.
* One of the biggest challenges for us is maintaining a bibliography.  Lots of tools have come and gone over the years.
  My current favorite is Paperpile, which is a plugin for the Chrome/Chromium browsers.  It is not free, costing $35US
  per year.  This is the best tool that I've used, and I've used most of them at one point or another.  Whatever you do,
  just delete EndNote ASAP.

## Alternatives to Adobe tools

* Photoshop -> GIMP.  Nothing really matches Photoshop's full range of features, but GIMP, especially the recent 2.10
  release, will probably do most of what you need it to.  [This guy](https://www.daviesmediadesign.com/) has really
  amazing video tutorials.  The emphasis is on photography, but much of the material applies to image processing in
  general.
* Illustrator -> Inkscape.  Inkscape is an extremely impressive vector graphics tool.
* Lightroom -> Darktable or RAWTherapee.  The odds are that most of you don't deal with photos in your daily research
  tasks.  If you do, or if photography is a side interest of yours, you can leave Adobe's appalling subscription model
  behind.   These tools also don'y try to make it hard to use alternative cloud storage...

### Rant

I am very much opposed to using tools like these for generating figures for publication.  The problem is
reproducibility.  Nothing is recording all of your mouse clicks as you work, meaning you will likely forget what yhou
did to get that figure looking "just right" two years ago.  (Yes, you will have to remember that stuff--making figures
is one of the most time-consuming parts of the job!)  Having all of your plotting steps in a single R/Python/whatever
script means you can go back and see **exactly** what you did, since you've kept the scripts in the
GitHub/GitLab/Bitbucket/Whatnot repository for your paper.

## Alternatives to Matlab

If your work falls in the ODE/PDE domain, you owe it to yourself to play with the [Julia](https://julialang.org)
language.  Julia is more than an ODE/PDE workhorse, but it eats Matlab's lunch and then kicks sand in its face in this
specific area.  Even if you get Matlab for free via your institution, you can make your work more accessible to the
community by switching over to Julia.
