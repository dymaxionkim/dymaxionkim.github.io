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







