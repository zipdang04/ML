function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

%J(theta) = 1/2m * sigma t? 1 -> n c?a h(x) - y
%
%h(x) = theta[0] + theta[1] * x[1] + ....
% => nguy�n c? ma tr?n X(m, n) * theta (n * 1) = ma tr?n h(m * 1) l� k?t qu? t�nh h�m h c?a t?ng b? data
cal = X * theta - y;
%c�i n�y l� b�nh ph??ng t?ng ph?n t? th�i
cal .*= cal;
%chia cho 2m nh? c�ng th?c ? tr�n
J = sum(cal) / (2 * m);

% =========================================================================

end
