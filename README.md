# TAK-Server-10-Minute-Installs
This repo helps you script your way to fast TAK Server installs on Rocky Linux 8.  Credit to [@misterdallas](https://github.com/misterdallas) for writing the original script that is the baseline for this one.  I'm just adding a couple of up-front steps that will help taylor your script to your needs.  You'll need to be somewhat familiar with Google Drive, Github, and some basic Linux command line work.  My baseline is working on a Windows 10 machine, and my TAK Server is on an [SSDNodes VPS](https://www.ssdnodes.com/manage/aff.php?aff=1554).  (Full disclosure: Above is a referral link.  Just search for "SSDNodes" if you feel _sold-out_ for some reason.

# Why?
When learning certs or experimenting with TAK Server configurations, it's just cleaner and easier to tear it all down and start over.  After a few times, I figured I just don't need to practice TAK Server installs anymore.  I got that down now, so let's go for less typing!  If you succeed here, 

# How?
How, indeed.  Let's get started.

# Prerequisites
### 1. Account on https://tak.gov (yes, you can sign up with a gmail account) 
   - Download the latest TAK Server rpm file (non-docker, single-install, non-hardened) 
   - Look for RHEL, ROCKY LINUX, & CENTOS 
   - As of this writing, we're using `takserver-4.8-RELEASE31.noarch.rpm` 
### 2. Google Drive 
   - Create a folder just for the above TAK Server file you downloaded and save the rpm to it. 
   - Set permissions to the file for "Anyone with the link" 
   - Copy down the link somewhere handy (I use Notepad) 
### 3. Github 
    - Create a repository and set it to private (Example: "TS-Install") 
    - You can also copy this repo to your git, rename, and set private.  Up to you.
    - Generate a fine-grained personal access token and copy that to your notes. 

# Let's do this

Open the serverinstallscript.sh file and edit it. 
Goto the section: 
```# Begin Google Drive TAK Server download

gdown [paste your g-drive file ID here - remove the brackets]```



