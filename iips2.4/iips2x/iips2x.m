n = 1e6;
dim = 2;
Z = randn(n, dim); % Generate Random Gaussian.
%% (a)
sigma = 1;
rho_vec = [0.3, 0.8, -0.8];
figure;
for i = 1 : 3
    subplot(1, 3, i);
    rho = rho_vec(i);
    K = getK(sigma, rho);
    C = getC(K);
    X = Z * C'; % (C * z')'
    plot_hist_contour(X, 'x');
    title(strcat('$\rho = ', num2str(rho_vec(i)), '$'), 'Interpreter', 'LaTeX', 'Fontsize', 15);
end
%% (b)
W = mvnrnd(zeros(2, 1), K, n);
Ezw = getExy(Z, W);
Ezx = getExy(Z, X);
disp([Ezw, Ezx]);
figure;
plot_hist_contour(W, 'w');
%% (c)
V = getV(K);
Y = X * V;  %(V' * x')'
figure;
plot_hist_contour(Y, 'y');
%% (d)    
dx = 0.1;
x1g2 = X(abs(X(:, 2)) < dx, 1); % x1|x2 = 0
legend_str = {'$\hat{p}_{\sf{x1|x2}}(x|0)$', '$p_{\sf{x1|x2}}(x|0)$'};
x_str = '$x$';
y_str = '$p_{\sf{x_1|x_2}}(x|0)$';
figure;
plot_hists(x1g2, sigma^2 * (1 - rho^2), legend_str, x_str, y_str); % "conditional" histogram
%% (e)
window_size = 100;
E1g2 = getE1g2(X, window_size);
legend_str = {'$\hat{p}_{\rm{E}[\sf{x_1|x_2}]}(x)$', '$p_{\rm{E}[\sf{x_1|x_2}]}(x)$'};
x_str = '$x$';
y_str = '$p_{\rm{E}[\sf{x_1|x_2}]}(x)$';
figure;
plot_hists(E1g2, sigma^2 * rho^2, legend_str, x_str, y_str);