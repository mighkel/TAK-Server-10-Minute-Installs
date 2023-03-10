# TAK-Server-10-Minute-Installs
This repo is intended to help you script your way to fast TAK Server installs on a Rocky Linux 8 virtual private server (VPS).  Credit to [@misterdallas](https://github.com/misterdallas) for writing and sharing the original script that is the baseline for this one.  I'm just adding a couple of up-front steps that will help taylor _your_ script to _your_ needs.  You'll need to be somewhat familiar with Google Drive, Github, and some basic Linux command line work.  My baseline is working on a Windows 10 machine, SSH into a VPS using Putty, and my TAK Server is installed on an [SSDNodes VPS](https://www.ssdnodes.com/manage/aff.php?aff=1554) G2 Standard/2vCPU/4GBRAM/80GBDisk.  _Full disclosure: Above is a referral link.  Just search for "SSDNodes" if you feel sold-out for some reason._

# Why?
When learning certs or experimenting with TAK Server configurations, sometimes it's just cleaner and easier to tear it all down and start over.  After a few times, I figured I just don't need to practice TAK Server installs anymore.  I got that down now, so let's go for less typing!  Less time installing and re-installing = more time to beat your head against the next wall of learning! 

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
   - Copy down the link somewhere handy (I use Notepad or my private github repo) 
### 3. Github
   - Create a repository and set it to private (Example: "TS-Install") 
   - You can also copy this repo to your git, rename, and set private.  Up to you.
   - Generate a fine-grained personal access token and copy that to your notes.

# Let's do this

Open the serverinstallscript.sh file in your private repo and edit it. 

Goto the section: 

`# Begin Google Drive TAK Server download` 
 
Edit this line:

`gdown [paste your g-drive file ID here - remove the brackets]` 
 
From the gdrive link you saved earlier, example:
```
https://drive.google.com/file/d/15lgptQBLAHBLAHBLAHjTngtGg/view?usp=share_link
```
 
Copy the file ID, which is this portion of the link:
15lgptQBLAHBLAHBLAHjTngtGg

The line in your script should look like this (with your file ID):

`gdown 15lgptQBLAHBLAHBLAHjTngtGg`

At section:
```
# Begin install of TAK Server
cd
sudo yum install takserver-4.8-RELEASE31.noarch.rpm -y
```

Just make sure the install file name matches the file in your g-drive.


