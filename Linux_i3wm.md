记录， 安装最基本的Linux，然后自己搭建图形界面

## 安装Linux
## 图像服务
- xorg-server
- lightdm 启动会话
- xterm

## x组件
- `xorg-xauth` 1.0.10-2 (xorg-apps xorg)
    X.Org authorization settings program
- `xorg-xbacklight` 1.2.2-1 (xorg-apps xorg)
    RandR-based backlight control application
- `xorg-xdpyinfo` 1.3.2-2 (xorg-apps xorg)
    Display information utility for X
- `xorg-xhost` 1.0.8-1 (xorg-apps xorg)
    Server access control program for X
- `xorg-xinit` 1.4.1-1
    X.Org initialisation program
- `xorg-xinput` 1.6.2-2 (xorg-apps xorg)
    Small commandline tool to configure devices
- `xorg-xkbcomp` 1.4.2-1 (xorg-apps xorg)
    X Keyboard description compiler
- `xorg-xkill` 1.0.5-1 (xorg-apps xorg)
    Kill a client by its X resource
- `xorg-xmessage` 1.0.5-1
    Display a message or query in a window
- `xorg-xmodmap` 1.0.10-1 (xorg-apps xorg)
    Utility for modifying keymaps and button mappings
- `xorg-xprop` 1.2.4-1 (xorg-apps xorg)
    Property displayer for X
- `xorg-xrandr`` 1.5.0-2 (xorg-apps xorg)
    Primitive command line interface to RandR extension
- `xorg-xrdb` 1.2.0-1 (xorg-apps xorg)
    X server resource database utility
- `xorg-xset` 1.2.4-1 (xorg-apps xorg)
    User preference utility for X

## 窗口
- i3 i3窗口管理器
- 窗口透明
    - compton 窗口透明
    - xcompmgr 窗口透明
-  设置桌面壁纸
    - nitrogen
    - feh
        ```sh
        $feh --bg-scale $HOME/picture/wallpaper.png
        ```

## 软件启动器
- dmenu
- rofi 可以配置成程序启动器用来代替默认的dmenu


## 网络
- networkmanager NetworkManager
- network-manager-applet 托盘图标（nm-applet）
- 图形界面
    - nm-connection-editor 图形界面
    - network-manager-gnome gnome网络管理界面
    - 网络管理小程序

### 查看网络设备名称
```bash
    $ls /sys/class/net/
```
- lo 网络回环
- wlp4s0 无线网络（该文件夹下有一个wireless文件夹）
- enp5s0 有线网络


## 声音
- alsa (Advanced Linux Sound Architecture，高级Linux声音架构)
- pulseaudio 声卡驱动
- pavucontrol 配置声音
- volumeicon-alsa 音量控制托盘图标

### 查看音频设备
```bash
    $aplay -l
    $cat /proc/asound/cards
```

### 配置默认声卡
修改`~/.asoundrc`
```bash
    pcm.!default {
        type hw
        card 1
    }
    ctl.!default {
        type hw
        card 1
    }
```


## 电源管理
- mate-power-manager


## 屏幕亮度
### 使用电源管理来控制
### 使用 `xbacklight`
```conf
XF86MonBrightnessUp exec xbacklight -inc 5
XF86MonBrightnessDown exec xbacklight -dec 5
```


### 外观
- lxappearance 用来调节gtk主题和字体


## 显示器
- xrandr 管理当前可用的显示器
- arandr



## 输入法
- fcitx 输入法基础服务
- fcitx-gtk2,fcitx-gtk3,fcitx-qt4,fcitx-qt5
- fcitx-configtool 输入法管理界面
- fcitx-sogoupinyin 搜狗输入法(Arch)
- 修改配置文件 `~/.xprofile`
```bash
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
```
> 设置fcitx为自启动

## 字体
### 查看安装的字体
- 查看所有字体
    ```bash
    $fc-list
    ```
- 查看安装的中文字体
    ```bash
    $fc-list :lang=zh
    ```
- 查询字体
    ```bash
    $fc-list | grep -i awesome
    /usr/share/fonts/FontAwesome.otf: FontAwesome:style=Regular
    ```
    `FontAwesome`为字体的名称，在其他配置文件中使用这个名字来使用字体，也可以使用`FontAwesome:style=Regular`


### 添加字体
1. 将字体复制到 `/usr/share/fonts/` 目录下
1. 建立字体索引信息
    ```bash
    $mkfontscale
    $mkfontdir
    ```
1. 重建字体缓存
    ```bash
    $fc-cache -r
    ```


## 多媒体按键
- XF86AudioRaiseVolume 音量+
- XF86AudioLowerVolume 音量-
- XF86AudioMute 静音
- XF86MonBrightnessUp   亮度+
- XF86MonBrightnessDown 亮度-


## `zsh`


## `pacman` 的一些用法
| 命令 | 说明 |
| - | - |
| pacman -R pkg_name		| 删除指定安装包，但是保留其全部已安装的依赖关系 |
| pacman -Rs pkg_name		| 删除指定软件包，以及没有被其他已安装软件包使用的依赖关系。 |
| pacman -Rsc				| 移除一个包及其所有依赖 |
| pacman -Sc				| 清除未安装软件包的缓存 |
| pacman -Ss 				| 查询包数据库 |
| pacman -Si				| 显示包信息 |
| pacman -Qs				| 搜索已安装的包 |
| pacman -Qi				| 本地安装包 |	



## 一些软件
- flameshot：截图软件
- arandr：屏幕管理器（图形界面）
- htop：top命令的加强版
- mpv：极简视频播放器，多数功能由命令行完成
- vlc：视频播放器
- electron-ssr：ssr图形工具
- screenfetch / neofetch：在终端打印系统信息


## 其他命令
### `lspci -v`
查看所有设备，可以看到驱动程序在哪个内核模块。
```
02:00.0 Ethernet controller: Attansic Technology Corp. L1 Gigabit Ethernet Adapter (rev b0)
    Kernel driver in use: atl1
    Kernel modules: atl1
```
用 dmesg | grep module_name 来检查是否已经加载了驱动
atl1 0000:02:00.0: eth0 link is up 100 Mbps full duplex