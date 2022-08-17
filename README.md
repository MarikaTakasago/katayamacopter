# katayamacopter

もしかしたらプロジェクトを開くのと同時に.slxと.matも一緒に開くかもしれません

↑はclone時に各自で設定可能。以下のように設定すると便利だと思います。

プロジェクト開始時：`katacop_main.m`

プロジェクト終了時：`close_katacop.m`

## Description

`katacop_main.m` : 変数とsimulinkの読み込み。シミュレーションの実行までできる

`close_katacop.m` : simulinkの終了とワークスペースのお掃除

`param.mat`の中の`x3(5)_target_angle`を編集することで目標角を変更できます。

`cleaner.m` : debug用。万が一叩いてしまったら`close`→`main`の順に立ち上げ直し。いずれgitignoreに追記します。


## TODO

・制約の設定いちいちしなくていいようにする(めんどくさいから)

