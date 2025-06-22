#!/bin/bash

echo "开始修改diy/js.sh……"
echo "========================="

#删除kenzok8/wall(kenzok8自建常用的内核)
#sed -i "s|git clone --depth 1 https://github.com/kenzok8/wall|#git clone --depth 1 https://github.com/kenzok8/wall|g" .github/diy/js.sh


#删除sirpdboy/netspeedtest（JS版）)
#sed -i "s|git clone --depth 1 https://github.com/sirpdboy/netspeedtest|#git clone --depth 1 https://github.com/sirpdboy/netspeedtest|g" .github/diy/js.sh

#修复diy/main.sh中格式错误
sed -i "s|'applications/luci-app-watchcat \'|'applications/luci-app-watchcat'|g" .github/diy/js.sh
sed -i "s|'luci-app-socat \'|'luci-app-socat'|g" .github/diy/js.sh

