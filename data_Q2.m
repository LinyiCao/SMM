clc,clear
close('all')

global n_ob

t = 40 : 2 : 50;

psi = 2.7;
lambda = -0.05;
% psi = 1.1;
% lambda = -0.02;

f_t = psi + lambda*t;

x_t = f_t.*n_ob
% x_t = 1 - (1-x_t).^4

