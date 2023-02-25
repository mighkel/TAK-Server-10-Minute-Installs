# TAK-Server-10-Minute-Installs
This repo helps you script your way to fast TAK Server installs on Rocky Linux 8.
Credit to @misterdallas for writing the original script that is the baseline for this one.
I'm just adding a couple of up-front steps that will help taylor your script to your needs.
You'll need to be somewhat familiar with Google Drive and Github.
My baseline is working on a Windows 10 machine, and my TAK Server is on an [SSDNodes VPS](https://www.ssdnodes.com/manage/aff.php?aff=1554). 
(Full disclosure: Above is a referral link.  Just search for "SSDNodes" if you feel -sold-out-.

# Why?
When learning certs or experimenting with TAK Server configurations, it's just cleaner and  
easier to tear it all down and start over.  After a few times, I figured I just don't need  
to practice TAK Server installs anymore.  I got that down now, so let's go for less typing!

# How?
How, indeed.  Let's get started.

# Prerequisites
1. Account on https://tak.gov (yes, you can sign up with a gmail account)
 -Download the latest TAK Server rpm file (non-docker)
 -Look for RHEL, ROCKY LINUX, & CENTOS
 -As of this writing, we're using takserver-4.8-RELEASE31.noarch.rpm
3. Google Drive
  -Create a folder just for the above TAK Server file you downloaded and save the rpm to it.
  -Set permissions to the file for "Anyone with the link"
  -Copy down the link somewhere handy (I use Notepad)
  -
