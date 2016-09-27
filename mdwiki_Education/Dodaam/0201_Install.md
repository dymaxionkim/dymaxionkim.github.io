# 0201 : 윈도우 PC에 해석 소프트웨어 설치

* 본 소프트웨어들은 근본적으로 리눅스 환경에서 가장 잘 동작한다.
* 리눅스 사용이
어려울 경우 부득이하게 윈도우 상에 설치하여 사용가능하다.
* 다만 지속적인 자동 업데이트나 안정성, 제대로 된 모든 기능을 다 사용하는 것이
어려운 단점이 있다.

## Netgen 설치


* 예전에는 그냥 설치만 하면 됐는데, 이번에 설치해서 실행하는데 문제가 생겼다.
* 새로운 기능을 추가하거나,
윈도우에서 제공하는 VC++ 라이브러리 문제다.

### 설치본 다운로드

* https://sourceforge.net/projects/netgen-mesher/

### 설치할 때 옵션

* Netgen만 설치하고, NGsolve는 설치하지 않는다.
* NGsolve까지 설치하려면 Python 개발환경을
따로 설치하고 연계해 줘야 하는 등 상당히 번거로와진다.

### VC++ 라이브러리 문제 해결
* msvcp140.dll, vcruntime140.dll, msvcp120.dll 파일이 없다고 나온다.
이걸 위해 다음 것들을 다 받아다가 깔아준다.
* 참고 : http://devbible.tistory.com/432
* "VC++ 14.0
(2015) 재배포 패키지" 설치

https://www.microsoft.com/ko-
kr/download/details.aspx?id=48145

* "VC++ 12.0 (2013) 재배포 패키지" 설치
https://www.microsoft.com/ko-KR/download/details.aspx?id=40784

### Python 모듈 설치하기

* python35.dll 파일이 없다고 나온다.  Python 3.5를 통째로 까는 것 보다는 이것만
찾아다가 넣어주자.

* "python35.dll 3.5.0b3" 다운로드
http://api.256file.com/python35.dll/en-download-17213.html

* 다운로드 받은 파일을 Netgen
실행파일이 있는 디렉토리에 복사해 넣음 (예 : `C:\Program Files\netgen\bin`)

## Elmer 설치

### 설치본 다운로드

* https://sourceforge.net/projects/elmerfem/

### 설치할 때 유의사항

* 중간에 나오는 메시지들을 전부 OK해서 모두 다 깔아준다.

### 버그

* 내장된 ElmerVTK가 현재 제대로 작동하지 않는 것 같다.
* 대신 Paraview로 처리하자.

## ParaView 설치

### 설치본 다운로드

* http://www.paraview.org/download/

## Gmsh 설치

### 설치본 다운로드

* http://gmsh.info/

### 설치할 때 유의사항

* Gmsh는 별도의 설치가 불필요한 Portable 패키지로 제공된다.
* 따라서 다운로드 받은 파일을 적절한
위치에 압축해제 하고, 안에 있는 실행파일을 실행시키면 된다.

## FreeCAD 설치

### 설치본 다운로드

* http://www.freecadweb.org/wiki/?title=Download

# 끝!
