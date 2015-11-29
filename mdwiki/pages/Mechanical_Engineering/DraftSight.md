# DraftSight

## 소개
* 닷소 사에서 개발 제공하는 2D CAD 입니다.
* AutoCAD 대체 가능합니다. (.dwg 파일 읽고 쓰기가 잘 되고, 사용법도 거의 동일)
* Ubuntu14.04 버전에서 DaftSight를 설치하면 응답이 굉장히 느린 버그가 있습니다.  때문에 버전이 올라가서 해결될 때 까지 정상적으로 사용하기는 힘든 듯 합니다.

## 설치
* http://www.3ds.com/ko/products-services/draftsight-cad-software/free-download/ 이곳에서 적합한 버전을 직접 다운로드 받습니다.
* 이후, 다음 명령으로 설치합니다.  i386 관련 라이브러리에 의존하기 때문에 먼저 깔아줘야 설치에 성공할 수 있습니다.
```
sudo dpkg -i ./draftSight.deb
sudo ln -s /opt/dassault-systemes/DraftSight/Linux/DraftSight /usr/bin/DraftSight
```
* 설치 시작시에 라이센스 동의 창이 하나 뜨는데, 한글 코드가 다 깨져서 나오는데 그냥 무시하고 넘어가면 됩니다.

* 설치 후에 실행에는 실패했습니다.  DraftSight 2015 버전부터 QT5를 적용했고, 64bit 컴파일본이라고 해서 appmenu-qt5 libdbusmenu-qt5 라이브러리를 추측해서 적용해 봤는데도 안되는 걸 보니 다른 이유가 있는 것 같습니다.  에러 메시지는 이렇게 나옵니다.

> 모듈을 로드하지 못했습니다. 응용 프로그램이 닫힙니다. 응용 프로그램을 다시 설치하십시오.

* 원인을 아직 규명하지 못했으므로, 해결은 일단 보류합니다.
