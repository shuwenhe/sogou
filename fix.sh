#!/bin/bash

echo "🔧 开始修复搜狗输入法（fcitx）环境配置..."

# 安装必要的 fcitx 组件
echo "📦 安装 fcitx 输入法框架..."
sudo apt update
sudo apt install -y fcitx fcitx-config-gtk fcitx-frontend-gtk3 fcitx-frontend-qt5 fcitx-module-dbus

# 设置输入法框架为 fcitx
echo "⚙️ 设置 fcitx 为默认输入法框架..."
im-config -n fcitx

# 添加环境变量到 ~/.xprofile
PROFILE_FILE="$HOME/.xprofile"
echo "📝 配置输入法环境变量到 $PROFILE_FILE ..."
mkdir -p "$(dirname "$PROFILE_FILE")"

# 去重添加
grep -q 'GTK_IM_MODULE=fcitx' "$PROFILE_FILE" 2>/dev/null || echo 'export GTK_IM_MODULE=fcitx' >> "$PROFILE_FILE"
grep -q 'QT_IM_MODULE=fcitx' "$PROFILE_FILE" 2>/dev/null || echo 'export QT_IM_MODULE=fcitx' >> "$PROFILE_FILE"
grep -q 'XMODIFIERS=@im=fcitx' "$PROFILE_FILE" 2>/dev/null || echo 'export XMODIFIERS="@im=fcitx"' >> "$PROFILE_FILE"

# 检查是否已安装搜狗拼音
if ! fcitx-configtool -r | grep -qi 'sogou'; then
    echo "📥 搜狗拼音尚未安装，如需安装请执行以下命令："
    echo "🔽 https://pinyin.sogou.com/linux/"
else
    echo "✅ 搜狗拼音已安装。"
fi

echo "✅ 配置完成，请注销或重启系统以生效。"

