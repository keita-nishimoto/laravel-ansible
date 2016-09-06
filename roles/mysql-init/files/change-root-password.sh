#!/usr/bin/env bash
new_root_password='Laravel@RootPassword999@'
mysql --defaults-file=/root/.tmp.my.cnf -e "ALTER USER 'root'@'localhost' IDENTIFIED BY  '$new_root_password' "

umask 0077
cat > /root/.my.cnf <<EOF
[client]
user=root
password=$new_root_password
EOF
