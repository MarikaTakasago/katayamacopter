# katayamacopter

もしかしたらプロジェクトを開くのと同時に.slxと.matも一緒に開くかもしれません

↑はclone時に各自で設定可能。以下のように設定すると便利だと思います。

プロジェクト開始時：`katacop_main.m`

プロジェクト終了時：`close_katacop.m`

## Description

`katacop_main.m` : 変数とsimulinkの読み込み。最終的にはコメントアウト外せばシミュレーションの実行までできる

`close_katacop.m` : simulinkの終了とワークスペースのお掃除

## TODO

・x3とx5のrefって結局何？
・制約の設定いちいちしなくていいようにする(めんどくさいから)

