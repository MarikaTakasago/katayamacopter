sys_elev = ss(A_elev,B_elev,C_elev,D_elev);
sys_travel = ss(A_travel,B_travel,C_travel,D_travel);
sys_pitch = ss(A_pitch,B_pitch,C_pitch,D_pitch);

plant_elev = c2d(sys_elev,ts);
plant_travel = c2d(sys_travel,ts);
plant_pitch = c2d(sys_pitch,ts);

mpcelev = mpc(plant_elev);
mpctravel = mpc(plant_travel);
mpcpitch = mpc(plant_pitch);