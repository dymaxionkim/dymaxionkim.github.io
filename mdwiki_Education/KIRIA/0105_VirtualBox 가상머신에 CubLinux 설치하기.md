# 5교시 : 시스템 구축하기 : VirtualBox 가상머신에 CubLinux 설치하기

## 5.1. Infra

### Hardware

* CPU Cores :
* RAM :
* HDD :
* WiFi : 
* Windows :

## 5.2. Install VirtualBox
![](https://www.virtualbox.org/graphics/vbox_logo2_gradient.png)


### 다운로드

* https://www.virtualbox.org/wiki/Downloads
* Windows Host, 64bit
Version

### 설치

* 다운로드 받은 설치본을 더블클릭!

### 환경설정

* 메뉴 : 파일 - 환경설정
* 기본 머신 폴더 : 원하는 경로로 수정

## 5.3. Make Virtual Machine

### 가상머신 만들기

* 메뉴 : 머신 - 새로만들기
* 이름 및 운영 체제

> 이름 : CUB (편의상 통일합시다.  최대한 짧게 짓는
것이 좋습니다.)

> 종류 : Linux

> 버전 : Ubuntu (64-bit)

* 메모리 크기 : 2048MB
* 하드 디스크 : 지금
새 가상 하드 디스크 만들기
* 하드 디스크 파일 종류 : VDI 또는 VHD 권장
* 물리적 하드 드라이브에 저장 : 고정 크기 권장
* 파일
위치 및 크기 : 권장 40GB

### 가상머신 셋팅

* 메뉴 : 머신 - 설정
* 일반 - 고급
> 클립보드 공유 : 양방향
> 드래그 앤 드롭 : 양방향
* 시스템 -
프로세서
> 프로세서 개수 : 원하는대로
> 실행 제한 : 100%
* 디스플레이 - 화면
> 비디오 메모리 : 128MB
> 3차원 가속
사용하기 : 체크하지 말 것 (성능 안좋음)
> 2차원 비디오 가속 사용하기 : 체크하지 말 것 (버그 있음)
* 네트워크 - 어댑터1
>
다음에 연결됨 : 브리지 어댑터
* 공유 폴더
> + 버튼을 눌러 공유하고자 하는 폴더를 추가

## 5.4. Download CubLinux

![](https://cublinux.com/wp-
content/uploads/2016/01/CubLinux100.png)

### 다운로드

* https://cublinux.com/
* 64-bit 버전을 받아야 함.
* 32-bit 버전은 유한요소해석이 불가능.
* 해석에 필요한 핵심 포트란 라이브러리들이 64비트 버전만 제공되기 때문.

## 5.5. Install CubLinux

### 가상머신에 가상CD 올리기

* VirtualBox 메뉴 : 머신 - 설정
> 저장소 - 컨트롤러:IDE - 비어있음
> 속성 - 광학
드라이브 - CD모양 아이콘 클릭 - 가상 광학 디스크 파일 선택

### 가상머신 시작

* VirtualBox 메뉴 : 머신 - 시작

### 설치

* https://cublinux.com/wiki/doku.php?id=installation
* 가상머신 창이 생기고 부팅
시작됨
* 설치시 한글 환경으로 놓고 바로 설치
* 나오는 메시지에 따라 계속 설치

### 가상머신 부팅 잘 되는지 확인

* 설치가 다 되면 가상머신 재부팅 후 확인


## 5.6. 'VirtualBox 게스트 확장' 설치

### 'VirtualBox 게스트 확장'?

* 가상머신의 기능을 보강해 주기 위해 게스트OS에 깔아주는 소프트웨어.
  1. 자유롭게 해상도
조절 가능.
  2. 전체화면 모드 가능.
  3. 호스트-게스트 간에 클립보드 복사 가능.

### 우선 빌드 환경을 먼저 만들기

* APT로 빌드된 것을 가져와서 설치하는 방법 : 제대로 작동하지 않음
* 직접 가상CD에서 빌드.
```
sudo apt-get install build-essential linux-headers-`uname -r`
```

### 가상CD 마운트

* VirtualBox 메뉴중에서, '장치'에서 '게스트확장 CD이미지 삽입'을 선택.
* 그리고 나서 아래의 명령.
```
sudo mount /dev/cdrom /mnt
```

* 그러면, VirtualBox가 제공해준 가상CD롬을 리눅스에 마운트해 줘서
읽어들이는 것이 가능한 상태가 됨.

### 빌드 및 설치

* 다음 명령을 쳐서 게스트확장 소프트웨어를 설치.
```
sudo /mnt/VBoxLinuxAdditions.run
```

### 재부팅 및 확인

* 재부팅 후, 오른쪽 Ctrl+f 키를 눌러서 전체화면 모드가 잘 작동하는지 확인.
