function Exy = getExy(X,Y)
% calculate empirical autocovariance of X and Y
% Notation: >X: N*2 matrix
%           >Y: N*2 matrix

% N = size(X,1)
Exy = sum(sum(X.*Y))/size(X,1);
end
