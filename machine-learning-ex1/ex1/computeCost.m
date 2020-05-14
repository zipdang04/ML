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
% => nguyên c? ma tr?n X(m, n) * theta (n * 1) = ma tr?n h(m * 1) là k?t qu? tính hàm h c?a t?ng b? data
cal = X * theta - y;
%cái này là bình ph??ng t?ng ph?n t? thôi
cal .*= cal;
%chia cho 2m nh? công th?c ? trên
J = sum(cal) / (2 * m);

% =========================================================================

end
