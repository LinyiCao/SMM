function fval = fun3(param)

miu   = param(1);
beta  = param(2);
sigma  = param(3);

N = 1e5;

w_avg_data = [61.8581   60.1917   58.6069   57.0363   55.4935   53.9961];
w_std_data = [3.7871    3.6092    3.4758    3.3297    3.1821    3.0086];

t = 40 : 2 : 50;
T = length(t);

K = 10;
randn('seed', N);

w_avg_k_ob = zeros(K, T);
w_std_k_ob = zeros(K, T);

for j1 = 1 : K
    
    ep_lib = randn(N,T);
    
    for j2 = 1 : T
        epsilon = ep_lib(:,j2);
        w = miu + beta * t(j2) + epsilon * sigma;
        N_ob = 0;
        w_j2_ob = [];
        w_j2_ob = w;
        N_ob = length(w_j2_ob);
        w_avg_k_ob(j1,j2) = mean(w_j2_ob);
        w_std_k_ob(j1,j2) = std(w_j2_ob);
    end
    
    w_avg_ob = mean(w_avg_k_ob,1);
    w_std_ob = mean(w_std_k_ob,1);
    
end

err = [(w_avg_ob-w_avg_data)./w_avg_data, (w_std_ob-w_std_data)/w_std_data];

fval = err * err';
