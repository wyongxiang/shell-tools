#!/bin/bash
:<<eof
for file in *.zip; do
    if [ -f "$file" ]; then
        # echo "$file"
        mv "$file" "prefix_${file}" # 添加前缀
        # mv "$file" "${file}.zip" # 添加后缀
        # mv "$file" "${file/prefix/word}" # 替换第一个匹配到的
        # mv "$file" "${file//prefix/word}" # 全局替换
    fi
done
eof

for file in *"word"*; do
    newname="${file//word/}"  # 采用了 全局替换的方式，将word替换为空字符
    if [ "$file" != "$newname" ]; then
        mv "$file" "$newname"
    fi
done


