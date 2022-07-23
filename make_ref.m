%% load param
%load 'param.mat'

%% set t
%time (start:delta:end)
t_elev = (0:ts_elev:end_time);
t_travel = (0:ts_travel:end_time);

%% make ref

% elevation
x3_ref = zeros(length(t_elev),2); % 2rows:[t;x]
x3_ref(:,1) = t; %input
%x3_ref(:,2) = x3_target_angle;
x3_ref(1:10,2) = elev_min; %(x3(elevation)_min)

x4_ref = zeros(length(t_elev),2);
x4_ref(:,1) = t;
%x4_ref(:,2) = 0.2;

% travel
x5_ref = zeros(length(t_travel),2);
x5_ref(:,1) = t;
x5_ref(:,2) = x5_target_angle;
x5_ref(1:10,2) = 0;

x6_ref = zeros(length(t_travel),2);
x6_ref(:,1) = t;
one_sec = 1 / ts_travel;
x6_ref(1:one_sec,2) = 0.01;


% for pitchonly_mpc %
%x1_ref = zeros(length(t),2);
%x1_ref(:,1) = t;
%x1_ref(:,2) = pi/8;
%x2_ref = zeros(length(t),2);
%x2_ref(:,1) = t;
%x2_ref(1:10,2) = 0.01;
%%%%%%%%%%%%%%%%%%%%%

%% plot
%option:if want to show trajectory
%figure;
%plot(t,x3,'g',t,x5,'b');