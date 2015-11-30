# Tips

## UbuntuBang 설치 자동화 도구
* [Setup_OS](Setup_OS.md) 및 [Setup_Apps](Setup_Apps.md) 문서의 전 과정을 자동화한 도구이다.
* 이곳( https://github.com/dymaxionkim/UbuntuBang )의 설명대로 따라 하면 된다.

## 하드디스크 점유율 확인
```
df -h
```

----

# 응용 프로그램 관련

## LibreOffice 테마 바꾸기

* LibreOffice를 사용할 때 아이콘 같은 것들이 좀 촌스러우므로 세련되게 바꿔 봅니다.

* 출처 :  http://www.webupd8.org/2013/06/try-new-libreoffice-flat-icon-set.html

* 일단 아래의 명령을 통해 스타일 및 아이콘팩을 설치하고...

```
sudo apt-get install libreoffice-style-crystal
cd /tmp && wget https://github.com/hotice/myfiles/raw/master/images_flat.zip
sudo cp images_flat.zip /usr/share/libreoffice/share/config/images_crystal.zip
```

* LibreOffice를 시작해서 'Tools - Options' 메뉴로 들어간 다음, 팝업창이 뜨면 'LibreOffice - View - Icon Size and Style'에서 아이콘 테마를 디폴트의 "Tango"에서 "Crystal"로 바꿔줍니다.  그러면 끝.
