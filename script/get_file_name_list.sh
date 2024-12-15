#!/bin/bash

# 指定源文件夹路径
folder_path="./"

# 指定输出TXT文件路径
output_file="file_names.txt"

# 清空或创建新的TXT文件
> "$output_file"

# 遍历文件夹内的所有文件
for file in "$folder_path"/*.txt
do
    # 检查是否为文件（排除子目录）
    if [ -f "$file" ]; then
        # 获取文件名并写入到TXT文件
        echo "$(basename "$file")" >> "$output_file"
    fi
done
