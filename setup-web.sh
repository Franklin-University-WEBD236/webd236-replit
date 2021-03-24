#!/bin/bash
wget https://github.com/twhitney11/webd236-replit/raw/main/modules.zip
unzip modules.zip
php -dextension=/home/runner/.setup/modules/sqlite3.so -dextension=/home/runner/.setup/modules/pdo_sqlite.so -S 0.0.0.0:8000 router.php
