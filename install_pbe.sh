#!/bin/bash

mkdir src
git clone https://github.com/eaudeweb/naaya.buildout.groupware.git src/buildout
git clone https://github.com/eaudeweb/naaya.bundles.NaayaBundles-PBE.git src/NaayaBundles-PBE
git clone https://github.com/eaudeweb/naaya.bundles.NaayaBundles-Forum.git src/NaayaBundles-Forum
git clone https://github.com/eaudeweb/naaya.fake_envirowindows.git src/naaya.fake_envirowindows
ln -s src/buildout/buildout_pbe.cfg buildout.cfg
ln -s src/buildout/versions.cfg
ln -s src/buildout/zope-2.12.28-versions.cfg
ln -s src/buildout/naaya.cfg
ln -s src/buildout/bootstrap.py
ln -s src/buildout/sources.cfg
cp src/buildout/secret.cfg.sample secret.cfg

PYTHON=/usr/bin/python2.7
$PYTHON bootstrap.py -v1.4.4
./bin/buildout
