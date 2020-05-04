function plot_hist_contour( X, str_x)
%PLOT_HIST_CONTOUR Summary of this function goes here
%   Detailed explanation goes here
    n = size(X, 1);
    nbins = [50, 50]; % bins of quantize
    [cnt, c] = hist3(X, nbins); % c is center
    dx = c{1}(2) - c{1}(1);
    dy = c{2}(2) - c{2}(1);
    %axis equal;
    contour(c{1}, c{2}, cnt/n/dx/dy, 'linewidth', 3);
    %xlim([-10, 10]);
    %ylim([-10, 10]);
    axis equal;
    %hold on;
    xlim([-4, 4]);
    ylim([-4, 4]);
    xlabel(strcat('$', str_x, '_1$'), 'Interpreter', 'LaTeX', 'fontsize', 12);
    ylabel(strcat('$', str_x, '_2$'), 'Interpreter', 'LaTeX', 'fontsize', 12);
end

    % imagesc([min(c{1}) - dx/2, max(c{1}) + dx/2], [min(c{2}) - dy/2, max(c{2}) + dy/2], n);
    % hold on;
    % set(gca,'YDir','normal');
    % xlabel('$x_1$', 'Interpreter', 'LaTeX', 'fontsize', 15);
    % ylabel('$x_2$', 'Interpreter', 'LaTeX', 'fontsize', 15);
    %colormap(cool);