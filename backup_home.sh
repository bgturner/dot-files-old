#!/bin/bash

NOW=$(date +"%Y-%m-%d--%H-%M")
TEMPDIR=~/.tmp

cd $HOME

mkdir -p $TEMPDIR

# Backing up Thunderbird
tar cvzf $TEMPDIR/thunderbird-$NOW.tar.gz --exclude-caches-all --exclude-backups .thunderbird

# Backing up Firefox
tar cvzf $TEMPDIR/firefox-$NOW.tar.gz --exclude-caches-all --exclude-backups .mozilla

# Backing up Chromium
tar cvzf $TEMPDIR/chromium-$NOW.tar.gz --exclude-caches-all --exclude-backups .config/chromium

# Backing up home config
tar cvzf $TEMPDIR/home-config-$NOW.tar.gz --exclude-caches-all --exclude-backups --exclude 'chromium/*' --exclude '.config/VirtualBox/*' --exclude '*/.git' --exclude '.local/share/Trash/*' .config .cinnamon .dot-files .filezilla .gnucash .icons .local .mypaint .ssh .themes .wallpaper .xmind .face .fonts

# Backing up Vagrant, VirtualBox and VVV
tar cvzf $TEMPDIR/vvv-$NOW.tar.gz --exclude-caches-all --exclude-backups --exclude 'VirtualBox\ VMs/Win8-50gb' --exclude 'node_modules' VirtualBox\ VMs vvv .config/VirtualBox .vagrant.d .config/VirtualBox

# Backup various Docs
tar cvzf $TEMPDIR/documents-$NOW.tar.gz --exclude-caches-all --exclude-backups --exclude 'node_modules/*' --exclude '.sass-cache/*' Desktop Documents Fonts Notebooks PassionsPlay Projects
