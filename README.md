This application, developed with Ruby on Rails for the International Festival du Cinéma Libre, is aimed to let users to stream movies and download them on a ubuntu OS.

# Getting Started

1. Install Ruby

2. Install Rails
```
gem install rails
```
3. Install VLC
```
sudo apt-get update && sudo apt-get install vlc
```

# Where to put the movies files ?

Create a videos_2015 folders on your home directory
```
~ mkdir videos_2015
```
And place your movies files into

# Making run

Clone the repository on your folder. Then, run the following command :
```
bundle install
rake db:migrate
rake db:seed
rails s
```

Enjaille !