
# 연습으로 해 보는 개인 NAS 서버 셋팅
_굴러다니는 구식 넷북에 우분투 서버 깔고 환경 구성해 보기 - 퍼포먼스는 포기한다_

## 하드웨어
* Model : HP Mini 110-3000
* P/N : X643PA#AB1
* S/N : NC0223QPN
* BIOS : F.05
* Proessor : Intel Atom N455 @ 1.66GHz
* RAM : 1024MB
* 2010년 경에 구입했던 2세대 아톰 CPU가 적용된 구형 넷북.


## OS 설치
* 우분투 서버(Ubuntu Server 16.04 32bit)를 USB를 통해 넷북에 설치한다.
* 이때, SSH / LAMP / SMB를 옵션으로 줘서 기본적으로 설치되도록 한다.
* 설치 완료후, 최초 로그인 하고 나서 시스템을 업데이트 한다.


## SSH 셋팅
* 외부 컴퓨터에서 원격으로 SSH 접속을 시도해 본다.
* RSA Key 관련해서 실패한다면, 외부 컴퓨터에서 다음과 같은 식으로 명령을 준다.
```
ssh-keygen -R 221.100.181.135
```
* 그리고 다시 접속 시도.
```
ssh dong@221.100.181.135
```


## USB 저장장치 자동 인식
* 참고 : http://blog.saltfactory.net/linux/mount-external-harddisk-on-ubuntu.html
* 우분투서버의 경우 usbmount를 설치하면 자동 인식 및 마운트가 된다고 한다.
```
sudo apt-get install usbmount
```
* 인식이 잘 되어 있는지 확인해 본다.
```
sudo fdisk -l
```
예들 들어 본 시스템의응답을 보면 `/dev/sdb` 디스크가 기존의 서버시스템이고, `/dev/sda` 디스크가 새로 연결한 usb 하드디스크임을 볼 수 있다.  이것이 마운트가 잘 되어 있는지 확인하려면…


* 다만, 이때 문제가 하나 있는데, usb 장치 또는 서버컴퓨터가 usb3일 경우에 버그 때문에 해당 버그가 있는 서비스인 uas를 중지시켜서 usb2 상태로 그냥 운용해야 한다.
```
sudo rmmod uas
```
* 확실히 하기 위해 커널에서 uas 서비스 자체를 블랙리스트로 해서 살아나지 못하게 한다.
```
sudo nano /etc/modprobe.d/blacklist.conf
```
해서 마지막줄에 다음 구문을 추가한다.
```
blacklist uas
```
* 그리고 재부팅.
* 만일 NTFS 포멧의 하드디스크라면 마운트에 실패할 확률이 매우 높다.  가능하면 EXT4 포멧의 하드디스크로 안정적으로 마운트시켜 사용하는 것이 낫겠다.


## USB 저장장치 수동 인식
* 자동 인식이 여의치 않으면 직접 수동으로 인식하는 수 밖에…
* 마운트할 디렉토리를 먼저 만든다.
```
sudo mkdir /media/usbdisk
```
마운트한다. (ntfs이므로 -r 옵션을 줘서 읽기 전용으로 한 경우)
```
sudo mount -t ntfs-3g -r /dev/sda1 /media/usbdisk
```
ntfs가 아니고 다른 포멧이라면 옵션을 바꿔준다.  예를 들어 ‘-t vfat’으로 한다던가.
언마운트는 이렇게..
```
sudo umount /dev/sda1
```


## 공유기
* 현재 사용중인 공유기는 iptime G304-Mimo 제품. (아마 2007년 경에 구입했던 걸로 기억)
* 이 제품의 펌웨어 업데이트는 현재 중단되었고, 때문에 iptime의 DDNS 서비스도 중단되어 더이상 제공되지 않는다. (보안 문제 때문이라고 함)
* 따라서 다른 외부 무료 DDNS 서비스( http://freedns.afraid.org/ )를 이용해 볼 수도 있다.
* dymaxionkim.mooo.com 도메인을 연결해 봤다.  설정후 곧바로 활성화되지는 않고 몇 분 있다가 확인해 보면 연결이 됨을 확인할 수 있다.
* 예를 들어 221.100.181.135 공인아이피로 공유기가 인터넷에 접속하고 있는데, 유동아이피 서비스를 이용중이기는 하지만 공유기에서 아예 이 아이피로 고정적으로 연결하도록 설정해 두었다.  다른 집에서 이 아이피를 가로채 갈 확률은 낮으리라 기대해 본다.  다만 이렇게 하면, 다른 집에서 해당 공인아이피를 먼저 선점해 버리면 인터넷 연결이 안되기 때문에, 유동아이피 상태로 그대로 운용하는 것이 맞다.
* DDNS 서비스를 이용시, 공유기에서 유동아이피의 변경을 계속 DNS서비스 서버 쪽으로 리프레쉬를 계속 해 줘야 한다.  문제는 iptime G304-Mimo 제품은 너무 구닥다리라 freedns 서비스 서버에 이걸 해 주지 못하도록 막아놨다.  따라서 아이피가 변경되면 직접 수동으로 바꿔줘야 한다.


### ddns 서비스를 공유기에 의존하지 않고 직접 수동 셋팅
* 참고 : http://blog.ojj.kr/959
* NAS에 SSH로 접속한 후, 다음 명령어를 치면 공유기의 공인아이피를 응답으로 뱉아내 준다.  다만 이것은 개인 사이트의 서비스이기 때문에 언제 중단될지 모른다.
```
curl ip.ojj.kr
```
응답은
```
Your IP is 221.100.181.135
```
* 이 원리를 이용해서 자동으로 공인아이피를 갱신해서 DDNS를 업데이트해 줄 수 있을지도 모른다.
* 참고 : http://takuma99.tistory.com/202
* 한편 DDNS 서비스 제공자 측에서는, wget 스트립트를 제공해 주므로 그것을 받아본다.
```
wget -q --read-timeout=0.0 --waitretry=5 --tries=400 --background http://freedns.afraid.org/dynamic/update.php?인증코드
```
* 원리는, wget으로 freedns 서버에 있는 update.php 스크립트가 작동하도록 트리거링해 주는 것 같다.  update.php 스크립트는 아마 wget 명령을 발신한 곳의 아이피를 파악한 후 그 아이피로 ddns 셋팅을 업데이트해 주는 것일 것이다.
* wget 명령은 공유기 자체가 쏴도 될 것이고, 그 밑에 있는 NAS가 쏴줘도 될 것이다.  왜냐면 freedns에서 접근하면 어차피 동일한 공인아이피로 파악될 것이기 때문이다.
* 실행하고 나면, wget이기 때문에 `update.php?인증코드`라는 이름의 아웃풋 파일이 생긴다.  재실행 될 때 마다 `.1` 식으로 번호가 붙으면서 계속 파일이 추가된다.  파일 내용은 다음과 같다.
```
ERROR: Address 221.100.181.135 has not changed.
```
* 이 파일은 굳이 큰 쓸모는 없기 때문에 바로 삭제되도록 설정해 줘도 되고, 또는 나중에 모아서 수동으로 지워도 될 것이다.
```
rm ./update.php?인증코드*
```
* 참고 : http://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_%EB%B0%98%EB%B3%B5_%EC%98%88%EC%95%BD%EC%9E%91%EC%97%85_cron,_crond,_crontab
* 그럼 이제 crontab에 이 명령을 등록해 주고 주기적으로 실행되도록만 해 주면 된다.
* 먼저 cron으로 반복실행될 명령어를 묶은 쉘스크립트를 작성한다.  여기서는 `/home/dong/Refresh_DDNS.sh` 이름으로 지어두자.
```
#!/bin/bash
wget -q --read-timeout=0.0 --waitretry=5 --tries=400 --background http://freedns.afraid.org/dynamic/update.php?인증코드
rm ./update.php?인증코드*
```
* 이 스크립트 파일에 실행 권한을 부여한다.
```
chmod +x ./Refresh_DDNS.sh
```
* 그리고 crontab을 새로 등록한다.
```
crontab -e
```
해서 편집기로 들어간 후 다음 내용을 써 넣는다. (30분마다 반복하도록 설정)
```
*/30 * * * * /home/dong/Refresh_DDNS.sh
```
굳이 루트 계정일 필요는 없기에, 루트가 활성화되지 않은 우분투서버를 상정해서 이렇게 사용자 계정으로 처리해 두었다.
* 그리고 확실히 하기 위해 등록된 crontab 목록 확인
```
crontab -l
```
* 현재 cron 서비스가 작동중인지 확인
```
ps -ef | grep cron
```
* 이제 cron 서비스 자체를 재시작
```
/etc/init.d/cron restart
```
또는
```
sudo service cron restart
```
* 그럼 이제 cron이 실행되어야 한다.  자동 실행 스크립트인 Refresh_DDNS.sh에서 rm 명령어를 삭제하면 아웃풋 파일이 30분 단위로 생성되어야 한다.  그런데 현재 상태로는 생성되지 않는다.
* 이유를 찾기 위해 시스템 로그 파일을 열어보자.
```
grep CRON /var/log/syslog
```
해서 cron이 실행되었을 때 에러메시지를 보면,
```
Sep 26 14:30:01 SERVER32 CRON[24033]: (CRON) info (No MTA installed, discarding output)
```
라는 문구가 보인다.  이 에러는 아웃풋 파일 생성시에 발생하는 것이므로 중요치 않기 때문에 무시해도 상관 없다.  다만 확실히 하기 위해 원인을 알고 해결해 본다.  이것을 해결하기 위해서는 MTA가 필요하다고 하는데, 이를 위해 postfix라는 패키지를 설치해야 한다고 한다.
```
sudo apt-get install postfix
```
설치 할 때 옵션 주는 것이 나오는데 쓸데 없는 옵션은 다 배제하고 결과를 지켜보자.
* 시간을 두고 지켜보면서 생성되는 아웃풋 파일들을 확인해보고, 이상이 없다고 확인 되면 이제 아웃풋 파일 자동 생성된 후 지워지도록 스크립트의 rm 명령을 다시 복원한다.
* 이후부터는 유동아이피가 제공되는 환경에서, 공인아이피가 바뀔 경우 30분마다 체크해서 아이피가 바뀌면 자신의 도메인으로 연결해서 갱신해 줄 것이므로 길어도 수십분 안에 도메인 연결이 다시 이루어질 것이다.




## OwnCloud 설치 및 설정

### OwnCloud 다운로드 및 인스톨
* 참조 : https://download.owncloud.org/download/repositories/stable/owncloud/
* 서버 터미널에서 다음 명령을 줘서 원격저장소를 등록하고 설치한다.  이렇게 apt 저장소를 통해 설치하는 방식의 잇점은, 지속적인 업데이트가 간단히 지원되고 의존성 있는 선행 패키지들이 자동적으로 알아서 함께 설치된다는 점이다.
```
wget -nv --no-check-certificate https://download.owncloud.org/download/repositories/stable/Ubuntu_1*04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Ubuntu_1*04/ /' >> /etc/apt/sources.list.d/owncloud.list"
sudo apt-get update
sudo apt-get install owncloud
```
* 저장소 업데이트 중에 인증키가 약하다는 경고가 있을 수 있으나 무시해도 진행은 된다.   설마 이 저장소를 나쁜 해커가 손대진 않았겠지..  (--no-check-certificate 옵션 때문임)


### OwnCloud를 위한 MySQL 설정
* 참조 : http://psychoria.tistory.com/entry/My-Cloud-OMV%EC%97%90%EC%84%9C-OwnCloud-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0
* 일단 mysql 서비스를 기동해 준다. (이미 시작되어 있겠지만 확인 차원에서)
```
sudo service mysql start
```
* mysql의 root로 들어간다. (root의 패스워드는 OS설치할 때 LAMP 설치 과정에서 이미 정해준 것을 사용함)
```
sudo mysql -u root -p
```
* mysql 프롬프트 상에서 이제 새로운 DB를 만든다.
```
create database owncloud;
create user 'owncloud'@'localhost' identified by '패스워드';
grant all privileges on owncloud.* to 'owncloud'@'localhost';
flush privileges;
exit
```

### OwnCloud를 위한 Apache2 설정
* 현재 기본 포트는 80으로 설정되어 있다. (OS LAMP 설치시 기본값)
* 포트를 변경하려면 /etc/apache2/ports.conf 및 /etc/apache2/sites-available/default 파일을 편집기로 포트값을 수정해 주면 된다.  일단은 생략하고 원래 설정대로 가기로 한다.
* OwnCloud를 웹페이지로 올리기 위해 별도의 추가 조치는 필요 없다.
* 웹브라우저에서 다음과 같은 식으로 주소를 쳐서 들어간다.
```
http://221.100.181.135/owncloud
```
또는 DDNS로 도메인을 얻어 두었다면
```
http://dymaxionkim.mooo.com/owncloud
```
* 그러면 이제 OwnCloud의 최초 페이지가 나타난다.



### OwnCloud 최초 웹 설정
* 최초 페이지에서, '저장소 및 데이터베이스' 문구를 마우스로 눌러서 해당 부분을 맞춰준다.
* 데이타베이스 부분은 앞서 설정한 mysql 설정대로 하면 된다.
* 저장소 경로는 일단 그대로 두거나, 또는 원하는 경로를 지정하면 된다. 일단은 디폴트값인 /var/www/owncloud/data 으로 그냥 둔다.
* 저장소 경로를 옮기려면, 이 경로에 대해서 심볼릭 링크를 이용해서 속여주면 된다.  이런 식으로.
```
mkdir /home/dong/owncloud
sudo service apache2 stop
sudo mv /var/www/owncloud/data /home/dong/owncloud/data
sudo ln -s /home/dong/owncloud/data /var/www/owncloud/data
sudo chown www-data:www-data /home/dong/owncloud/data
sudo chown www-data:www-data /var/www/owncloud/data
sudo chmod 775 /home/dong/owncloud/data
sudo chmod 775 /var/www/owncloud/data
sudo service apache2 start
```
* 그리고, 계정 및 비밀번호 넣는 란에는 관리자로 운용할 계정과 비번을 정해서 넣어준다.
* 이제 '설치완료' 버튼을 누르면 된다.
* 넷북이 상당히 느리므로, 약간의 시간이 소요된다.


### OwnCloud에 대한 의견
* 구닥다리 32비트 넷북으로는 아무래도 속도면에서 완전히 만족하기는 어렵다.  그럼에도 불구하고 약간 느긋한 마음이라면 충분히 사용하는데는 지장이 없는 것 같다.
* 파일을 이리저리 옮기면서 관리를 하기에는 웹인터페이스이다 보니 아무래도 한계가 있다.  구글드라이브 보다 불편하거나 구현이 아직 안 된 부분도 있다.
* 그러나 구글드라이브보다 기능적으로 나은 점은 분명히 있다.  아주 간단하게 외부 공유 링크 주소를 만들어 낼 수 있다.  이 기능 하나만으로도 OwnCloud를 설치하는 보람이 충분하지 않을까.  또 제공되는 GUI 클라이언트용 싱크 프로그램도 그럭저럭 나쁘지 않다.  게다가 리눅스 버전도 제공된다.
* 여러가지 플러그인이 제공되긴 하는데 단순한 면이 장점이자 단점이다.  신뢰성은 아직 말은 못하겠다.
* LibreOffice Online을 붙여서 쓸 수 있는 환경이 되어가는 것 같은데, 아직은 이걸 구성하기 쉽도록 제공되는 수준은 아닌 듯 하다.  직접 해 보려면 LibreOffice Online 패키지를 직접 컴파일해서 설치하고 이걸 OwnCloud에 붙여서 동작하도록 설정을 이리저리 뜯어고쳐 만들어내야 한다.  그냥 안되는 걸로 치자.


## 위키 서비스 추가
* 기능적으로는 MediaWiki가 짱이지만, 아무래도 32비트 넷북이라는 점을 고려하고, 또 MediaWiki의 복잡도가 너무 높아 유지관리 및 백업의 불편함이 너무 크다는 점 때문에 제외한다.
* DockuWiki니 뭐니 하면서 여러가지 많이 추천들이 되지만 역시 다 제외하고…
* 최고로 간단한 MDwiki를 올려본다.
* MDwiki는 간단히 말해 자바스크립트가 포함된 html 파일 달랑 하나만 가지고 모든 서비스를 제공하는 아주 심플한 것이다.  물론 자체적인 편집기,검색기능 등은 없다.  장점은 마크다운 문법 기반이고, 직접 파일을 다루므로 git 같은 버전관리 시스템과 결합해 놓으면 형상관리 기능도 해결된다.  자체 편집기는 없으나 prose.io 같은 외부 온라인 편집기 서비스와 연결해서 사용하면 편리하더라.
* 개인적으로는 MediaWiki가 가장 표준적이고 또 신용도가 높으므로, 이것을 기반으로 궁극적으로 가야하지 않나 하는 생각이 있다.  만일 팀 단위 이상의 인원이 공용으로 사용할 것이라면 MediaWiki를 사용하게 될 것이다.


## ftp 서비스
* 일단 보류.  역시 구세대 프로토콜이기 때문에 편리한 점이 많기는 하지만 제외해 둔다.

## 삼바 서비스
* 제외해 본다.  내부망에서만 쓸모가 있기 때문에 활용도가 낮아지고 있다고 생각된다.

## WebDAV 서비스
* 참고 : http://www.spacek.xyz/mle/?p=397
* 별도의 WebDAV 서비스를 서버에서 직접 돌리지 않고, OwnCloud 자체적으로 제공하는 WebDAV 서비스를 그대로 이용하기로 한다.  OwnCloud 쪽에서는 이미 서비스되고 있기 때문에 별도의 셋팅이 불필요하다.
* 클라이언트 쪽은, 윈도우시스템의 탐색기에서 네트워크 위치 추가를 해 보려고 별 짓을 다 해 봤지만 결국 안된다.  ( https://doc.owncloud.org/server/9.0/user_manual/files/access_webdav.html#accessing-files-using-microsoft-windows )  때문에 별도의 클라이언트 프로그램을 설치해서 쓰는 것이 좋겠다고 생각된다.
* 기본적으로 OwnCloud Sync 프로그램을 설치해서 사용하면 이것이 내부적으로 WebDAV 프로토콜을 쓴다.  다만 이것은 싱크 프로그램이기 때문에 좀 부담스럽다.
* 무료 프로그램 중에서는 Cyberduck을 사용해 볼 수 있겠다.  https://cyberduck.io/

## DLNA 서비스
* 집에 있는 삼성TV에서 스트리밍으로 땡겨서 영화 보려면 이 서비스가 필요하다고 하는데 글쎄…  셋팅 시도하다가는 깊은 수렁에 빠질 것 같다.




## 설치 후 소감
* OwnCloud를 웹브라우저 접속할 때 반응속도는 상당히 괜챦다.  여러 사람이 들락거릴 것도 아니므로 32비트 구형 넷북 성능으로도 충분히 좋다고 생각된다.
* 문제는 파일 업로드 속도와 제한 용량의 압박.  대형 파일을 업로드 해 보니 속도는 2MB/s 정도 나온다.  뭐 이정도는 참고 써 주지 하면서 계속 보니깐 점점 속도가 저하되더니 나중에는 200~300kB/s 까지 낮아진다.  그리고 32비트 시스템이다 보니, http 프로토콜로 파일을 올릴 때 2GB 제한을 벗어날 수 없다.  그보다 작은 파일이라 하더라도 업로드 시도할 때 실패율이 너무 높다.  구닥다리 공유기 + 구닥다리 넷북의 시너지 효과로 보이는데….
* 이 속도와 안정성으로는 대형 파일의 업로드/다운로드가 필요한 동영상파일, 대형 소프트웨어 설치본, 업무 관련 파일을 보관하는데는 무리가 있다.  작은 파일이 잔뜩 있는 사진 자료 백업용으로는 뭐 그럭저럭 쓸 수 있지 않을까…
결론적으로는 그냥 최신형 공유기 중에서 제일 좋은걸 하나 사서 거기에 하드디스크 하나 붙여서 쓰는게 나을 것 같다. ㅠㅠ
* 뭐 그래도 이거 해 본다고 이틀 정도 삽질하면서 공부는 좀 된 것 같다.
