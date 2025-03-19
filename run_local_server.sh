#!/bin/bash
# 银行业分析报告网站本地服务器启动脚本

echo "=== 银行业分析报告网站本地服务器 ==="
echo "此脚本将启动一个本地HTTP服务器，用于查看分析报告网站"

# 检查python是否安装
if command -v python3 &> /dev/null; then
    echo "使用Python 3启动服务器..."
    cd "$(dirname "$0")"
    echo "网站地址: http://localhost:8000"
    echo "按Ctrl+C可以停止服务器"
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    echo "使用Python启动服务器..."
    cd "$(dirname "$0")"
    echo "网站地址: http://localhost:8000"
    echo "按Ctrl+C可以停止服务器"
    python -m http.server 8000
# 检查node是否安装
elif command -v npx &> /dev/null; then
    echo "使用Node.js http-server启动服务器..."
    cd "$(dirname "$0")"
    echo "网站地址: http://localhost:8080"
    echo "按Ctrl+C可以停止服务器"
    npx http-server
else
    echo "错误: 未找到Python或Node.js，请安装以支持本地服务器功能"
    echo "可以通过以下方式安装:"
    echo "Python: https://www.python.org/downloads/"
    echo "Node.js: https://nodejs.org/en/download/"
    exit 1
fi 