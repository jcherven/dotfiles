#! /usr/bin/env bash

BACKUP_DIR="/Volumes/ArtichokeMedia/Music/0_MIRROR_celery-itunes-folder/"
rsync --human-readable --archive --delete-during --prune-empty-dirs --progress "/Users/choro/Music/iTunes/" $BACKUP_DIR
