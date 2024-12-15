#!/bin/bash

# 设置起始编号
index=0

# 获取当前目录下所有文件夹
for dir in */ ; do
    # 去掉路径结尾的斜杠
    dir_name=$(basename "${dir}")

    # 生成新的五位数格式编号
    padded_index=$(printf "case_%05d" $((index + 1)))

    # 创建新的文件夹名称
    new_dir_name="${padded_index}"

    # 执行重命名操作
    mv "${dir}" "${new_dir_name}"

    # 更新索引
    ((index++))

    # 如果达到最大编号，则停止循环
    if [ $index -gt 999 ]; then
        break
    fi
done
