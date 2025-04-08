#!/bin/bash

scp cat/s21_cat root@172.17.0.3:/usr/local/bin
scp grep/s21_grep root@172.17.0.3:/usr/local/bin
ssh root@172.17.0.3 "
cd /usr/local/bin
pwd
ls -lah
"
