function gval = gfunction(param)
global n_ob

psi = param(1);
lambda = param (2);

f_data = [0.61	0.50	0.39	0.29	0.20	0.12];
% f_data = [0.70	0.62	0.53	0.43	0.32	0.22];

rand('seed',1e5);

t = 40 : 2 : 50;
T = length(t);

N = 1e5;
% N = 1e4;
% N = 1e6;

K = 10;
x_k_t = zeros(K,T);

for j1 = 1 : K    
    rand_number_lib = rand(N,T);
    
    for j2 = 1 : T
        rand_number = rand_number_lib(:,j2);
        p_t = (psi + lambda * t(j2)) * n_ob(j2);
%         p_t = 1-(1-p_t)^4;
        index = rand_number <= p_t;
        x_k_t(j1,j2) = sum(index) / N;        
    end 
    
end

x_t = mean(x_k_t,1);

err = [(x_t-f_data)./f_data];

gval = err * err';