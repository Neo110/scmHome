#!/bin/bash

# 获取脚本所在的目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 切换到脚本所在的目录
cd "$SCRIPT_DIR"

# 输出 Nginx 正在关闭的信息
echo "Nginx shutting down..."

# 尝试停止 Nginx
./nginx-1.14.2/nginx -s stop -p ./nginx-1.14.2

# 检查上一个命令的退出状态
if [ $? -ne 0 ]; then
  # 如果命令失败，输出错误信息
  echo
  echo "Nginx is stop failed"
  echo "Nginx could not be started"
  pause
else
  # 如果命令成功，输出成功信息
  echo
  echo "Nginx is stop success."
fi