# ariadne_starter

Python製GraphQLライブラリ[Ariadne](https://ariadnegraphql.org/)を使用するためのDocker環境

パッケージのバージョン管理は[Poetry](https://python-poetry.org/)を使用

ビルドインサーバとして[Uvicorn](https://www.uvicorn.org/)を使用


### 動作環境
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

<br>


### Vercelへのデプロイ

`poetry.lock`のパッケージファイルを`requirements.txt` に出力する。

```
$ rm -f requirements.txt && poetry export -f requirements.txt > requirements.txt
```

リポジトリをVercelにインテグレートすればデプロイできる。



<br>

### Google Container Registry へのデプロイ

コンテナイメージを名前付けしてビルド

```
$ docker build -t your_tag_name .
```

コンテナイメージに対し、 GCPのproject id に紐づいたタグをつける
```
$ docker tag your_tag_name gcr.io/<PROJECT_ID>/your_tag_name
```

Google Container Registry に push する  

```
$ docker push gcr.io/<PROJECT_ID>/your_tag_name
```


補)ビルドからプッシュまで一気にやるには

```
$ gcloud builds submit --tag gcr.io/<PROJECT_ID>/your_tag_name --project <PROJECT_ID>
```


### TODO
- git pushで自動デプロイするCI/CD環境の構築
