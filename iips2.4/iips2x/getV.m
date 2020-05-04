function [ V ] = getV(K)
%GETC Summary of this function goes here
%   Detailed explanation goes here
    [V, ~, ~] = svd(K);
end

