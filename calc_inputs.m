% sum/diff to forword/back
% u_sum = u_f + u_b
% u_diff = u_f - u_b
% ∴
% u_f = (u_sum + u_diff) / 2
% u_b = (u_sum - u_diff) / 2

u_f = (u_sum + u_diff) / 2;
u_b = (u_sum - u_diff) / 2;

%%
%u to duty
% 数値は片山の卒論fig4.3
duty_f = (u_f - 3.3235) / 0.6386;
duty_b = (u_b - 3.7394) / 0.7158;