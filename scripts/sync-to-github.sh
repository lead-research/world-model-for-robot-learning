#!/bin/bash
# 自动同步脚本: 将学习笔记推送到 GitHub

REPO_DIR="/home/dli/.openclaw/workspace/github-world-model-research"
cd "$REPO_DIR" || exit 1

# 检查是否有变更
if git diff --quiet && git diff --cached --quiet; then
    echo "No changes to sync."
    exit 0
fi

# 添加所有变更
git add -A

# 提交
git commit -m "update: $(date '+%Y-%m-%d %H:%M') - paper notes"

# 推送
git push origin main

echo "Synced to GitHub at $(date '+%Y-%m-%d %H:%M')"
