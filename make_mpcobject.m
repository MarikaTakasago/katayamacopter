sys_elev = ss(A_elev,B_elev,C_elev,D_elev);
sys_travel = ss(A_travel,B_travel,C_travel,D_travel);
sys_pitch = ss(A_pitch,B_pitch,C_pitch,D_pitch);

plant_elev = c2d(sys_elev,ts);
plant_travel = c2d(sys_travel,ts);
plant_pitch = c2d(sys_pitch,ts);

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
%setp_elev = setmpcsignals(plant_elev,'MV',[1 2],'MD',3);
setp_travel = setmpcsignals(systrav,'MV',[1,2],'MD',3);
%setp_travel = setmpcsignals(plant_travel,'MV',2,'MD',1);
%setp_pitch = setmpcsignals(plant_pitch,'MV',1);

%mpcelev = mpc(plant_elev);
mpcelev = mpc(setp_elev,ts);
%mpctravel = mpc(plant_travel);
mpctravel = mpc(setp_travel,ts);
mpcpitch = mpc(plant_pitch);
%mpcpitch = mpc(setp_pitch,ts);