function [ K ] = getK(sigma, rho)
%GETC Summary of this function goes here
%   Detailed explanation goes here
    K = sigma^2 * [1, rho; rho, 1];
end

