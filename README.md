# Philomusica website

## Introduction

This repository contains the content, code and configuration for the [Philomusica website](https://philomusica.org.uk). The website is built using the static site generator [Hugo](https://gohugo.io/) and is hosted through [AWS](https://aws.amazon.com/). This guide covers what site generators are and why I have chosen to create the website this way, the setup process for Hugo and AWS, and how to maintain the Philomusica website. Most of the complexity is in the initial setup which will have already been taken care of. Assuming the site is running smoothly, the job of updating the site should be relatively straightforward. If you have any questions or issues, please feel free to get in touch. You can do this by creating an issues [here](https://github.com/jgcrunden/philomusica-website/issues). Maintaining this site might seem daunting, but it isn't as difficult as it may initially appear. To quote the Hitchhiker's Guide to the Galaxy, DON'T PANIC!

### Email service
The email service is not configred here; this is just the website. I have set up Philomusica emails to the @philomusica.org.uk domain through [One.com](https://one.com).

## Why a static site generator?
There are many different ways to create and host a website. To explain why I chose a static site generator, here is an summary of the different options available. Generally speaking there are two types of websites, dynamic and static.

#### Dynamic websites
Dynamic websites work as follows. When a user visits a dynamic site the web server (where the website is hosted) receives the request, various bits of server code perform logic and the content (i.e. all the text, images etc.) are retrieved from a database. The server constructs the website on the fly, combining the static aspects (the theme and functionality) with the content from the database. This constructed website mainly comprises three types of files: namely HTML, CSS and JavaScript. HTML files contain the websites content (text, images, links etc.) in a structured format (as an analogy to grammar these are your 'nouns', the 'things' on your site). CSS controls the style: font type, sizing, colours, spacing and layout (in grammar terms the 'adjectives', ways of describing and decorating the nouns). JavaScript makes the site interactive by reacting to the user's input (submitting forms) and performing actions both immediately visible (a moving thing on the site) and more behind the scenes (making requests to external resources) (in grammar terms the 'verbs'). Once constructed, it is sent to the users browser which converts the HTML, CSS and JavaScript files into the nice website that the user sees.
Dynamic sites are useful in social media and internet shopping cases where the content changes depending on who you are, what you are searching for, and (in the case of social media) what posts your friends have made. This technology also underpines all website-building services such has Wordpress, Wix, Squarespace, GoDaddy etc. With these services you use an easy-to-use editor to create and edit content. When you click "Publish", your content is then written to a database and retrieved in exactly the same way described above. Behind the scenes, your Squarespace site advertising your choir (for example) is a dynamic website. But chances are, unlike social media platforms and internet shopping, from the user's perspective the site is static; you don't get completely different content depending on who you are, when you are accessing it and what you are looking for.

#### Static sites
A static site in some ways is much simpler. A web developer will write all the HTML, CSS and JavaScript beforehand and upload it to the web server. It's static, the files have already been written and don't change unless the developer manually changes the files and re-uploads them. When a user visits the site, the web server's only job is to return the ready-made HTML, CSS and JavaScript.

### Pros and Cons of both
#### Dynamic
Pros
- A website-builder (dynamic) is very easy to use. You don't have to be technical to create and maintain these sites.
Cons
- Dynamically generating sites is more resource intensive so normally means your website is slower at loading and will cost more in computing power.
- When using a website-builder like Squarespace, you are paying for the convenience of an easy-to-use editor and all the administration that happens behinds the scences, therefore is often more expensive
- Following on from that, website building services often place restrictions on you which they only remove if you pay a high subscription
- Dynamic sites are often less secure. More moving parts means more potential vulnerabilities for a hacker to exploit. The database will always be a big target as it could hold sensitive information, and because pages are generated on the fly it opens the possibility of hacker injecting malicious code as pages are created.

#### Static
Pros
- It's very fast. The server just needs to hand out pre-created pages.
- As the server only needs to hand out pages, it requires much less computing power and is therefore cheaper.
- It's often more secure. The webpages have already been written by the developer, so code injection is much harder to do, and there is no database to hack.
- You need to create the website from scratch so have no restrictions associated with website-builders.
Cons
- It's very time consuming and you need to know how to code.

### Enter Hugo - a static site generator
This is a great middle ground between the two options mentioned above. It's a free and [open-source](https://opensource.com/resources/what-open-source) tool which in some ways works like a website builder. You as the creator add your content and then Hugo combines your content and the static aspects (the theme and functionality) to construct your website, the end product being HTML, CSS and JavaScript files. The big difference is this construction happens once, when the creator runs the Hugo programme, just before uploading the resulting static site to the websever. As it's a static site it has all the benefits of one. Moreover, because it generates the HTML, CSS and JavaScript files for you, you don't need to know how to code to create your site. You add your content to markdown files ((with .md extension) which are just text files with a few very simple syntax conventions. Hugo uses your markdown files and does the coding for you.
Your website is stylised through themes. There are many [ready-made Hugo themes](https://themes.gohugo.io/) you can use. Alternatively you can create your own theme, however it does require coding knowledge. For the Philomusica site, I have already coded the theme which means, as the website maintainer, you only need to worry about the easy part of creating and editing content through markdown. However, if you are willing and able, you are very welcome to make changes to the theme as you see fit.

### What is GitHub?
You are most likely reading this guide on the GitHub website. GitHub is essentially a place to store files in the cloud, like iCloud, Google Drive, Microsoft's OneDrive or Dropbox. In GitHub your storage area is called a repository, which can contain files and folders (sometimes called directories). GitHub allows for multiple, distinct repositories for different pieces of work. One of the areas where it differs from the aforementioned cloud storage services is that it is underpinned by another open-source tool called Git.
Git is a version control system that tracks changes to files and is primarily used by software developers. If you want to make a change to file and save it while keeping a record of your previous changes, it's tempting to create a new file, appending it with something like "version 2". However it soon becomes unmanageable and duplicate copies take up lots of storage. 
Enter Git. When you save a change to a file you create a snapshot or (to use the correct terminology) a "commit". That way, there is always just one copy of your file but multiple snapshots documenting all the changes you've made. But as software development often involves multiple, interconnected files, the commit will be a snapshot not just of an individual file, but of the whole repository at the time the save and commit was made. This way it's very easy to see the development of a project over time and (more importantly) to be able to revert back to a previous version if and when mistakes happen.
As commits are snapshots of a repository as changes are made to it, the linear nature introduces a concept of "branches". All commits belong to a branch. All git repositories have a base branch, often called "master" or "main", which by convention represents the stable, production-ready version of your code. While it is possible to commit directly to this base branch when making changes to your repository, it is ill-advised as it means directly changing this stable version. Instead, it is good practice to create a new branch that branches off of master. When making changes these are committed to the new branch and only once it has been tested/reviewed is it "merged" back into master. 
These are the basics of git. There are lots of guides including [this one](https://guides.github.com/introduction/git-handbook/) from GitHub.

### How to use GitHub to edit the website
As a software developer, you ordinarily make changes to your code on your own computer and use Git to create commits, then push those changes to GitHub. You are very welcome to work on the Philomusica website this way, but it does require knowledge of the command-line (think MS-DOS) and can get a little complicated. I instead propose that you edit the files directly within GitHub. When you save the files this way, it creates commits for you and takes the complicated part out of your hands.
Here are a list of steps to take when making changes to the site
1. Click on the "master" button in the top left with the downwards arrow to change branch
2. Where it says "Find or create a branch..." type a name for the branch you wish to create. It can be called anything, but something short and descriptive of the change you will be making is useful.
3. Click the "Create branch: ... from master" button that appears below
4. Confirm the button in the top left now has the name of your branch with a downards arrows.
5. From the list of files below, click on the one you wish to create. If you want to create a file click the "Add file" in the top right
6. If you are editing an existing file, click on the pencil in the top right of the subsequent screen.
7. Edit the file and when you are done, scroll to the button.
8. In the "Commit changes" section, in the top, single-line field, type write a short, descriptive message explaining the changes you are making.
9. Ensure "Commit directly to the YOUR-BRANCH branch" radio button is checked, where YOUR-BRANCH is the name of the branch you just created.
10. Click "Commit changes"
11. Repeat 5-10 for all the changes you wish to make.
12. When you are ready for the changes to go live, click on the Pull Requests tab at the top and click "New Pull Request".
13. Ensure "master" is selected for base and your new branch is selected for compare, the click "Create Pull Request".
14. Your changes are now in the review stage. When anyone clicks the "merge" button on the pull request, the changes are merged into master and the automation I have set up will automatically deploy the latest change to AWS, where it will be visible on the Philomusica website.

### Getting the changes to the web server
Right you've made those changes to the content. How do you get them into AWS.
