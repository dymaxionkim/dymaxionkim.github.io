# Python

## 패키지 관리

* pip 패키지들을 모두 한꺼번에 업데이트 ( http://blog.kimtae.xyz/171 )
```
sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
```



