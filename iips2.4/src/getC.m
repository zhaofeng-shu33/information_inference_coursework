function C = getC( K )
%GETC 此处显示有关此函数的摘要
%   Cholesky decomposition
% C*C'=K
C = chol(K,'lower');
end

