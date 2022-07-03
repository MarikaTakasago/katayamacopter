%load 'param.mat'
t = (0:ts:end_time); %time (start:delta:end)

x3_delta = x3_target_angle / (length(t)-1); %calc x3_delta
x3 = (0:x3_delta:x3_target_angle); %x3 (start:delta:end)

x5_delta = x5_target_angle / (length(t)-1); %calc x5_delta
x5 = (0:x5_delta:x5_target_angle); %x5 (start:delta:end)

%make ref
x3_ref = zeros(length(t),2); % 2rows:[t,x]
x3_ref(:,1) = t; %input
x3_ref(:,2) = x3;

x5_ref = zeros(length(t),2);
x5_ref(:,1) = t;
x5_ref(:,2) = x5;

%option:if want to show trajectory
%figure;
%plot(t,x3,'g',t,x5,'b');