#!/bin/bash

# Remove leftover modules directory
rm -rf .modules

# Grab any necessary modules from GitHub, unzip them to .modules
wget https://github.com/twhitney11/webd236-replit/raw/main/modules.zip
unzip modules.zip
mv modules .modules

# Reset the SQLite database
sqlite3 *.db3 < *.sql

# Cleanup this file when done
rm -rf setup-web.sh

# Run the local PHP server loading any custom modules and pass everything to router.php
php -dextension=$PWD/.modules/sqlite3.so -dextension=$PWD/.modules/pdo_sqlite.so -S 0.0.0.0:8000 router.php
