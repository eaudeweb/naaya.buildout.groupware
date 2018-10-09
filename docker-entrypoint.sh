#!/bin/bash
set -e

COMMANDS="debug help logtail show stop adduser fg kill quit run wait console foreground logreopen reload shell status"
START="start restart"

#create the Maildir folder structure
mkdir -p /var/local/groupware/var/naaya-mail-queue/new
mkdir -p /var/local/groupware/var/naaya-mail-queue/cur
mkdir -p /var/local/groupware/var/naaya-mail-queue/tmp
chown 500:500 /var/local/groupware/var/naaya-mail-queue
chown 500:500 /var/local/groupware/var/naaya-mail-queue/new
chown 500:500 /var/local/groupware/var/naaya-mail-queue/cur
chown 500:500 /var/local/groupware/var/naaya-mail-queue/tmp

if [ ! -z "$CRONTAB" ]; then
  crontab -u zope crontab.cfg
  crond
  cat
else
  if [[ $START == *"$1"* ]]; then
    _stop() {
      bin/instance stop
      kill -TERM $child 2>/dev/null
    }
    trap _stop SIGTERM SIGINT
    if [ ! -z "$DEBUG_MODE" ]; then
      bin/develop up
      git --git-dir=src/naaya/.git pull
    fi
    bin/instance start
    bin/instance logtail &
    child=$!
    wait "$child"
  else
    if [[ $COMMANDS == *"$1"* ]]; then
      exec bin/instance "$@"
    fi
    exec "$@"
  fi
fi
