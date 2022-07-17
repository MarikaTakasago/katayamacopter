%% サンプル時間を使用して MPC コントローラー オブジェクトを作成
mpcpitch = mpc(mpcpitch_plant_C, 0.1);
%% 予測ホライズンを指定
mpcpitch.PredictionHorizon = 10;
%% 制御ホライズンを指定
mpcpitch.ControlHorizon = 2;
%% 入力と出力のノミナル値を指定
mpcpitch.Model.Nominal.U = [0;0];
mpcpitch.Model.Nominal.Y = [0;0];
%% MV および MV レートの制約を指定
mpcpitch.MV(1).Min = 0.5;
mpcpitch.MV(1).Max = 3.9;
mpcpitch.MV(2).Min = -0.5;
mpcpitch.MV(2).Max = 1.5;
%% OV の制約を指定
mpcpitch.OV(1).Min = -0.785398163397448;
mpcpitch.OV(1).Max = 0.785398163397448;
%% 重みを指定
mpcpitch.Weights.MV = [0 0];
mpcpitch.Weights.MVRate = [0.1 0.1];
mpcpitch.Weights.OV = [1 1];
mpcpitch.Weights.ECR = 100000;
%% シミュレーション オプションを指定
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% シミュレーションを実行
sim(mpcpitch, 101, mpcpitch_RefSignal, mpcpitch_MDSignal, options);
