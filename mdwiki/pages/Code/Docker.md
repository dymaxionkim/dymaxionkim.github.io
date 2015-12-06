# Docker

![Docker](https://www.docker.com/sites/all/themes/docker/assets/images/logo.png)

## Docker ?
* 이게 뭔지는 정확하게 구글링해서 알아보면 됩니다.
* 간단히 말해, 필요한 운영체제 환경을 격리시켜서 모듈화하는 개념이죠.  그런데, 빠르고 용량도 적게 먹고, 또 사용법만 습득하면 의외로 간단합니다.
* 다른 사람들이 미리 이미지를 떠 놓은 것들을 https://hub.docker.com 에서 공유하기 때문에, 필요한 환경을 검색해서 가져다 쓰면 됩니다.

## 응용
* JupyterHub 서비스
* RedMine 프로젝트 관리 도구 서비스
* PDM 서비스

뭐 이런 것들을 따로따로 Docker로 묶어서 제공한다면 관리가 상당히 편해지지 않을까 생각되네요.  실제 사용 방법은 천천히 익혀봐야 겠습니다.

<<<<<<< HEAD
=======
# Docker

![Docker](https://www.docker.com/sites/all/themes/docker/assets/images/logo.png)

## Docker ?
* 이게 뭔지는 정확하게 구글링해서 알아보면 됩니다.
* 간단히 말해, 필요한 운영체제 환경을 격리시켜서 모듈화하는 개념이죠.  그런데, 빠르고 용량도 적게 먹고, 또 사용법만 습득하면 의외로 간단합니다.
* 다른 사람들이 미리 이미지를 떠 놓은 것들을 https://hub.docker.com 에서 공유하기 때문에, 필요한 환경을 검색해서 가져다 쓰면 됩니다.

## 응용
* JupyterHub 서비스
* RedMine 프로젝트 관리 도구 서비스
* PDM 서비스

뭐 이런 것들을 따로따로 Docker로 묶어서 제공한다면 관리가 상당히 편해지지 않을까 생각되네요.  실제 사용 방법은 천천히 익혀봐야 겠습니다.

>>>>>>> 1cc181293fd9a5b7ecd794c8d7700671c95b0131
## 설치 방법 1 (쉽게 가기)
* 참고 : http://www.liquidweb.com/kb/how-to-install-docker-on-ubuntu-14-04-lts/
* Ubuntu 14.04에서는 apt-get으로 곧바로 설치가 가능하므로 엄청나게 편합니다.
```
sudo apt-get update
sudo apt-get install docker.io
```
* 심볼릭 링크로 실행 명령어를 docker로 잡아주고 또 패스도 잡아줘야 한다고 합니다.
```
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
```
* 그리고 서버가 부팅될 때 도커가 자동으로 실행되도록 하고 싶다면 아래 명령을 쓰면 된다고 합니다. (원할때만)
```
sudo update-rc.d docker.io defaults
```

## 설치 방법 2 (조금 복잡하지만 정석대로 가기)
* 참고 : http://docs.docker.com/engine/installation/ubuntulinux/
* 아마 이쪽이 더 최신버전을 한템포 더 빨리 반영하기가 좋은 것 같습니다. (도커에서 직접 제공하는 저장소에서 설치하기 때문)
* 우선 아래 명령으로 apt 저장소 소스를 새로 등록해 줍니다.
```
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
```
해서 GPG인증키를 주고,
```
sudo leafpad /etc/apt/sources.list.d/docker.list
```
해서 편집기에서 다음 내용을 직접 써넣어 줍니다.
```
deb https://apt.dockerproject.org/repo ubuntu-trusty main
```
그리고 업데이트 한 번 해 주고
```
sudo apt-get update
```
혹시 기존에 먼저 깔려 있는게 있다면 청소해 주고
```
sudo apt-get purge lxc-docker
```
이제 어떤 버전들이 제공되는지 확인해 봅니다.
```
sudo apt-cache policy docker-engine
```
* 그리고 `linux-image-extra` 패키지를 설치해야 한다고 합니다.
```
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r)
```
* 이제 도커에 필요한 환경은 만들었으므로 설치를 합니다.
```
sudo apt-get update
sudo apt-get install docker-engine
```
* 설치가 끝났으면 도커 데몬을 시작하고, 기본적으로 들어있는 'Hello-world' 이미지를 시작해서 잘 동작하는지 최초 확인을 합니다.
```
sudo service docker start
sudo docker run hello-world
```
* 도커 유저그룹에 사용자 아이디를 가입시킵니다.  도커는 슈퍼유저 권한을 항상 사용해야 하므로, docker라는 유저그룹에 슈퍼유저 권한을 주고 필요한 사용자를 여기에 집어넣어 쓴다는 개념인 듯 합니다.
```
sudo usermod -aG docker 아이디
```
이후에 로그아웃 했다가 다시 로그인 하면 docker 유저그룹으로서 적용이 됩니다.
* 그리고 이제 `sudo` 명령을 생략하고 명령을 때려서 확인해 봅니다.
```
docker run hello-world
```

## 이미지 땡겨오기
<<<<<<< HEAD
=======



>>>>>>> 1cc181293fd9a5b7ecd794c8d7700671c95b0131
