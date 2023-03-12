# TAK-Server-10-Minute-Installs
Ok, maybe 11 or 12 minutes.  Either way, this repo is intended to help you script your way to fast TAK Server installs on a Rocky Linux 8 virtual private server (VPS).  
Credit to [@misterdallas](https://github.com/misterdallas) for writing and sharing the original script that is the baseline for this one.  I'm just adding a couple of up-front steps that will help taylor _your_ script to _your_ needs.  

You'll need to be somewhat familiar with Google Drive, Github, and some basic Linux command line work.  
My testing/learning/training setup is working from a Windows 10 machine, SSH into a VPS using Putty, and my TAK Server is installed on an [SSDNodes VPS](https://www.ssdnodes.com/manage/aff.php?aff=1554) G2 Standard/2vCPU/4GBRAM/80GBDisk.  _Full disclosure: Above is a referral link.  Just search for "SSDNodes" if you feel sold-out for some reason._

# Why?
When learning certs or experimenting with TAK Server configurations, sometimes it's just cleaner and easier to tear it all down and start over.  After a few times, I figured I just don't need to practice TAK Server installs anymore.  I got that down now, so let's go for less typing!  Less time installing and re-installing = more time to beat your head against the next wall of learning!

The intended audience here is the budding TAK admin that just wants to get a damn server up and running and get most of the "Linuxy stuff" out of the way.
**DO NOT PROCEED** thinking that this will get you to a secure TAK Server that is ready to deploy to your organization or agency.  You will have some hardening to do, and that is outside the scope of this project at this time.  

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
   - Generate a fine-grained personal access token and copy that to your _private_ notes.

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

The line in your script should look like this (with _your_ file ID):

`gdown 15lgptQBLAHBLAHBLAHjTngtGg`

At section:
```
# Begin install of TAK Server
cd
sudo yum install takserver-4.8-RELEASE31.noarch.rpm -y
```

Just make sure the install file name matches the file in your g-drive.

### Copy your Git repo to your VPS w/ git
```
sudo dnf install git -y
git clone https://github.com/[YOUR GITHUB USERNAME]/[YOUR PRIVATE REPO].git
```
Enter your github user name and press enter.

Enter your git private access key and press enter.  It'll look something like this: 
```
github_pat_12ABCDEFG0tpKcBmwrvBLAHblahBlAhMLdgPJFmFWjnGsuXMeUHf1WishP30pleWeRenTfkENaSsh0L35
```

### Make the script executable
```
cd [YOUR PRIVATE REPO]
chmod +x serverinstallscript.sh
```
## EXECUTE THE SCRIPT

### Return to the /root directory and run the script

Are you ready?

```
cd
./[YOUR PRIVATE REPO]/serverinstallscript.sh
```

### You're done, but you're not!

This should get you up-and-running, so you can start getting into the TAK Server web ui and start playing around.
You _will_ need to get familiar with the CoreConfig.xml, located in /opt/tak/.
You _will_ need to adjust your firewall and CoreConfig settings once you've weened yourself off of the 8080 setup login.
I'll try to add more on that later.  Right now your job is to learn about certs, and how to get your team connected - securely.
I would start with JR's informative site: https://mytecknet.com/tag/tak/
If you are in or around the public safety circles, you _must_ join the [TAK Syndicate](https://www.thetaksyndicate.org/).

I am also open to suggestions and pull requests to make this repo more useful to more people.

This stuff is hard if you're not a Linux and Networking guru, but it can be done, because I am neither.
