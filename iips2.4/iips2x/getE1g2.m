function E1g2 = getE1g2( X, window_size )
%PLOT_C_E Summary of this function goes here
%   Detailed explanation goes here
    x1 = X(:, 1);
    x2 = X(:, 2);
    [~, index] = sort(x2);
    [~, inv_index] = sort(index);
    %x_sorted = [x1(index), x2(index)];
    b = (1/window_size) * ones(1,window_size);
    a = 1;
    E1g2 = filter(b, a, x1(index));
    E1g2 = E1g2(inv_index);
end

