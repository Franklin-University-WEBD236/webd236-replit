#!/bin/bash
rm -rf .setup
mkdir .setup
cd .setup
wget https://github.com/twhitney11/webd236-replit/raw/main/modules.zip
unzip modules.zip
cd ..
php -dextension=$PWD/.setup/modules/sqlite3.so -dextension=$PWD/.setup/modules/pdo_sqlite.so -S 0.0.0.0:8000 router.php
