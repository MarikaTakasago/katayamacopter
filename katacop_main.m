clc        %コマンドウィンドウの掃除
clearvars  %loadした変数をなかったことに
close all  %とりあえず全部閉じる

%%

%諸々load
load 'param.mat'
load 'models.mat'
make_ref
make_mpcobject

%simulink
sim('katayamacopter.slx') 
