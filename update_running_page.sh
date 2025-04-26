#!/bin/bash

# 设置错误时立即退出
set -e

echo "开始执行运动数据更新脚本..."

# 1. 激活虚拟环境
echo "1. 激活虚拟环境"
source ./venv/bin/activate

# 2. 运行 GPX 同步脚本
echo "2. 运行 GPX 同步脚本"
python3 run_page/gpx_sync.py

# 3. 生成 GitHub 样式的 SVG
echo "3. 生成 GitHub 样式的 SVG"
python3 run_page/gen_svg.py \
    --from-db \
    --title "Running Life" \
    --type github \
    --athlete "Jay" \
    --special-distance 5 \
    --special-distance2 10 \
    --special-color yellow \
    --special-color2 red \
    --output assets/github.svg \
    --use-localtime \
    --min-distance 0.5

# 4. 生成网格样式的 SVG
echo "4. 生成网格样式的 SVG"
python3 run_page/gen_svg.py \
    --from-db \
    --title "Runs" \
    --type grid \
    --athlete "Jay" \
    --output assets/grid.svg \
    --min-distance 1.0 \
    --special-color yellow \
    --special-color2 red \
    --special-distance 5 \
    --special-distance2 10 \
    --use-localtime

# 5. 生成圆形样式的 SVG
echo "5. 生成圆形样式的 SVG"
python3 run_page/gen_svg.py \
    --from-db \
    --type circular \
    --use-localtime

# 6. 生成 Month of Life 样式的 SVG
echo "6. 生成 Month of Life 样式的 SVG"
python3 run_page/gen_svg.py \
    --from-db \
    --type monthoflife \
    --birth 1988-08 \
    --special-distance 5 \
    --special-distance2 10 \
    --special-color '#f9d367' \
    --special-color2 '#f0a1a8' \
    --output assets/mol.svg \
    --use-localtime \
    --athlete Jay \
    --title 'Runner Month of Life'

# 7. 取消激活虚拟环境
echo "7. 取消激活虚拟环境"
deactivate

# 8. 提交到 Git
echo "8. 提交所有更改到 Git"
git add .
git commit -m "chore: update running page" || echo "没有新的更改需要提交"
git push

echo "所有步骤执行完成！" 