# Remote Reprogramming
## Setup
### 1. Clone the repo
```
git clone git@github.com:johsnick/remote-reprogramming.git
cd remote-reprogramming
```

### 2. Install Docker CE
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

### 3. Install Docker Compose
#### Mac
Docker for Mac already installs this so you just win
#### Linux
```
sudo su
curl -L https://github.com/docker/compose/releases/download/1.16.0-rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
exit
```
### 4. Setup Database
`docker-compose run web ./scripts/migrate.rb`
### 5. Start Server
`docker-compose up`

### Useful Commands
* enter console `docker-compose exec web bash`
> need to have the server up

* run tests `docker-compose run web rspec`
> can also just run this in terminal

* enter console `docker-compose run web bash`
> this creates a new container so you don't need the server to be up