%%%% iips2.m %%%%
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
tolerance=1e-2;
given_binWidth=0.1;
index=find(abs(X(:,2))<tolerance);
x_1_conditioned_on_x_2_eq_zero=X(index,1);
figure;
histogram(x_1_conditioned_on_x_2_eq_zero,'Normalization','probability','BinWidth',given_binWidth);
hold on;
x_1_conditioned_on_x_2_eq_zero_sigma=sigma*sqrt(1-rho^2);
x_1_conditioned_on_x_2_eq_zero_x_value=(-3*x_1_conditioned_on_x_2_eq_zero_sigma):given_binWidth:(3*x_1_conditioned_on_x_2_eq_zero_sigma);
x_1_conditioned_on_x_2_eq_zero_y_value=given_binWidth*pdf('Normal',x_1_conditioned_on_x_2_eq_zero_x_value,0,x_1_conditioned_on_x_2_eq_zero_sigma);
plot(x_1_conditioned_on_x_2_eq_zero_x_value,x_1_conditioned_on_x_2_eq_zero_y_value);
% I should save eps figure here, and make reference to this figure in
% report, but I omit this step
%% (e) (Optional)
E_x_1_conditoned_on_x_2_samples=zeros([n,1]);
x_2_seq=(min(X(:,2))+tolerance):2*tolerance:(max(X(:,2))-tolerance);
cnt=1;
for i=1:length(x_2_seq)
index=find(abs(X(:,2)-x_2_seq(i))<tolerance);
if(index)
E_x_1_conditoned_on_x_2_sample_value=mean(X(index,1));
E_x_1_conditoned_on_x_2_samples(cnt:(cnt+length(index)))=E_x_1_conditoned_on_x_2_sample_value;
cnt=cnt+length(index);
end
end
figure;
histogram(E_x_1_conditoned_on_x_2_samples,'Normalization','probability','BinWidth',given_binWidth);
hold on;
E_x_1_conditoned_on_x_2_sigma=abs(rho);
E_x_1_conditoned_on_x_2_x_value=(-3*E_x_1_conditoned_on_x_2_sigma):given_binWidth:(3*E_x_1_conditoned_on_x_2_sigma);
E_x_1_conditoned_on_x_2_y_value=given_binWidth*pdf('Normal',E_x_1_conditoned_on_x_2_x_value,0,E_x_1_conditoned_on_x_2_sigma);
plot(E_x_1_conditoned_on_x_2_x_value,E_x_1_conditoned_on_x_2_y_value);
