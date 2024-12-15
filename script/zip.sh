#!/bin/bash

# 定义要遍历的父文件夹
parent_dir="./"

# 遍历parent_dir下的每一个子文件夹
# find "$parent_dir" -type d -mindepth 1 -maxdepth N | while IFS= read -r dir
find "$parent_dir" -type d -mindepth 1 -maxdepth 10 | while IFS= read -r dir
do
    # 获取不带父目录路径的子文件夹名称
    subdir_name=$(basename "$dir")

    # 指定输出的ZIP文件名，通常基于子文件夹名称
    output_zip="$parent_dir/${subdir_name}.zip"

    # 递归压缩子文件夹到相应的ZIP文件
    zip -r "$output_zip" "$dir"
done

# 注意：N 应设置为你期望的最大子目录深度，如果不指定，可去掉 -maxdepth 参数以遍历所有层级
