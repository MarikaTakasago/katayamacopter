%% make state-space-model
sys_elev = ss(A_elev,B_elev,C_elev,D_elev);
sys_travel = ss(A_travel,B_travel,C_travel,D_travel);
sys_pitch = ss(A_pitch,B_pitch,C_pitch,D_pitch);

%% make plant
plant_elev = c2d(sys_elev,ts);
plant_travel = c2d(sys_travel,ts);
plant_pitch = c2d(sys_pitch,ts);

%% add md (only elevation and travel)
syselevetion = rss(2,2,3);
syselevetion.D = [0 0 0;0 0 0];
syselevetion.A = A_elev;
syselevetion.B = [B_elev X1_elev];
syselevetion.C = [1 0;0 1];

systrav = rss(2,2,3);
systrav.D = [0 0 0;0 0 0];
systrav.A = A_travel;
systrav.B = [B_travel X1_travel];
systrav.C = C_travel;

setp_elev = setmpcsignals(syselevetion,'MV',[1 2],'MD',3);
setp_travel = setmpcsignals(systrav,'MV',[1,2],'MD',3);

%%% make mpcobject %%%
%% elevation
mpcelev = mpc(setp_elev,ts_elev);
% horizons
mpcelev.PredictionHorizon = 15;
mpcelev.ControlHorizon = 5;
% nominals
mpcelev.Model.Nominal.U = [0;0;0];
mpcelev.Model.Nominal.Y = [elev_min;0];
% limits
% u_sum limits
mpcelev.MV(1).Min = u_sum_min;
mpcelev.MV(1).Max = u_sum_max;
% u_diff limits
mpcelev.MV(2).Min = u_diff_min;
mpcelev.MV(2).Max = u_diff_max;
% elevation limits
mpcelev.OV(1).Min = elev_min;
mpcelev.OV(1).Max = elev_max;

%% travel
mpctravel = mpc(setp_travel,ts_travel);
% horizons
mpctravel.PredictionHorizon = 80;
mpctravel.ControlHorizon = 4;
% nominals
mpctravel.Model.Nominal.U = [0;0;0];
mpctravel.Model.Nominal.Y = [0;0];
% limits
% pitch limits
mpctravel.MV(1).Min = pitch_min;
mpctravel.MV(1).Max = pitch_max;

%% pitch
mpcpitch = mpc(plant_pitch,ts_travel); % samppling rate : same as travel
% horizons
mpcpitch.PredictionHorizon = 80;
mpcpitch.ControlHorizon = 4;
% nominals
mpcpitch.Model.Nominal.U = [0;0;0];
mpcpitch.Model.Nominal.Y = [0;0];
% limits
% u_sum limits
mpcpitch.MV(1).Min = u_sum_min;
mpcpitch.MV(1).Max = u_sum_max;
% u_diff limits
mpcpitch.MV(2).Min = u_diff_min;
mpcpitch.MV(2).Max = u_diff_max;
% pitch limits
mpcpitch.OV(1).Min = pitch_min;
mpcpitch.OV(1).Max = pitch_max;
