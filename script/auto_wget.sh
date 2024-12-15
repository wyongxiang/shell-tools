#!/bin/bash

# 定义要下载的文件URL
URL="https://github.com/isl-org/open3d_downloads/releases/download/torch1.8.1/torch-1.8.1-cp36-cp36m-linux_x86_64.whl"
# 定义下载文件的保存路径及名称
OUTPUT_FILE="/Users/wangyongxiang/wang/wyx/shell脚本/torch-1.8.1-cp36-cp36m-linux_x86_64.whl"
# 设定最大重试次数
MAX_RETRIES=5
# 初始化重试计数器
RETRY_COUNT=0

# 下载并重试的函数
download_with_retry() {
    echo "尝试下载 ($RETRY_COUNT/$MAX_RETRIES)"
    wget -c --output-document="$OUTPUT_FILE" "$URL"
    if [ $? -eq 0 ]; then
        echo "下载成功！"
        exit 0
    else
        echo "下载失败，准备重试..."
        ((RETRY_COUNT++))
        if [ $RETRY_COUNT -le $MAX_RETRIES ]; then
            sleep 10 # 等待10秒后重试
            download_with_retry
        else
            echo "达到最大重试次数，下载失败。"
            exit 1
        fi
    fi
}

# 调用下载函数
download_with_retry
