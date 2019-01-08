Week 1: GitHub and sharing your science
========================================================
author: Kevin Thornton
date: Tuesday, January 8, 2019
autosize: true

Welcome to the course
========================================================

Weeks 1-5 cover methods for "reproducible science".

The remaining weeks cover applying those tools to some specific data analysis tasks that Tony will come up with.

Reproducible science
========================================================

* There has been a lot of talk about the [replication crisis](https://en.wikipedia.org/wiki/Replication_crisis) in the social sciences
* More generally, we have an ethical obligation to make our protocols available
* In the past, that meant literal lab protocols.  
* These days, it also includes computational workflows

A purely selfish motivation
========================================================

Pure self-interest is a sufficient motivation to adopt reproducible workflows:

* Forces you to "up your game".  If you act like someone may read your code, that should at least pressure/shame you into being better organized!
* You **will** have to revisit your old scripts, etc., so it is a huge time saver for them to be collected/somewhat documented.

What reproducible science is NOT
======================================================

* Making your code "easy" for someone else to use.  
* Easy is relative.  
* Also, it is likely that the code for your current project is your first attempt.  Once the paper is out, if you had to redo it all, you'd probably find a way to streamline it by 90%, thus making it "easier".

The point is to put what you used out there.  It may have horribly complex dependencies, or the scripts may only apply to your cluster system, etc..  That is fine.

Science is changing
========================================================

* Journals are requiring code along with submitted papers.  What "code" means varies from place to place.  For example, it often won't include the R scripts used for plotting.
* You should prepare for a world where your papers are editorially rejected if the code repository is not public at the time of submission. (We already do this at [G3](www.g3journal.org))
* These changes are hitting the field of evolutionary genetics first.  More traditional molecular fields will be much slower to adopt this, largely for cultural reasons, but it is coming.

Your responsibilities
=========================================================
(Not everyone agrees with me on this, but I'm right.)

* Respond to inquiries about the code associated with your paper.  Use the README to describe your preferred method of communication.
* Fixing bugs is up to you.  The decision is: is the code a "software package" or is it "the stuff we ran to get the job done"?  The former implies a higher standard.  But, a real bug means there may be a problem with your paper that someone found, and that is a *good thing*.
* Version numbers
* Licences

What if you leave academic science?
===========================================================
(Not everyone agrees with me on this, but I'm super-duper right.)

If your PI cites a grant number in your publication, then your PI assumes responsibility for the code associated with your project.  Again, there is a distinction between a "software tool/package" and a "collection of scripts", and the standard is higher for the former.

I am guessing that your PI will not be happy when you go tell them this, but these are the same responsibilites as for wet lab protocols :).

Why is this an issue?
==================================================================

* Vaporware is the norm, sadly.  The approaches taken to publishing software tools is rather broken, and will not change until funding agencies make some changes.  A big issue is different subdiscipline-specific norms.
* Go through Nature Communications and Nature Methods and try to figure out how many "methods tools" you can actually download.  How may even compile?  Can you contact the authors?

Version numbers
=====================================================================

* You really should give a version number to the version of the code that exists when the paper is finally accepted.
* I use 0.1.0, and say "this is the published version" in the release comments.
* Ideally, you'd note this in the paper itself.
* [Example.](https://github.com/molpopgen/fwdpp/releases/tag/0.2.4)  This is not easy to discover, as there have been dozens of later release, but it is *discoverable*, and it is noted in the paper.

Licenses
=======================================================================
(I am not a lawyer.  The UC may disagree with my recommendations.)

* You should provide a license with your code.  Especially if the code is a tool (as opposed to collection of scripts).
* If the work is supported by a grant (and even if it isn't), that license should be open source.  There are many out there, and all that I am really allowed to do is tell you to research them on your own.  You also should discuss this with your PI, who has likely never thought of this.

Let's  get practical
=================================================================

Now, I am going to show you the source code for these slides, upload them to GitHub via a pull request, add a license for them, and make all of this available on the course website!
