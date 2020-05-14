function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
variables = length(theta);
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    
%batch gradient descent: theta[j] -= ??o h�m bi?n theta[j] c?a J(theta)
%which, b?ng sigma bi?n i t? 1->m c?a [(h(x) - y) * x_i_j] // ch? n�y kh� n�i vler

    #kh�ng ???c t�nh r?i tr?, m� ph?i t�nh tr? tr??c r?i tr? sau
    minus = zeros(variables, 0);
    #l�c n�o c?ng c� th?ng h(x) - y, em t�nh s?n kh?i t�nh l?i
    amount = X * theta - y;
    for i = 1: variables
        minus(i, 1) = sum(amount .* X(:, i)) * alpha / m; %t�nh t?ng to�n b? (th?ng sigma nh�n c? c?t feature i)
    endfor
    for i = 1: variables
        theta(i, 1) -= minus(i, 1); %t?t nhi�n r?i, tr? ra th�i ch? g� n?a :)
    endfor

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
