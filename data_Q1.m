clc,clear
close('all')

miu   = 100;
beta  = -1;
sigma = 5;
phi   = 80;
gamma = -0.6;

% N = 1e4;
N = 1e5;

t = 40 : 2 : 50;
T = length(t);
randn('seed', N);

r  = phi + gamma * t;

for j1 = 1 : T
    epsilon = randn(N,1);
    w = miu + beta * t(j1) + epsilon * sigma;
    w_t_ob = [];
    index = w >= r(j1);
    w_t_ob = w(index);
    meanwob(j1) = mean(w_t_ob);
    stdwob(j1) = std(w_t_ob);
end

meanwob

stdwob