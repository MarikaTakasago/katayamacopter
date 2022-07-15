%load 'param.mat'
t = (0:ts:end_time); %time (start:delta:end)

x3_delta = x3_target_angle / (length(t)-1); %calc x3_delta
x3 = (0:x3_delta:x3_target_angle); %x3 (start:delta:end)

x5_delta = x5_target_angle / (length(t)-1); %calc x5_delta
x5 = (0:x5_delta:x5_target_angle); %x5 (start:delta:end)

%make ref
x3_ref = zeros(length(t),2); % 2rows:[t;x]
x3_ref(:,1) = t; %input
%x3_ref(:,2) = x3;

x4_ref = zeros(length(t),2);
x4_ref(:,1) = t;
x4_ref(:,2) = 0.02;

x5_ref = zeros(length(t),2);
x5_ref(:,1) = t;
%x5_ref(:,2) = x5;
x6_ref = zeros(length(t),2);
x6_ref(:,1) = t;

x1_ref = zeros(length(t),2);
x1_ref(:,1) = t;
x1_ref(:,2) = pi/8;
x2_ref = zeros(length(t),2);
x2_ref(:,1) = t;
x2_ref(1:10,2) = 0.01;

%option:if want to show trajectory
%figure;
%plot(t,x3,'g',t,x5,'b');