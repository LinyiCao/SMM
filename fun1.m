function fval = fun1(param)
global n_ob

miu   = param(1);
beta  = param(2);
sigma  = param(3);
phi  = param(4);
gamma  = param(5);

N = 1e5;

w_avg_data = [61.8581   60.1917   58.6069   57.0363   55.4935   53.9961];
w_std_data = [3.7871    3.6092    3.4758    3.3297    3.1821    3.0086];

t = 40 : 2 : 50;
r  = phi + gamma * t;
T = length(t);

K = 10;
randn('seed', N);

w_avg_k_ob = zeros(K, T);
w_std_k_ob = zeros(K, T);
N_k_ob = zeros(K, T);

for j1 = 1 : K
    
    ep_lib = randn(N,T);
    
    for j2 = 1 : T
        epsilon = ep_lib(:,j2);
        w = miu + beta * t(j2) + epsilon * sigma;
        w_j2_ob = [];
        index = w >= r(j2);
        w_j2_ob = w(index);
        N_k_ob(j1,j2) = length(w_j2_ob);
        w_avg_k_ob(j1,j2) = mean(w_j2_ob);
        w_std_k_ob(j1,j2) = std(w_j2_ob);
    end
    
end

w_avg_ob = mean(w_avg_k_ob,1);
w_std_ob = mean(w_std_k_ob,1);
n_ob = mean(N_k_ob,1)/N;
    
% err = [log(w_avg_ob)-log(w_avg_data), log(w_std_ob)-log(w_std_data)];
err = [(w_avg_ob-w_avg_data)./w_avg_data, (w_std_ob-w_std_data)/w_std_data];

fval = err * err';
