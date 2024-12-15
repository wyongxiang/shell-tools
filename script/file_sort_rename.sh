#! /bin/bash
# 设置初始计数器值
counter=1

# 遍历文件列表
for file in *.txt; do
    # 保留四位数字，不足的左边补零
    formatted_counter=$(printf "%05d" $counter)

    # 单纯的数字顺序
    # formatted_counter=$counter

    # 构建新的文件名
    new_filename="file_${formatted_counter}.txt"

    # 执行重命名操作
    mv "$file" "$new_filename"

    # 更新计数器
    ((counter++))
done
