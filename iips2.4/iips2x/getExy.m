function [ E ] = getExy( X, Y )
%GETExy Summary of this function goes here
%   Detailed explanation goes here
    E = sum(mean(X .* Y));
end

