#!/bin/bash

# 获取脚本所在的目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 切换到脚本所在的目录
cd "$SCRIPT_DIR"

# 启动 Nginx
"./nginx-1.14.2/nginx.exe" -p "./nginx-1.14.2" &

# 检查 Nginx 是否成功启动
if [ $? -ne 0 ]; then
  echo
  echo "Nginx could not be started"
  echo "Nginx is start failed"
  pause
else
  echo
  echo "Nginx is start success"
fi