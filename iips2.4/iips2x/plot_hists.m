function plot_hists( X, sigma2, legend_str, x_str, y_str)
%PLOT_C_HIST Summary of this function goes here
%   Detailed explanation goes here
    n = length(X);
    nbins = 40; % bins in your histogram
    [cnt, x_hist] = hist(X, nbins); % not to plot, only to get emperical distribution.
    cnt = cnt / n / (x_hist(2) - x_hist(1)); % normalization, be careful :)
    bar(x_hist, cnt); % plot the hist using bar()
    hold on;
    sigma = sqrt(sigma2);
    x0 = -4 * sigma : 0.1 : 4 * sigma;
    plot(x0, normpdf(x0, 0, sigma), 'r', 'linewidth', 2);
    legend(legend_str, 'Interpreter', 'LaTeX', 'fontsize', 15);
    xlabel(x_str, 'Interpreter', 'LaTeX', 'fontsize', 15); % You may change the size accordingly
    ylabel(y_str, 'Interpreter', 'LaTeX', 'fontsize', 15);
end

