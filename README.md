# pokemon_api

Flutterを用いたAPI通信の理解を深めるために、サンプルアプリを作成

## シミュレーター

![Simulator Screen Recording - iPhone 15 - 2024-09-03 at 06 11 16](https://github.com/user-attachments/assets/bf18c8be-f559-4787-bbc4-60359a99214c)

PokemonAPIを用いているアプリです。
特徴：
- 起動時に20件ポケモンの情報を取得しています。
- ポケモンはListViewで表示しています。
- 最後までスクロールを行うと、追加でポケモンの情報を取得するために、再度fetch処理が走ります。
- fetch処理中は、ListViewの最後のセルでローディングが表示されます。
- fetch処理が終了すると、ローディングが消え、新しく取得されたポケモンの情報がListViewに表示されます。

## 技術構成
- http：HTTP通信を行うために用いたライブラリ。
