clc,clear
global n_ob

% param1 = [98, -0.98, 4.5, 78, -0.56];
% param1 = [90, -0.9, 4, 88, -0.66];
param1 = [90, -0.64, 4, 88, -0.66];
smm_estimation1 = fminsearch('fun1',param1)
smm_estimation2 = fminsearch('fun2', param1)
% smm_estimation3 = fminsearch('fun3', param1(1:3))

fval1 = fun1(smm_estimation1);
fval2 = fun2(smm_estimation2);
% fval3 = fun3(smm_estimation3)

n_ob;

% param2 = [2.8,-0.055];
% % param2 = [1,-0.018];
% smm_estimation4 = fminsearch('gfunction',param2)
% gval4 = gfunction(smm_estimation4)