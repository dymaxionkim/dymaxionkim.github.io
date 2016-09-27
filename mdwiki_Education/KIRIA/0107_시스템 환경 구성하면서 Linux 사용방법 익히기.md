# 7교시 : 시스템 구축하기 : 시스템 환경 구성하면서 Linux 사용방법 익히기

## 7.1. 기본 환경 셋팅

### Google Chrome 설치
![](https://www.google.com/chrome/assets/common/images/chrome_logo_2x.png?mmfb=a5234ae3c4265f687c7fffae2760a907)
* CubLinux에는 Chromium이 기본 설치되어 있음
* 내장 플래쉬 플레이어, 동영상 코덱 등 중요 기능이 제외되어 있어 불편함
*
따라서 Google Chrome으로 대체하는 것이 좋겠음
* CubLinux에서는 메뉴 선택으로 쉽게 전환 가능
*
https://cublinux.com/wiki/doku.php?id=switch_to_chrome

### 공유 디렉토리 설정

* 가상머신 설정할 때 지정한 공유 디렉토리를 실제 사용할 수 있도록 셋팅
* `/media` 안에 들어가 보면
`sf_share` 식으로 `sf_`라는 두문자가 붙은 디렉토리가 생겨있음을 확인
* 그러나 현재 계정으로는 접근 권한이 없음
* 접근권한은
`vboxsf` 유저그룹에게만 주어져 있음.

* 따라서 터미널에서 다음의 명령어를 쳐서 현재 나의 아이디를 `vboxsf` 그룹으로 넣어 주면 됨.
```
sudo usermod -G
vboxsf -a 계정
```
* 그리고 재부팅해서 접근이 되는지 확인.
* 만일 매번 `/media/sf_share`으로 접근하기가 귀챦다면,
아래 처럼 심볼릭 링크를 걸어줘서 편리하게 사용 가능.
```
ln -s /media/sf_share ~/sf_share
```

### 한글 입력기 설치

* 현재는 한글을 읽을 수는 있지만, 한글을 쓸 수 없는 상태임.
* 한글 입력기 소프트웨어가 설치되어 있지 않기
때문.
* 따라서 한글 입력기를 설치하고 설정을 해 주어야 함.

* 여러가지 다양한 한글 입력기들이 있는데, 그 중에 [다솜 입력기](https://dasom-im.github.io/)를 설치하기로 함.
```
sudo add-apt-repository ppa:dasom
sudo apt-get update
sudo apt-get install
dasom dasom-gtk dasom-qt dasom-jeongeum
```

* 한글 입력기 선택 : 아래의 명령을 친 후, 창이 뜨면 Dasom을 선택.
```
im-config
```

* Dasom 입력기 셋팅 : 아래의 명령을 치고...
```
dconf-editor
```

* 창이 뜨면 다음과 트리를 찾아들어감.

> org - freedesktop - dasom - engines - jeongeum

* 여기서 다음과 같이 내용을 수정

> double-consonant-rule ::: 체크해제 (이렇게 하면 'ㄷㄷ'을 칠 때 'ㄸ'이 아니라
'ㄷㄷ'이 된다.)

> hangul-keys ::: ['hangul', 'shift-mask space'] (한글키(=우측Alt키) 및
Shift+Space키로 모두 한영전환이 되도록 설정)

> hanja-keys ::: ['hangul-hanja']
(한자키(=우측Ctrl키)로 한글을 한자로 변환)

> korean-101-104-key-compatible ::: 체크. (내부적으로
xmodmap이 돌아가도록 하는 설정이라고 함)

> layout ::: '2' (2벌식 자판)


* 이제 재부팅하고 한글 입력 잘 되는지 확인.

### 폰트 설치

* 기본적인 한글 폰트는 이미 설치되어 있지만, 확실하게 필수 폰트를 다 설치하는 것이 좋겠음.
* 한글 폰트 중
Google Noto CJK 및 Nanum 폰트 패밀리 설치
```
sudo apt-get install fonts-noto-cjk fonts-
nanum*
```

### 한국어 랭귀지 팩 설치

* 기본적인 한국어 환경은 다 설정이 잘 되어 있지만, 누락된 것이 있을 수 있으므로 전체적으로 패키지화된 것을
설치해 주는 것이 좋겠음.
```
sudo apt-get install language-pack-ko
```

### 테마 설정

* 바탕화면에서 마우스 오른쪽 버튼을 누르면 메뉴가 뜸.  여기서 다음 2개의 프로그램을 이용하여 설정.

> Control
Panel - Change Theme (터미널 명령 : `lxappearance`)

> Control Panel - OpenBox
Configuration Manager (터미널 명령 : `obconf`)

* 기본적으로 들어있는 테마들이 그다지 예쁘지 않으면...  더
좋은 것을 받아서 설치하자.

#### NUMIX 테마 설치

* NUMIX 프로젝트 : https://numixproject.org/
```
sudo apt-get
install shimmer-themes
```
* 설치 후, `lxappearance` 유틸리티로 NUMIX 테마를 선택해 주면 됨.

#### NUMIX 아이콘 팩 설치

* NUMIX 프로젝트에서 무료로 배포해주는 아이콘 팩도 받아서 설정해 주면 더 예뻐진다!
* 전용
저장소를 새로 등록해 주고 나서 설치.
```
sudo apt-add-repository ppa:numix/ppa
sudo apt-get
update
sudo apt-get install numix-icon-theme-circle
```
* 설치 후, `lxappearance`
유틸리티로 NUMIX Circle 아이콘팩을 선택해 주면 됨.

#### MOBLIN 마우스 커서 아이콘 팩 설치

* 기본으로 지정되어 있는 마우스 커서가 정확히 포인팅하기에 부적절하므로, Moblin 커서
테마를 설치.
```
sudo apt-get install moblin-cursor-theme
```
* 설치 후, lxappearance
유틸리티로 Moblin 마우스 커서 아이콘 테마로 선택해 주면 됨.

#### 윈도우의 드래그 선택 영역 조정

* 윈도우 가장자리를 마우스로 찍어서 사이즈를 변경할 때, 인식하는 영역이 너무 좁아서
불편하다면...
* `obconf`에서 `Move&Resize` 탭으로 들어가서 `Drag Threshhold Distance`를 조절해 주면
됨.

## 7.2. 추가 유틸리티 설치

### pcmanfm

* 기본 File Manager는 Nautilus를 개작한 Files가 설치되어 있음
* 이것 말고 pcmanfm을
추가로 설치하여 자신에게 편한 것을 골라 사용
```
sudo apt-get install pcmanfm
```

### WPS Office

![](http://wps-community.org/app/images/call-to-action-text.svg)
* 무료로 리눅스에 설치가능한 오피스 중에서, MS-Office와 가장 호환성이 좋고 완성도가 높은 것은 WPS Ofiice (구 Kings
Office).
* 다운로드 : http://wps-community.org/
* 64bit DEB 패키지를 선택해서 다운로드.
* 다운로드
받은 파일을 더블클릭해서 설치.
* 설치되는 장소는 '/opt' 디렉토리.
* 다만, 이것은 오픈소스가 아니라 프리웨어임.

### LibreOffice

* https://ko.libreoffice.org/
* 최신 안정판 버전 패키지 설치
```
sudo add-
apt-repository ppa:libreoffice/ppa
sudo apt-get update
sudo apt-get install
libreoffice libreoffice-help-ko
```

### ArkZip

* CubLinux에 기본으로 포함된 압축해제 유틸리티는 File-Roller.
* 윈도우에서 압축한 한글이름의 파일은
리눅스에서 풀면 한글 이름들이 깨져서 나오는 단점이 있음.
* 윈도우의 한글 코드가 UTF-8 표준을 준수하지 않기 때문임.
* 따라서 한글이
깨지지 않는 압축 해제 유틸리티를 추가 설치.
* 다만 이 ArkZip은 압축 해제 기능만 있고, 압축을 해 주는 기능은 없음.
```
wget
https://github.com/Thestars3/arkzip/releases/download/v2.4.4/arkzip_2.4.4_amd64.deb
sudo apt-get install libqt4-core
sudo dpkg -i arkzip*.deb
```

### Gimp

![](https://www.gimp.org/images/frontpage/wilber-big.png)

* 포토샵 대체품.
최신 버전을 받기 위한 저장소를 추가해서 설치.
```
sudo add-apt-repository ppa:otto-
kesselgulasch/gimp
sudo apt-get update
sudo apt-get install gimp
```

### InkScape

![](https://media.inkscape.org/static/images/inkscape-logo.svg)

*
아도비 일러스트레이터 대체품.
* 최신버전을 받기 위해 전용 저장소를 추가해서 설치.
```
sudo add-apt-repository
ppa:inkscape.dev/stable
sudo apt-get update
sudo apt-get install inkscape
```

### VLC Player

![](http://images.videolan.org/images/VLC-IconSmall.png)

* 동영상
재생기.
* 보통 많이 쓰는 SMplayer와 특성이 조금 다르다.
```
sudo apt-get install vlc browser-
plugin-vlc
```

### Qalculate!

* 공학용 계산기.
```
sudo apt-get install qalculate
```

### ConvertAll

* 단위 변환기.
```
sudo apt-get install convertall
```

### Cups-pdf

* pdf 파일로 출력해주는 가상 프린터.
```
sudo apt-get install cups-pdf
```

### Firefox 브라우저

* 구글 크롬 브라우저가 너무 무겁기 때문에, 좀 더 경량이면서 모든 기능이 지원되는 브라우저가 있으면 좋다.
```
sudo apt-get install firefox firefox-locale-ko
```

### Brave 브라우저

* https://github.com/brave/browser-laptop/
* Firefox 브라우저가 차지하는
메모리 및 반응속도도 불만족스럽다면, 이것을 설치해 보자.
```
wget -O brave.deb https://laptop-
updates.brave.com/latest/dev/ubuntu64
sudo apt-get install gvfs-bin
sudo dpkg -i
./brave.deb
```

### Min 브라우저

* https://minbrowser.github.io/min/
* 최신 기술이 적용된 새로운 개념의 브라우저를 써보고
싶다면, 이것을 설치해 보자.
* Node.js Electron 기반으로 순수하게 Javascript만으로 구현된 것.
* 다운로드 후
더블클릭하여 설치 : https://github.com/minbrowser/min/releases
