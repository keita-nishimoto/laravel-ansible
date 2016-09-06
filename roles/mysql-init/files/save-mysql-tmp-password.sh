#!/usr/bin/env bash
mysqld_log=/var/log/mysqld.log
mysql_tmp_password=$(sudo grep 'password is generated' $mysqld_log | awk -F'root@localhost: ' '{print $2}')

tmp_file=/root/.tmp.my.cnf
umask 0077
cat > $tmp_file <<EOF
[client]
user=root
password=$mysql_tmp_password
connect-expired-password
EOF
