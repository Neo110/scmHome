#!/bin/bash

# 检查 nginx 进程是否存在
if ps aux | grep -q "nginx.exe"; then
    echo "Nginx is running."
else
    echo "Nginx is not running."
fi