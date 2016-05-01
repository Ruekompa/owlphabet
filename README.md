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

## Setup Databases 
`rake db:create`

`rake db:migrate`

## Start Puma Server
`rails s`

Try rake routes to see a list of URLS, or checkout the config/routes.rb file to see option. Not everything has a button yet!

## Committing
Please try to commit changes to owlphabet-dev branch.

# To-do

## Data
Uniquness of names for everything, and implement the different ways to handle each scenario (i.e artist names, project names if same use plus city, album name that are the same append project and so forth) 

## For listeners

### UI

**Duration**
Duration not being loaded with new playlist (soundManager) 

**Relevant for problem File Locations**

**Assets**
`/app/assets/`

**Layout**
`app/views/layouts/application.html.erb/`

**Loading playlist**
`/app/views/music/show_album.html.erb`

The duration stopped loading after I switched from public directory to storing the files inside of the app, for the purposes of *Secure Uploading* via carrierwave. SoundManager2 uses flash to estimate duration. I have duration save in DB, which we might load manually. Or see why we can't set the position with the out-of-the-box feature. I don't know. To-do! Otherwise, it seems to play music.

## For Musicians

### UI

Finish user interfaces.

### Backend

Tracking Credits

Artist own and or can belong to a project through track credits. Have a discussion. Should credits be through listing roles (writing, arranging, lyrics, instruments)

## Finish to-do
Finish to-do list. Not much else though. 