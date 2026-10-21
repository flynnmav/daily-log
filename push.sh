#!/usr/bin/env bash
# 每日打卡提交脚本：pull -> commit -> push
set -euo pipefail
cd "$(dirname "$0")"

git pull --rebase --autostash origin main
git add log
git commit -m "log: $(date +%F)" || echo "今天已提交过，无新改动"
git push origin main
git log --oneline -1
