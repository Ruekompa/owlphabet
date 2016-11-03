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

### Puma

Change the puma conf file when working in developement, the current file in repo is for production

### UI

Finish user interfaces for backend to make it easier for navigation.


### To-do 
1. Secure uploads for non-downloading.
2. Tracking Credits - Artist own and or can belong to a project through track credits. Have a discussion. Should credits be through listing roles (writing, arranging, lyrics, instruments)

### Issues
1. On production only, when users are uploading pjax doesn’t work for other users (allowing users to seamlessly play while browsing)

2. On production only, multiple uploads take a while and the uploader disapears. They still continue but it might be easier to  do 1 or 2 at a time for now so it isn’t confusing to know when they succeed

3. When User click play on a new Album it adds to the Playlist that exists instead of refreshing a new list

4. Had to disable search until I get the page to refresh properly.

5. Need help caching and optimizing server – Really Slow!

7. Have to make layouts at little easier to navigate. I was trying to build the whole thing at once and decided to incrementally start piecing it together.

8. Secure uploads for non-downloading.

