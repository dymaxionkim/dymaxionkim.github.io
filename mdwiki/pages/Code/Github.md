# Github

## Git ?
* 이게 뭔지 모른다면 인터넷 검색해서 조사해 보시면 됩니다.

## 




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



