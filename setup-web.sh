#!/bin/bash
wget https://github.com/twhitney11/webd236-replit/raw/main/modules.zip
unzip modules.zip
mv modules/* /usr/lib/php/20170718/
echo "extension=sqlite3.so" > /etc/php/7.2/cli/conf.d/20-sqlite3.ini
echo "extension=pdo_sqlite.so" > /etc/php/7.2/cli/conf.d/30-pdo_sqlite.ini
php -S 0.0.0.0:8000 router.php
