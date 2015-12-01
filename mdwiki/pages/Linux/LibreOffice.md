
# LibreOffice

## Office

* 무료로 리눅스에 설치가능한 오피스 중에서, MS-Office와 가장 호환성이 좋고 완성도가 높은 것은 WPS Ofiice (구 Kings Office) 입니다.  이곳( http://wps-community.org/ )에서 다운로드 받아다가 설치해서 사용할 수 있습니다.



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
