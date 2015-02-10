#!/bin/bash

nodeversion=0.10.32

cecho() {
	message=$1
	color=${2:-'default'}
	attribute=${3:-'none'}

	color_type='3'
	color_code='0'
	if [[ $color = 'black' ]]; then
		color_code='0'
	elif [[ $color = 'red' ]]; then
		color_code='1'
	elif [[ $color = 'green' ]]; then
		color_code='2'
	elif [[ $color = 'yellow' ]]; then
		color_code='3'
	elif [[ $color = 'blue' ]]; then
		color_code='4'
	elif [[ $color = 'magenta' ]]; then
		color_code='5'
	elif [[ $color = 'cyan' ]]; then
		color_code='6'
	elif [[ $color = 'white' ]]; then
		color_code='7'
	fi

	attribute_code=''
	if [[ $attribute = 'bold' ]]; then
		attribute_code=';1'
	elif [[ $attribute = 'underlined' ]]; then
		attribute_code=';4'
	elif [[ $attribute = 'reverse' ]]; then
		attribute_code=';7'
	elif [[ $attribute = 'background' ]]; then
		color_type='0;1;4'
	fi

	# set text attributes
	echo -en "\033[${color_type}${color_code}${attribute_code}m"
	# echo text
	echo -en "$message"
	# reset text attributes
	echo -en "\033[0m\n"

	return
}

# Setup core developer things
echo ''
cecho "Upgrading any packages to latest version..." blue bold
echo ''

sudo apt-get upgrade -y

# Setup core developer things
echo ''
cecho "Installing Core developer tools..." blue bold
echo ''

sudo apt-get install -y terminator vim git build-essential libssl-dev dkms libcurl3 libc-dev g++ dpkg-dev

# Install NVM to .nvm folder in home directory
echo ''
cecho "Installing nvm..." blue bold
echo ''

git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
source ~/.nvm/nvm.sh
echo ''
cecho 'Testing nvm install (should provide NVM version number given above)' blue bold
echo ''
nvm --version

# Attempt to install node
echo ''
cecho "Installing node..." blue bold
echo ''

nvm install v$nodeversion
nvm alias default $nodeversion
cecho "Testing default node installation" blue bold; echo " (should be $nodeversion)"
node --version

# Install RVM, Ruby, and Sass
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby
gem install sass

# Add PPAs
sudo add-apt-repository "ppa:dylanmccall/hamster-time-tracker-git-stable"
sudo apt-get update

# Install Planning and Productivity things
echo ''
cecho "Intalling planning and productivity apps..." blue bold
echo ''

sudo apt-get install -y shutter gtg zeitgeist kupfer gnucash hamster-time-tracker skype ia32-libs chromium-browser


# Install Image Manipulation things
echo ''
cecho "Installing image manipulation apps..." blue bold
echo ''

sudo apt-get install -y mypaint mypaint-data-extras inkscape gimp gimp-plugin-registry gimp-data-extras gpick fontmatrix
