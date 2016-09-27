# 6교시 : 시스템 구축하기 : VirtualBox 가상머신에 CubLinux 설치하기

## 6.1. CubLinux 둘러보기

### GUI 환경 살펴보기

* X-Window
* Display(Login) Manager : LightDM
* Window Manager
: OpenBox
* Dock : Plank
* System Tray : lxPanel
* File Manager : files
(Nautilus Fork)

## 6.2. 패키지 관리 툴

### APT

* Ubuntu의 기반인 Debian 배포판의 패키지 관리 도구
* 애플 및 MS 앱스토어 같은 것들의 조상님
* 터미널에서
커맨드 명령으로 사용
* 예시
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get
install pcmanfm
```
* https://blog.outsider.ne.kr/346

### Synaptic Package Manager

* Debian 배포판의 GUI화된 패키지 관리 도구
* APT 툴에 GUI를 씌운
개념이므로 기능은 같음

### GDebi Package Installer

* APT 저장소에서 직접 설치하는 방식이 아니고, .deb 포멧의 설치본을 직접 다운로드
받아서 설치할 때 사용
* 원래 기본 명령어인 `dpkg` 보다 한단계 더 발전한 것 (의존성 있는 패키지를 자동으로 함께 설치해 주는 기능
추가)
* CubLinux에는 GUI도 함께 설치되어 있음
* 웬만하면 APT 같은 것으로 소프트웨어를 설치하는 것이 좋음
* 지속적인
업데이트를 자동으로 처리할 수 있기 때문임

## 6.3. 터미널

### GNOME Terminal

* X-Window에서 사용하는 터미널
* CubLinux에 기본으로 설치되어 있음
* 가장 자주 사용하는
도구

## 6.4. 주요 디렉토리 구성

### /
```
 /bin
 /home
 /media
 /opt
 /root
 /usr
```

## 6.5. MS윈도우 시스템과의 차이점

항목  |MS윈도우  | 리눅스
------|----------|----------
설정  |레지스트리|텍스트 설정파일
GUI   |Direct
|X-Window Server
루트  |C:\       |/
디렉토리 구분자 |\ |/
현재 디렉토리|.|.
어머니 디렉토리|..|..
