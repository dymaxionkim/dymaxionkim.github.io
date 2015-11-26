# Setup_Apps


## 각종 필수 유틸리티 설치

* 오피스(LibreOffice), PDF뷰어(Evince), 그림뷰어(Mirage), 벡터그림편집기(Inkscape), 레스터그림편집기(Gimp), 동영상플레이어(SmPlayer), PDF가상프린터(Cups), 공학용 단위변환기(ConvertAll), 공학용 계산기(Qalculate)를 한 번에 설치합니다.

```
sudo apt-get install libreoffice evince mirage inkscape gimp smplayer cups-pdf convertall qalculate
```

* 한컴오피스2014 뷰어를 설치합니다.  한컴은 오픈소스에 대한 인식이 좋지 않은 회사이다 보니, 역시 아니나다를까 wget으로 다운로드받는 것이 불가능하게 막아놨습니다.  따라서 이 회사 홈페이지( http://www.hanfriends.com/ )에 가서 뷰어를 직접 찾아 다운로드한 후 설치해야 합니다.  아래의 명령으로 설치 완료후에, 실행 명령은 `hwpviewer` 입니다.


```
sudo dpkg -i hwpviewer*.deb
```


## 구글 크롬 브라우저 설치

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt-get install libxss1 libappindicator1 libindicator7

sudo dpkg -i google-chrome*.deb
```

## Synaptic 패키지 관리자 설치

* Synaptic으로 apt, dpkg 등의 터미널 명령어 대신 GUI 환경에서 패키지 관리를 할 수 있기 때문에 편리한 점이 있습니다.  Synaptic 말고 다른 것들도 있긴 한데 안정성이 좀 안좋거나 기능이 많이 생략되어 있기 때문에 그냥 이게 제일 낫습니다.

```
sudo apt-get install synaptic
```


## Numix 테마로 Tint2 설정하기

* OpenBox의 디폴트 테마들은 너무 촌스럽기 때문에, 최근에 유행해서 그나마 세련된 축에 들어가는 Numix 테마를 설치해 봅니다.  Numix 테마라고 해서 아무거나 설치하면 안되고, OpenBox 및 Tint2를 위해 디자인된 배포판이 없는지 검색해 봤습니다.

* 그래서 찾아본 적당한 것이 이것( http://kexolino.deviantart.com/art/Numix-tint2-Theme-Pack-425348253 )입니다. Tint2 테스크바의 디자인을 잘 설정해 준 것입니다.  여기서 'Download' 버튼을 눌러서 다운로드 받습니다.  다운로드 받은 후에, pcmanfm 파일관리자로 다운로드 받은 장소로 간 다음 마우스 오른쪽 버튼을 눌러서 나오는 메뉴 중에서 'arkzip'을 선택합니다.  압축을 풀라는 이야깁니다.  압축이 다 풀리면 디렉토리가 생깁니다.

* 이 디렉토리 안에 'Numix_tint2'라는 디렉토리가 들어 있습니다.  이 디렉토리를 통째로 `~/.config/tint2` 안으로 옮깁니다.  터미널 명령어를 사용해도 좋고, pcmanfm에서 그냥 잘라내서 옮겨도 좋습니다.

* 이 디렉토리 안에는 테마가 4가지 들어있습니다.  개인적으로 Dock 형태는 별로 안 좋아하므로, Taskbar 형태를 사용하기로 결정해 봅니다(red_taskbar).

* 이제 autostart 설정을 편집해 줍니다.

```
leafpad ~/.config/openbox/autostart
```

* 위 명령을 주면 편집기가 열리고 내용이 보입니다.  이 중에서 기존에 들어가 있는 `tint2 &`를 다음과 같이 바꿔줍니다(물론 경로는 정확히 자신의 시스템에 맞는 경로로 확인해서 수정합니다).  그리고 저장하고 빠져나옵니다.

```
tint2 -c ~/.config/tint2/Numix_tint2/red_taskbar/tint2rc &
```

* 이런 식으로 해 줌으로써, Tint2를 시작할 때 tint2rc 설정파일의 경로만 바꿔주면 여러가지 설정으로 손쉽게 변경 가능해질 것입니다.

* 참고로 금방 적용해 본 '.../red_taskbar/tint2rc' 파일의 내용을 기록해 둡니다.

```
# Tint2 config file by Kexolino

# Background definitions

# ID 1
rounded = 0
border_width = 1
background_color = #2D2D2D 100
border_color = #484848 100

# ID 2
rounded = 0
border_width = 0
background_color = #D64937 100
border_color = #000000 100

# Panel
panel_monitor = all
panel_position =  bottom center horizontal
panel_size = 104% 39
panel_margin = -2 -1
panel_padding = 0 0 10
panel_dock = 0
wm_menu = 1
panel_layer = normal
panel_background_id = 1

# Panel Autohide
autohide = 0
autohide_show_timeout = 0.2
autohide_hide_timeout = 1
autohide_height = 0
strut_policy = follow_size

# Taskbar
taskbar_mode = single_desktop
taskbar_padding = 0 0 10
taskbar_background_id = 0
taskbar_active_background_id = 0

# Tasks
urgent_nb_of_blink = 20
task_icon = 1
task_text = 0
task_centered = 1
task_maximum_size = 70 32
task_padding = 10 4
task_background_id = 0
task_active_background_id = 2
task_urgent_background_id = 0
task_iconified_background_id = 0

# Task Icons
task_icon_asb = 100 0 0
task_active_icon_asb = 100 0 0
task_urgent_icon_asb = 100 0 0
task_iconified_icon_asb = 100 0 0

# Fonts
task_font = Droid Sans 9
task_font_color = #dcdcdc 100
task_active_font_color = #FFFFFF 100
task_urgent_font_color = #FFFFFF 100
task_iconified_font_color = #dcdcdc 80
font_shadow = 0

# System Tray
systray = 1
systray_padding = 0 6 15
systray_sort = left2right
systray_background_id = 0
systray_icon_size = 22
systray_icon_asb = 100 0 0

# Clock
time1_format = %H:%M
time1_font = Droid Sans 10
clock_font_color = #ffffff 100
clock_tooltip = 
clock_padding = 10 6
clock_background_id = 2
clock_lclick_command = gsimplecal
time1_timezone = 
time2_timezone = 
clock_tooltip_timezone = 

# Tooltips
tooltip = 0
tooltip_padding = 2 2
tooltip_show_timeout = 0.0
tooltip_hide_timeout = 0.0
tooltip_background_id = 2
tooltip_font = Droid Sans 9
tooltip_font_color = #FFFFFF 100

# Mouse
mouse_middle = none
mouse_right = close
mouse_scroll_up = toggle
mouse_scroll_down = iconify

# Battery
battery = 0
battery_low_status = 20
battery_low_cmd = notify-send "battery low"
battery_hide = 96
bat1_font = Liberation Mono 8
bat2_font = Liberation Mono 8
battery_font_color = #B5B5B5 100
battery_padding = 2 0
battery_background_id = 0

# End of config

```



## Numix 테마로 아이콘팩 설치하기

* 이제 Tint2 테스크바를 Numix스럽게 변경했고, Numix 아이콘팩을 받아서 적용해 봅니다.  다운로드 받을 수 있는 장소는 이곳( https://numixproject.org/ )입니다.  여러가지 종류가 있는데, 무료인 것은 Numix Circle 입니다.  이것을 다운로드 받읍시다( http://me4oslav.deviantart.com/art/Numix-Circle-Linux-Desktop-Icon-Theme-414741466 ).  여기 설명된 내용을 참고해서, 다음과 같이 편하게 터미널 명령을 줘서 한방에 다운로드 받아 봅니다(웹에서 다운로드 받으려면 해당 사이트에 회원가입 해야하므로 귀챦음).

```
sudo apt-add-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle
```

* 여기서 'apt-add-repository'라는 명령어는, 온라인 패키지 관리자로 다운로드 받을 수 있는 저장소를 새로 하나 등록해 준다는 것입니다.  Numix 전용 저장소를 새로 등록해 줘서 그곳에서 다운로드 받겠다는 것이죠.  새로 저장소를 등록해 줬으면, 전체 패키지 목록을 갱신해 줘야 하므로 무조건 `sudo apt-get update`를 해 줍니다.  그 이후에야 패키지를 설치하는 것입니다.

* 이제 설치가 다 되었으면, 시스템에서 사용되는 아이콘팩을 교체하기 위해 다음 유틸리티를 사용합니다.

```
lxappearance
```

* 여기서 '아이콘테마' 카테고리로 들어간 후, 'Numix'로 선택해 주고 확인한 후 빠져나옵니다.  pcmanfm 파일탐색기를 보면 즉시 아이콘이 변경된 것을 확인해 볼 수 있습니다.



## Numix 테마로 위젯 설치하기

* 이제 태스크바 디자인도 바꿨고, 아이콘도 바꿨는데 작업창들의 창틀이 안 예쁩니다.  이 문제는 Numix Widget을 더 설치해 주고 그걸로 선택해서 바꿔주면 됩니다.

* 그냥 아래의 명령을 쳐서 깔면 됩니다.  일종의 테마 확장팩 같은 것입니다.

```
sudo apt-get install shimmer-themes
```

* 설치가 다 되었으면, 다시 시스템에서 사용되는 테마를 교체하기 위해 다음 유틸리티를 사용해 봅니다.

```
lxappearance
```

* 여기서 '위젯' 카테고리로 들어간 후, 'Numix'로 선택해 주고 확인한 후 빠져나옵니다.  열려있는 창들이 즉시 변경되는지 확인해 봅니다.

* 여기에 추가적으로, 'obconf'에서도 테마를 변경해 줍니다.

```
obconf
```

* 여기서 'Theme' 카테고리로 들어간 후, 'Numix'로 선택해 주고 확인한 후 빠져나옵니다.  열려있는 창들이 즉시 변경되는지 확인해 봅니다.  이제 테마 관련해서 모두 다 바꿨습니다.




## 바탕화면에 배경 그림 넣어주기

* 바탕화면으로 사용할 그림이 있다면, `~/pictures` 같은 디렉토리를 만들어서 거기다 넣어두고 사용하면 될 것입니다.  일단 그림을 준비해 놨다고 치고...  바탕화면을 설정해주는 유틸리티인 Nitrogen을 실행시킵니다.

```
nitrogen
```

* 'prefenrences' 버튼을 눌러서 그림이 있는 장소를 등록해 줍니다.  그리고 원하는 그림파일을 선택해 줍니다.  바탕화면 색상도 정해줍니다.  그리고 종료.

* 이미 앞서 'autostart'에서 nitrogen의 설정이 유지되도록 백그라운드 실행을 걸어놓았기 때문에 다음번에 재부팅해도 계속 유지가 됩니다.



## Conky 설정하기

* Conky는 바탕화면에 위젯으로 떠서 시스템의 현재 상태를 보여주는 유틸리티입니다.  메모리도 자주 조금 사용하고, 설정파일 하나만 잘 만들어주면 굉장히 다양하게 디자인할 수 있는 개방성 때문에 리눅스 사용자들이 좋아하는 것 같습니다.

* 굳이 없어도 되는 유틸리티이긴 하지만 연습삼아 설정을 해 봅시다.  설정파일은 `~/.conkyrc` 입니다.  직접 연구해서 설정파일을 편집해도 되지만 그건 개인적으로 흥미가 있는 사람이 하면 될 일이고, 그냥 다른 사람이 설정해 놓은 것을 하나 땡겨서 활용하도록 해 봅시다.

* 구글로 '.conkyrc' 검색해 보면 많이 나옵니다.  그 중에서 이곳 ( https://github.com/zenzire/conkyrc )의 설정을 가져와서 사용하는 것으로 해 봅니다.

* 주소를 보면 저장된 장소는 Github 사이트 입니다.  Github는 소스코드 관리도구인 Git 기반으로 운용하는 곳입니다.  따라서 일단 Git을 설치합니다.

```
sudo apt-get install git
```

* 그리고 설치된 Git 명령어를 이용해서, 이곳의 소스코드를 땡겨옵니다.

```
mv ~/.conkyrc ~/.conkyrc.old
mkdir ~/.conky
git clone git://github.com/zenzire/conkyrc.git ~/.conky
ln -s ~/.conky/conkyrc ~/.conkyrc
```

* 기존의 .conkyrc 설정파일을 .conkyrc.old으로 백업해 주고, 대신 .conky라는 디렉토리를 만들어서 그곳에 Github로부터 설정파일과 관련 파일들을 땡겨옵니다.  그 다음에 그 속의 .conkyrc 파일을 심볼릭링크를 걸어서 먹히도록 하는 것입니다.  여기서 사용된 명령어인 'mv', 'mkdir', 'git', 'ln'은 별도로 검색해서 어떤 역할을 하는 것인지 한 번쯤 보고 참고하면 됩니다.

* 이제 현재 화면에서 동작중인 conky에 새로운 설정이 먹히도록 하기 위해, conky를 죽였다가 다시 살리겠습니다.

```
killall conky
conky
```

* 이제 동작이 잘 되는 것을 확인하면 됩니다.  그리고 나중에 .conkyrc 파일을 적당히 편집해서 원하는대로 약간씩 수정해주면 됩니다.  파일을 잘 살펴보면, 별도의 설명서를 정독하지 않아도 대충 맥락을 유추해서 편집할 만 합니다.

* 이미 앞서 'autostart'에서 conky를 자동으로 백그라운드 실횅이 되도록 걸어놓았기 때문에 다음번에 재부팅해도 계속 유지가 됩니다.




## 단축키 설정하기

* 터미널, 텍스트 편집기 같은 매우 자주 사용하는 것들을 단축키를 걸어두고 쓰면 편할 것 같습니다.  단축키 설정해 봅니다.

```
leafpad ~/.config/openbox/rc.xml
```

* 이렇게 편집기를 열어서 설정 파일의 내용을 들여다 보면 좀 복잡합니다.  이중에 단축키 관련 부분을 찾아 보려면, `Ctrl+f`키를 눌러서 'keybind' 단어를 검색 해 봅니다.  그러면 현재 이미 설정되어 있는 단축키들을 파악해 볼 수 있습니다.  살펴보면, keybind 설정들은 모두 keyboard 태그 안에 들어 있다는 것을 알 수 있습니다.  내용을 대충 보고 중요한 것들을 숙지합니다.

* 그리고 새로운 단축키를 추가해 봅시다.  물론 keyboard 태그 안에 새로 똑같은 양식으로 삽입해 넣어야겠죠.  이런 식으로...

```
...
  <keyboard>
    ...

    <keybind key="W-t">
      <action name="Execute">
        <command>x-terminal-emulator</command>
      </action>
    </keybind>

    <keybind key="C-A-t">
      <action name="Execute">
        <command>x-terminal-emulator</command>
      </action>
    </keybind>

    <keybind key="W-e">
      <action name="Execute">
        <command>leafpad</command>
      </action>
    </keybind>

    <keybind key="W-f">
      <action name="Execute">
        <command>pcmanfm</command>
      </action>
    </keybind>

    <keybind key="W-w">
      <action name="Execute">
        <command>firefox</command>
      </action>
    </keybind>

  </keyboard>

```



