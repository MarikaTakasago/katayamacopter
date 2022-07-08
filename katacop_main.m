clc        %コマンドウィンドウの掃除
clearvars  %loadした変数をなかったことに
close all  %とりあえず全部閉じる

%%

%諸々load
load 'param.mat'

%%

%諸々作成
make_ref
make_mpcobject

%%

%open simulink
open_system('katayamacopter.slx')

%%
%シミュレーションまで実行する時
%まだ先のお話( ﾉД`)ｼｸｼｸ…
sim('katayamacopter.slx')