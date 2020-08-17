# fastapi_starter

Python製マイクロフレームワーク「[FAST API](https://fastapi.tiangolo.com/)」を使用するためのDocker環境


パッケージのバージョン管理は[Poetry](https://python-poetry.org/)を使用


Fast APIのビルドインサーバとして[Uvicorn](Uvicorn)を使用

### 動作環境
Python `^3.8`
Poetry  `1.0.10`  

### 使用方法

・引数にアプリ名をつけて `source` または `.` コマンドを実行してください。
```
$ . ./init your_api_name
```

・サーバーの起動
```
$ docker-compose up -d

```
→ http://localhost:4000

<br>


・パッケージの追加
```
$ poetry add xxxx
```
開発時のみ使用するパッケージの場合 `-D` オプションをつける
```
$ poetry add -D xxxx
```


パッケージ追加後はイメージを再ビルドする  
```
$ docker-compose up -d --build
```
