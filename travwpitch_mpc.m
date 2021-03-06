%% サンプル時間を使用して MPC コントローラー オブジェクトを作成
mpctravel = mpc(mpctravel_plant_C_1, 0.1);
%% 予測ホライズンを指定
mpctravel.PredictionHorizon = 30;
%% 制御ホライズンを指定
mpctravel.ControlHorizon = 10;
%% 入力と出力のノミナル値を指定
mpctravel.Model.Nominal.U = [0;0;0];
mpctravel.Model.Nominal.Y = [0;0];
%% MV および MV レートの制約を指定
mpctravel.MV(1).Min = -0.785398163397448;
mpctravel.MV(1).Max = 0.785398163397448;
%% 重みに適用する全体の調整係数を指定
beta = 7.3891;
%% 重みを指定
mpctravel.Weights.MV = [0 0]*beta;
mpctravel.Weights.MVRate = [0.1 0.1]/beta;
mpctravel.Weights.OV = [1 1]*beta;
mpctravel.Weights.ECR = 100000;
%% 推定モデルのゲインに適用する全体の調整係数を指定
alpha = 10;
%% 既定の出力外乱モデルのゲインを調整
setoutdist(mpctravel, 'model', getoutdist(mpctravel)*alpha);
%% 既定の測定ノイズ モデルのゲインを調整
mpctravel.Model.Noise = mpctravel.Model.Noise/alpha;
%% シミュレーション オプションを指定
options = mpcsimopt();
options.RefLookAhead = 'off';
options.MDLookAhead = 'off';
options.Constraints = 'on';
options.OpenLoop = 'off';
%% シミュレーションを実行
sim(mpctravel, 501, mpctravel_RefSignal_1, mpctravel_MDSignal_1, options);
