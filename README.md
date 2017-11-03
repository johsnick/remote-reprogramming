# Khatting-Koala
## Setup
### 1. Clone the repo
```
git clone git@github.com:powderhook/khatting-koala.git
cd khatting-koala
```
### 2. Add Keyfile
You will need to get someone to give you access to the Keys folder in drive or the application.yml file. Add this file to the config folder. This file will change from time to time so its probably a good idea to just create a link and have the drive folder automatically sync.

### 3. Install Docker CE
#### Mac
Go [Here](https://store.docker.com/editions/community/docker-ce-desktop-mac)
#### Linux
```
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh
sudo usermod -aG docker <YOUR USERNAME>
```
> Don't copy past the last linep

Log out then log back in. This is to update your permissions

### 4. Install Docker Compose
#### Mac
Docker for Mac already installs this so you just win
#### Linux
```
sudo su
curl -L https://github.com/docker/compose/releases/download/1.16.0-rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
exit
```
### 5. Install docker-sync
```
gem install docker-sync
```
this is used for more efficient volumes, you have to have this started to get file sharing
to start run
```
docker-sync start
```
### 6. Setup Database
`docker-compose run web rake db:rebuild`
### 7. Start Server
`docker-compose up`

### Useful Commands
* enter console `docker-compose exec web bash`
> need to have the server up

* run tests `docker-compose run web rspec`
> can also just run this in terminal

* enter console `docker-compose run web bash`
> this creates a new container so you don't need the server to be up

### 8. Code
Get to work.
