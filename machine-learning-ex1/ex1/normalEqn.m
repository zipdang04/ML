function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.


% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------

%not sure why, but i don't think i'll use it.
%?? em xem l?i cái này trên machinelearningcoban
theta = pinv(X' * X) * (X' * y);

% -------------------------------------------------------------


% ============================================================

end
