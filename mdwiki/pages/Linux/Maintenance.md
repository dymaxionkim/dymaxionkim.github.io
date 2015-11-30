# Maintenance


## 콘솔 스크린세이버 끄기

* Ubuntu Server를 설치하면, 기본 셋팅으로 콘솔 상태에서 10분 후에 자동으로 스크린이 꺼지도록 스크린세이버 설정이 되어 있습니다.  독립적인 PC에서라면 상관없겠지만, VirtualBox에서 운용할 때는 이게 필요 없으므로 콘솔 스크린세이버 기능을 죽이도록 합시다.

* 먼저 사용자 계정의 bash 설정을 변경합니다.	
`nano ~/.bashrc`해서 `setterm -blank 0` 추가.  이때 setterm 이라는 것은 터미널 셋팅을 바꿔주는 유틸리티인데, 이걸 터미널 시작될 때 자동으로 실행하라는 의미입니다.

* 그리고 전체 계정(Multiuser Runlevel)의 기본 쉘 설정을 변경합니다.
`sudo nano /etc/rc.local`해서 `setterm -blank 0` 추가

* 그래도 혹시 모르니깐 GRUB 부트로더 로딩될 때의 설정도 변경합니다.
`sudo nano /etc/default/grub`해서 `GRUB_CMDLINE_LINUX_DEFAULT=""` 파라미터를 `GRUB_CMDLINE_LINUX_DEFAULT="consoleblank=0"`으로 변경하고 나온 후, 터미널 명령으로 `sudo update-grub`해서 grub 설정을 먹여줍니다.

* 그리고 `sudo reboot now` 해서 재부팅.

* 참고한 출처 : http://superuser.com/questions/152347/change-linux-console-screen-blanking-behavior/154388#154388


## X윈도우 스크린세이버 끄기

* 콘솔 말고도, X윈도우 역시 일정 시간이 지나면 스크린이 자동으로 꺼지도록 디폴트 설정 되어 있습니다.  VirtualBox에서 운용할 때, 종종 꺼진 스크린을 다시 살릴 때 시스템이 먹통이 되는 경우가 보이므로 이것도 없애려고 합니다.

* `sudo nano /etc/X11/xinit/xinitrc`로 들어간 후 `xset s off -dpms`를 추가해 줍니다.


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




## SAMBA로 네트워크 드라이브 연결하기

## 호스트OS(윈도우) 쪽의 NTFS 드라이브 마운트하기

## apt-get 명령을 사용할 때 에러 발생시 대처방법
