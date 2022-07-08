# katayamacopter

もしかしたらプロジェクトを開くのと同時に.slxと.matも一緒に開くかもしれません

↑はclone時に各自で設定可能。以下のように設定すると便利だと思います。

プロジェクト開始時：`katacop_main.m`

プロジェクト終了時：`close_katacop.m`

## Description

`katacop_main.m` : 変数とsimulinkの読み込み。シミュレーションの実行までできる(けどScopeはなぜか立ち上がらないので自分で開けてください)

`close_katacop.m` : simulinkの終了とワークスペースのお掃除

`cleaner.m` : debug用。万が一叩いてしまったら`close`→`main`の順に立ち上げ直し

## TODO

・制約の設定いちいちしなくていいようにする(めんどくさいから)

・To WorkSpace関数の作成

