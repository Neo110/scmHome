#!/bin/bash

# 获取脚本所在的目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 切换到脚本所在的目录
cd "$SCRIPT_DIR"

# 停止 Nginx
./nginx-stop.sh

# 检查停止 Nginx 是否成功
if [ $? -eq 0 ]; then
  # 启动 Nginx
  ./nginx-start.sh
  # 检查启动 Nginx 是否成功
  if [ $? -eq 0 ]; then
    echo "Nginx has been stopped and started successfully."
  else
    echo "Failed to start Nginx."
  fi
else
  echo "Failed to stop Nginx."
fi