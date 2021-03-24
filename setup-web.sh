#!/bin/bash
wget https://github.com/twhitney11/webd236-replit/raw/main/modules.zip
unzip modules.zip
cd ..
php -dextension=$PWD/modules/sqlite3.so -dextension=$PWD/modules/pdo_sqlite.so -S 0.0.0.0:8000 router.php
