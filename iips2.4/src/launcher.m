%%%% iips2.m %%%%
n = 1e6;
dim = 2;
Z = randn(n, dim); % Generate Random Gaussian.
%% (c)
sigma = 1;
rho = -0.8;
K = getK(sigma, rho);
V = getV(K);
Y = X * V;  %(V' * x')'
figure;
plot_hist_contour(Y, 'y');
