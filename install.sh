https://shurufa.sogou.com/linux/guide
1.install fcitx
sudo apt-get install fcitx
sogou wubi ubuntu
2.install sogou
sudo dpkg -i sogoupinyin_4.2.1.145_amd64.deb
1.打开 系统设置——区域和语言——管理已安装的语言——在“语言”tab下——点击“添加或删除语言”

2.sudo apt remove --purge fcitx5-chinese-addons-data fcitx-data  # 清理冲突的依赖包

sudo apt --fix-broken install  # 自动修复依赖关系

3. 设置fcitx开机自启动 在终端执行

sudo cp /usr/share/applications/fcitx.desktop /etc/xdg/autostart/

4. 卸载系统ibus输入法框架 在终端执行

sudo apt purge ibus

2. 安装输入法依赖 在终端执行

sudo apt install libqt5qml5 libqt5quick5 libqt5quickwidgets5 qml-module-qtquick2

sudo apt install libgsettings-qt1


