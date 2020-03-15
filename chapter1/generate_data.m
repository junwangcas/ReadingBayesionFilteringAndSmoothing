function [outputArg1,outputArg2] = generate_data(app)
%GENERATE_DATA 此处显示有关此函数的摘要
%   此处显示详细说明
% ground truth
a = 0.1; % 0.1m/s^2
t_s = 0;
t_end = 10;
t_interval = 0.1;
sigma = 0.1;

X_prev = [0;0];
X_gt = X_prev;
for t = t_s:t_interval:t_end
    v_prev = X_prev(2);
    X_cur = X_prev + [v_prev*t_interval+0.5*a*t_interval^2;a*t_interval];
    X_gt = cat(2, X_gt, X_cur);
    X_prev = X_cur;
end

X_m = [];
% generate measurements
for i = 1:length(X_gt(1,:))
    x = X_gt(1,i);
    noise = rand(1)*sigma;
    x_m = x + noise;
    X_m = cat(2, X_m, x_m);
end

plot(app.UIAxes, X_gt(1,:))
plot(app.UIAxes2, X_gt(2,:))
plot(app.UIAxes3, X_m);
end

