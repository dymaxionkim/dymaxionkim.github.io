# Jingo Wiki
* 소형 서버에서 Wiki를 돌릴려면, 우선 매우 가벼우면서 백업 및 복원이 간편해야 한다.
* 아울러 필수적인 기능들에서도 부족함이 없는 것이 좋겠다.
* MDwiki는 가볍고 포터블해서 좋긴 한데, 기능 부족 때문에 도큐먼트 작성 및 등록이 상당히 불편하다.  자체 편집기도 없고, 신규 도큐먼트를 만들면 Navigation.md 파일을 직접 편집해서 등록해 줘야 하기 때문이다.
* Jingo는 이런 부족한 기능들이 다 구비되어 있고, 마크다운 문법 기반이며, 한글을 쓸 때도 문제가 없고, 데이타베이스 대신 Git으로 버전관리를 한다.
* 단 하나의 단점은, NodeJS 서버에서 돌아간다는 점 뿐이다.  그러나 이것 역시 자신의 NAS 서버를 가지고 있다면 문제가 되지 않을 것이다.

## Jingo 설치 전 환경 구축

### Apache2와 NodeJS를 동시에 돌려야 한다.
* Jingo는 NodeJS로 돌아가는 녀석이므로, 기존의 Apache2로 돌리는 OwnCloud와 함께 하나의 서버에서 돌려주기 위해서 교통정리가 필요하다.
* 참고 : http://mocona.tistory.com/182
* 이 방법은, 아파치서버에서 특정 포트로 접근이 들어오면 프록시로 취급해서 딴데 돌려버리는 것이다.
* 먼저 Apache2의 proxy 및 proxy_http 모듈을 활성화 시킨다.
```
sudo a2enmod proxy 
sudo a2enmod proxy_http
```
* 이제 웹사이트 활성화 설정을 다음과 같이 수정한다.
```
sudo nano /etc/apache2/sites-available/000-default.conf
```
해서 설정파일로 들어간 후, 다음 내용을 추가해 준다.
```
<VirtualHost *:3000>
        ProxyRequests off
        <Proxy *>
            Order deny,allow
            Allow from all
        </Proxy>
        <Location />
            ProxyPass http://localhost:3000/
            ProxyPassReverse http://localhost:3000/
        </Location>
</VirtualHost>
```
* 그리고 아파치를 재시작.
```
service apache2 restart
```

### NodeJS 설치
```
sudo apt-get install nodejs nodejs-legacy npm
```

### Jingo 설치
* 참고 : https://github.com/claudioc/jingo
```
sudo npm install -g jingo
```

### Git 설치
* Ubuntu Server에서는 Git 자체는 이미 설치되어 있다.
* 콘텐츠를 담을 저장소만 구성해 본다.
```
mkdir /home/dong/github
mkdir /home/dong/github/jingo
cd /home/dong/github/jingo
git init
git config --global user.name "dong"
git config --global user.email "dymaxion.kim@gmail.com"
```

### Jingo 기본형 설정파일 만들기
```
jingo -s > config.yaml
```

### Jingo 로그인 비밀번호 해쉬코드 만들기
```
jingo -# 비밀번호
```
위의 명령을 치면 해쉬코드가 나온다. 그걸 긁어서 복사해 둔다.

### config.yaml 편집하기
* 편집기로 config.yaml을 열어서 다음의 내용을 손 봐준다.
```
Configuration sample file for Jingo (YAML)
application:
  title: Jingo
  repository: '/home/dong/jingo'      <--- Git 저장소로 설정한 디렉토리 절대경로
  docSubdir: ''
  remote: ''
  pushInterval: 30
  secret: change me
  git: git
  skipGitCheck: false
  loggingMode: 1
  pedanticMarkdown: true
  gfmBreaks: true
  staticWhitelist: "/\\.png$/i, /\\.jpg$/i, /\\.gif$/i"
authentication:
  google:
    enabled: false                 <--- Google 로그인은 일단 비활성화 해 두자.
    clientId: replace me with the real value
    clientSecret: replace me with the real value
  github:
    enabled: false                 <--- Github 로그인도 일단 비활성화 해 두자.
    clientId: replace me with the real value
    clientSecret: replace me with the real value
  local:
    enabled: true                 <--- 로컬 로그인만 활성화 해 두자.
    accounts:
      - username: 'dong'                 <--- 아이디
        passwordHash: '해쉬코드'         <--- 아까 만들어서 복사해 둔 해쉬코드를 넣어준다.
        email: 'dymaxion.kim@gmail.com'    <--- 이메일
features:
  markitup: false
  codemirror: true
server:
  hostname: localhost
  port: 3000    <--- 앞서 프록시 설정해 둔 포트넘버로 변경할 것
  localOnly: false
  baseUrl: ''
authorization:
  anonRead: true
  validMatches: .+
pages:
  index: Home
  title:
    fromFilename: true
    fromContent: false
    asciiOnly: false
    lowercase: false
  itemsPerPage: 10
customizations:
  sidebar: _sidebar.md
  footer: _footer.md
  style: _style.css
  script: _script.js
```

### Jingo 첫 실행
* 실행 명령어는 다음과 같다.
```
jingo -c /home/dong/github/jingo/config.yaml &
```
* 이제 외부 웹브라우저의 주소창에 다음 주소를 넣고 확인해 본다.
```
http://dymaxionkim.mooo.com:3000
```

### 부팅시 자동 실행되도록 셋팅
* 쉘 스크립트를 편집해서 만든다.
```
/home/dong/Jingo_Wiki.sh
```
한 다음 다음 내용을 써 넣는다.
```
#!/bin/bash
jingo -c /home/dong/github/jingo/config.yaml &
```
* 만든 쉘 스크립트를 실행 가능하도록 속성을 준다.
```
chmod +x /home/dong/Jingo_Wiki.sh
```
* 다음과 같이 rc.local 파일을 열어서 편집한다.
```
sudo nano /etc/rc.local
```
내용은 다음과 같이.
```
sudo -u dong /home/dong/Jingo_Wiki.sh
```
