#!/bin/bash
:<<eof
# 按照数字顺序进行编号
# 设定起始编号
index=1

# 获取当前目录下所有文件夹
for dir in */ ; do
    echo "$dir"
    # 去除结尾的斜杠
    dir_name=$(basename "${dir%?}")

    # 创建新的文件夹名称，这里是以数字编号作为后缀
    new_dir_name="${dir_name}_${index}"

    # 执行重命名操作
    mv "${dir}" "${new_dir_name}"

    # 更新索引
    ((index++))
done
eof

# 按照case_00000 到case_00999的顺序给文件夹重命名
# 设置起始编号
index=0

# 获取当前目录下所有文件夹并筛选出以"case_"开头的文件夹
for dir in test*; do
    # 确保处理的是文件夹而非文件
    if [[ -d "$dir" ]]; then
        # 去除"case_"前缀并提取编号
        old_index=$(echo $dir | sed 's/test\([0-9]*\)/\1/')

        # 生成新的五位数格式编号
        new_index=$(printf "%05d" $((index + 1)))

        # 构造新的文件夹名称
        new_dir_name="CASE_${new_index}"

        # 执行重命名操作
        mv "${dir}" "${new_dir_name}"

        # 更新索引
        ((index++))

        # 如果达到最大编号，则停止循环
        if [ $index -gt 999 ]; then
            break
        fi
    fi
done

