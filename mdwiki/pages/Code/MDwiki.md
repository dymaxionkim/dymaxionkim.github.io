# MDwiki

## [이 사이트](http://dymaxionkim.github.io)를 구성한 방법
### GitHub에 가입




## Julia 웹서버 설치

* Julia로 할 수 있는 몇가지 작은 웹서버 및 프레임웤들이 있는 것 같은데, 그중에 제일 간단한 것으로 해 봅시다.  여기서는 HttpServer.jl ( https://github.com/JuliaWeb/HttpServer.jl )을 선택해 보았습니다.

* 설치하기 전에 우선 의존성 있는 C라이브러리의 빌드가 가능하게 하는 cmake 패키지를 먼저 설치합니다.  이것을 설치하지 않으면 HttpServer.jl의 설치 과정중에 MbedTLS라는 라이브러리를 빌드하다가 실패한다고 나옵니다. (참고 : https://github.com/JuliaWeb/MbedTLS.jl/issues/7 )
```
sudo apt-get install cmake
```

* 그리고 Julia를 실행하고, julia REPL 환경상에서 HttpServer 패키지를 설치합니다.
```
Pkg.add("HttpServer")
```

* 이제 작동하는지 여부를 확인하기 위해 테스트 해 봅니다. ( 참고 : https://github.com/JuliaWeb/HttpServer.jl/blob/master/docs/HttpServer.md )
```
cd /home/dong/.julia/v0.4/HttpServer
julia examples/hello.jl
```

* 웹브라우저 주소창에 `localhost:8000/hello/name`를 쳐 봅니다.  페이지가 뜨는지 확인.




## 초간단한 Python 웹서버 스크립트로 간단히 MDwiki를 직접 호스팅 해 보기

* Python으로 작성된 초간단한 웹서버 스크립트가 있길래 한 번 사용해 보았습니다. ( http://linuxspot.tistory.com/224 )

* 위 사이트에 소개된 소스코드를 편집기로 내용을 복사해 넣고, 'miniWebServer.py' 이름으로 해서 로컬 컴퓨터의 MDwiki 메인 디렉토리 (index.html 파일이 있는 곳)에 저장해 넣습니다.

* 그 다음에, 'miniWebServer.py' 파일의 권한을 '실행가능'으로 바꿔줍니다.  `chmod +x miniWebServer.py` 정도 명령이면 될 것 같습니다.

* 그리고 `./miniWebServer.py 8000`으로 명령을 주면 초미니 웹서버가 실행됩니다.

* 웹브라우저 주소창에서 'localhost:8000'을 쳐 보면 MDwiki가 뜰 것입니다.  외부의 다른 컴퓨터에서 접근하려면 이 서비스를 제공하는 현재 PC의 IP 주소와 포트번호 8000번을 이용하면 접속이 됩니다.  예를 들어 외부의 다른 컴퓨터 웹브라우저 주소창에 'http://123.45.67.89:8000' 이런 식으로 써주면 될 것입니다.

* 웹서버를 종료하고 싶으면,  `./miniWebServer.py 8000` 명령을 실행시켰던 터미널을 강제로 종료하거나 또는 'Ctrl+c'를 누르면 됩니다.
