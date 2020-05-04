function plot_hist_contour(X,s)
% Notation: >X: N*2 matrix
%   此处显示详细说明

% user should handle the calculation of the x and y limit of X

% Notation: >N:10-by-10 matrix
%           >C: the positions of the bin centers
[N,C] = hist3(X);
contour(N);
xlabel(s)
end

