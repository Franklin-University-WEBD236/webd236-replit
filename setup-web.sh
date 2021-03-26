#!/bin/bash
# Tyler Whitney & Todd Whittaker for WEBD 236 Replit Container

# Check if there are zombie processes and restart the init if there are
STR=`ps aux`
if [[ "$STR" == *"<defunct>"* ]]; then
  pkill init
fi

# Remove leftover modules directory
rm -rf .modules

# Grab any necessary modules from GitHub, unzip them to .modules
wget -q https://github.com/twhitney11/webd236-replit/raw/main/modules.zip
unzip -qq modules.zip
mv modules .modules
rm modules.zip

# reset the SQLite database from file
shopt -s nullglob
for f in *.sql; do
    rm -f "${f%.*}.db3" 
    sqlite3 "${f%.*}.db3" < "${f}"
done

# Cleanup this file when done
rm -rf setup-web.sh

rm -f php_errors.log
touch php_errors.log

# Run the local PHP server loading any custom modules and pass everything to router.php
php -c $PWD/php.ini -dextension=$PWD/.modules/sqlite3.so -dextension=$PWD/.modules/pdo_sqlite.so -S 0.0.0.0:8000 router.php &

tail -f php_errors.log
