# Github

## Git ?
* 이게 뭔지 모른다면 인터넷 검색해서 조사해 보시면 됩니다.
* 다만 기능이 너무 강력하기 때문에 모든 기능을 다 설명하려는 것들이 많다 보니, 오히려 이해가 잘 안되는 경우도 있는 듯 합니다.  어렵게 이해할 필요는 없는 것 같습니다.
* 간단히 말해 Git은 서버에 모든 문서,소스코드를 올려서 버전관리해 줍니다.  그리고 통째로 복사해서 다운로드 받아서 내가 마음대로 수정을 할 수 있게도 해 주고, 그걸 다시 서버로 보내서 업데이트할 수 있게 해 줍니다.  필요하다면 브랜치를 만들어서 파생 프로젝트로 진행할 수도 있고요.  또 필요하다면 따로 진행하던 브랜치를 메인 프로젝트와 합쳐주기도 합니다(Merge).  그리고 이런 일련의 모든 복잡한 일들을 강력한 내부 알고리즘(예를 들어 Diff)을 통해 자동화해 주고, 모든 변경내역과 히스토리는 자동으로 고스란히 보존되고 업데이트되어 갑니다.
* 보통 전통적으로 이런 것을 형상관리,CMMI 같은 식으로 개념적으로 불렀었는데, Git은 그중에서 소프트웨어 소스코드 관리에 특화된 것이며, 그 이전의 중앙집중식 형상관리 툴에서 진일보하여, 분산형(통째로 다운로드 받아다가 마음대로 뜯어고칠 수 있게 해 주는 식) 형상관리를 구현해 내었다는 점이 가장 큰 특징이라고 생각됩니다.  Git에 비견할 수 있는 또다른 오픈소스 유틸리티로는 '서브버전(SVN)'이 있는데, 보통 현업에서는 SVN을 회사 자체 소스코드 형상관리 툴로 많이들 쓰는 것 같습니다.  Git은 SVN보다 더 개방적인 공개소프트웨어 개발에서 주로 애용되는 것 같구요.

## Github 가입
* [MDwiki.md](MDwiki.md) 문서를 참조하면 됩니다.
* Git의 중앙저장소 역할을 할 수 있는 서버 역할을 Github에서 제공해 줍니다.
* 물론 필요에 따라 자신의 Git서버를 직접 만들어서 운용할 수도 있지만, 여기서는 Git서버의 직접 운용은 생략합니다.  대신 Github와 모든 것을 연계해서 사용하는 전략을 취합니다.

## Git 클라이언트 처음 사용해 보기
* Git 클라이언트는, [UbuntuBang](https://github.com/dymaxionkim/UbuntuBang)을 이용해서 리눅스를 설치했다면 자동으로 설치되어 있을 것입니다.  만일 다른 방법으로 구축된 리눅스를 가지고 있다면 일단 다음 명령으로 간단히 Git을 설치할 수 있습니다.
```
sudo apt-get install git
```
* git의 명령 체계는 대개 `git 기능명칭 옵션`과 같은 형식을 따릅니다.  예를 들면, 대충 아래와 같은 형태들입니다.  git 다음에 동사와 목적어가 오는 형태라고 볼 수 있죠.
```
git init ~/github
git clone https://github.com/dymaxionkim/dymaxionkim.github.io.git ~/github
git config --global user.email dymaxion.kim@gmail.com
git pull
git commit -m 'Add new contents'
git push -u origin master
```
* git의 이런 형태의 명령 체계는, 전형적인 유닉스 명령의 전통을 잘 따르고 있을 뿐만 아니라, 이후에 등장한 다른 성공한 오픈소스 소프트웨어들에게도 많은 영향을 주고 있는 것 같습니다.  예를 들면, 반가상화 솔루션으로 사실상 업계표준이 된 Docker의 경우를 보면 거의 git과 명령체계가 유사합니다.  go언어로 만든 구글드라이브 동기화 프로젝트인 Drive도 보니깐 git에서 강한 영향을 받아, 구글드라이브를 마치 Git서버 처럼 여기고 사용할 수 있도록 만들어 놨더군요.
* 



### 일단 닥치고 따라해 보는 Git

* _Git, GitHub 체계를 전혀 모르겠으면 일단 닥치고 아래 순서대로 따라해 보면 됩니다._
* _Branch 만드는 건 복잡하니까 여기서는 생략하고 그냥 Master 가지고 곧바로 업데이트 하는 형태입니다.  따라서 제대로 된 사용법은 추후 계속 연습이 필요함._
* _일단 오리지널 텍스트 명령어로 Git을 다루면서 체계를 익혀나가는 것이 좋겠음._

##### github 가입하고 repository 만들기
> 처음 만드는 repository는 "계정.github.io" 이름으로 만들 것. (메인 홈페이지 역할을 하도록 만들어주기 위해서)

##### git용 폴더만들기
```bash
mkdir GIT
cd ./GIT
```

##### git 셋업하기
```bash
git config --global user.name "계정"
git config --global user.email "이메일주소"
```

##### 로컬 git 저장소로 환경구성
```bash
git init
```

##### github에 만들어둔 repository 받아오기
```bash
git clone https://github.com/계정/계정.github.io.git
git clone https://github.com/계정/계정.github.io.wiki.git
cd ./계정.github.io
```

##### 로컬 쪽에서 수정작업후 GitHub에 올리기
```bash
git add --all
git commit -m '간단한 설명'
git push -u origin master
```


##### GitHub 쪽에서 수정작업후 로컬 쪽으로 업데이트 해 주기
```bash
git pull
```

### Git 설명서들
* [오리지널 설명서](https://pages.github.com/)
* [Git의 기초](http://wit.nts-corp.com/2015/03/26/3412)

### GitHub 설명서들
* [Jekyll,Git 을 몰라도 무료 Github Pages 즐기기 (Jekyll을 사용하는 블로그 제작하는 방법)](http://ilmol.com/2015/01/Jekyll,Git%20%EC%9D%84%20%EB%AA%B0%EB%9D%BC%EB%8F%84%20%EB%AC%B4%EB%A3%8C%20Github%20Pages%20%EC%A6%90%EA%B8%B0%EA%B8%B0.html)


### GitHub향 마크다운 한글 설명서
* <https://github.com/demun/demunCode/blob/master/Markdown/readme.md>
* <https://nolboo.github.io/blog/2014/03/25/github-flavored-markdown/>
* YouTube 연결하는 마크다운 형태
```
[![설명](그림URL)](동영상URL)
```
[![Transient Linear Elastic with Elmer 3](https://i.ytimg.com/vi/HGqn0NhYFFc/mqdefault.jpg)](https://youtu.be/HGqn0NhYFFc)
