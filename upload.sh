#!/bin/bash
# 银行业分析报告网站GitHub上传和Zeabur部署脚本

echo "=== 开始准备GitHub上传和Zeabur部署 ==="

# 检查git是否安装
if ! command -v git &> /dev/null; then
    echo "错误: 未安装git，请先安装git"
    exit 1
fi

# 初始化git仓库（如果尚未初始化）
if [ ! -d ".git" ]; then
    echo "初始化git仓库..."
    git init
fi

# 添加所有文件到暂存区
echo "添加文件到暂存区..."
git add .

# 提交更改
echo "提交更改..."
read -p "请输入提交信息: " commit_message
git commit -m "$commit_message"

# 检查是否已配置远程仓库
if ! git remote -v | grep -q "origin"; then
    echo "未设置远程仓库..."
    read -p "请输入GitHub仓库URL (如 https://github.com/username/bank-analysis-2024.git): " repo_url
    git remote add origin $repo_url
fi

# 推送到远程仓库
echo "推送到GitHub..."
git push -u origin master || git push -u origin main

echo "=== GitHub上传完成 ==="

# 询问是否部署到Zeabur
read -p "是否需要部署到Zeabur? (y/n): " deploy_to_zeabur

if [ "$deploy_to_zeabur" = "y" ] || [ "$deploy_to_zeabur" = "Y" ]; then
    echo "请按照以下步骤在Zeabur上部署："
    echo "1. 登录Zeabur账户: https://dash.zeabur.com/login"
    echo "2. 创建新项目"
    echo "3. 选择从GitHub导入并选择刚刚上传的仓库"
    echo "4. 选择'静态网站'作为部署类型"
    echo "5. 部署完成后，在'域名'选项卡中设置您的域名"
fi

echo "=== 脚本执行完毕 ===" 