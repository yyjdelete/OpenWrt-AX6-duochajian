#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

git revert -n -X theirs edbd8d2e9839357f3a4f0a06174d243f362b1544
git add target/linux/ipq807x/files-5.10/arch/arm64/boot/dts/qcom/ipq8071-ax*.dts*
cp target/linux/ipq807x/files-5.10/arch/arm64/boot/dts/qcom/ipq8071-ax*.dts target/linux/ipq807x/files-5.15/arch/arm64/boot/dts/qcom/
cp $GITHUB_WORKSPACE/files/ipq8071-ax3600_5.15.dtsi target/linux/ipq807x/files-5.15/arch/arm64/boot/dts/qcom/ipq8071-ax3600.dtsi
cp $GITHUB_WORKSPACE/files/900-arm64-dts-add-OpenWrt-DTS-files_5.10.patch target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch
cp $GITHUB_WORKSPACE/files/0900-arm64-dts-add-OpenWrt-DTS-files_5.15.patch target/linux/ipq807x/patches-5.15/0900-arm64-dts-add-OpenWrt-DTS-files.patch