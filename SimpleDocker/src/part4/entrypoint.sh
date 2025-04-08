#!/bin/bash

cc miniserver.c -o miniserver -lfcgi
service nginx start
./miniserver
