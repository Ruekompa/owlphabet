# Owlphabet Music
An anti-label, a platform for musicians.

## Getting Started
First install all of the dependencies.


* postgresql
* imagemagick
* taglib
* ruby-sox
 

### Debian / Ubuntu

**Common Dependencies**

`sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev`

**pg / postgres**

`sudo apt-get install libpq-dev`

**taglib-ruby**

`sudo apt-get install taglib`

`sudo apt-get install libtag1-dev`

**ruby-sox**

`sudo apt-get install libsox-fmt-all sox libchromaprint-dev`

## Bundle 
`bundle install`

## Rake Databases 
`rake db:create`

`rake db:migrate`

`rake db:reset`

## Start Puma Server
`rails s`

Try rake routes to see a list of URLS, or checkout the config/routes.rb file to see option. Not everything has a button yet!

### To-do 

### UI

1. Finish user interfaces for backend to make it easier for navigation

2. Need to make a better track uploader!

3. Pagination link renderer

### Backend

1. Secure uploads for non-downloading.
2. Tracking Credits - Artist owns and or can belong to a project through track credits. Have a discussion. Should credits be through listing roles (writing, arranging, lyrics, instruments)


### Issues
1a. Configuring the rest of fog for google storage 

1. On production only, when users are uploading pjax doesn’t work for other users (allowing users to seamlessly play while browsing)

2. On production only, multiple uploads take a while and the uploader disapears. They still continue but it might be easier to  do 1 or 2 at a time for now so it isn’t confusing to know when they succeed

3. Had to disable search, otherwise page refreshes, or fix $.pjax.submit(event, '#search_filter') where the results can properly display.

4. Need help caching and optimizing server – Really Slow!

5. Secure uploads for non-downloading.

6. pjax SSL issues causing cross domain scripting issues  


# Owlphabet Music Business Model

A​ new competitive marketplace  connecting end­user subscribers to content and providing 
relationships through licenses between musicians, visual content makers and advertisers. 
 
## Subscription Streaming 
2 options: ​
Paid Subscription or Advertisements – Existing platforms such as Spotify prove that 
this model can work. 
 
## Licensing 
Providing relationships through licenses to musicians, visual content makers and advertisers. 
 
### Visual Content Makers 
For Media sharing websites such as ​
Youtube , ​
 Owlphabet provides 2 main categories 
of license types: Content creator or Advertiser each with a subset of license types. 
 
#### Content Creator:​
 Feature­length, short, or series/episodic 
 
#### Advertiser: ​
Corresponding license based on the ​content creator license type (Feature, short, series/episodic) 
 
 
## Merchandise 
Basic e­commerce to sell physical goods such as albums, t­shirts, and other types of 
memorabilia. 
 
# Market Trends 
Technology trends have reduced costs on instruments, equipment and software, where now 
there exist more musicians with the ability and drive to create award­ winning works. 
 
## Indie Market 
Indie markets have had a boom in growth in recent years due to many factors. While the initial 
marketing initiative will be towards independent creators in music and film, Owlphabet avoids 
basing license cost on content/film budget brackets and instead bases license cost on length of 
content that the music will be applied to.  
 
# Competition 
No direct competition to the platform as a whole; however, this doesn’t include streaming only 
services or the current music license organizations, which this platform has the potential to 
compete within both existing spaces. 