# fastapi_starter

Python製マイクロフレームワーク「[FAST API](https://fastapi.tiangolo.com/)」を使用するためのDocker環境


パッケージのバージョン管理は[Poetry](https://python-poetry.org/)を使用


Fast APIのビルドインサーバとして[Uvicorn](Uvicorn)を使用



はじめる

```
$ docker-compose build
```
→ localhost:4000



パッケージの追加
```
$ poetry add xxxx
```
開発時のみ使用するパッケージの場合
```
$ poetry add -D xxxx
```
