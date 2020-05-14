function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
len = length(X);
%mu = zeros(1, size(X, 2));
%sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       
%m?c ti�u: n�n d? li?u
mu = mean(X_norm); %t�m mean c?a t?ng feature
sigma = std(X_norm); %t�m std c?a t?ng feature, nghe b?o thay v� std c� th? l?y max - min c?a feat
for i = 1:len
    %tr? mu r?i chia sigma th�i :))
    X_norm(i, :) -= mu;
    X_norm(i, :) ./= sigma;
endfor

%for i = 1:len
%    X_norm(i, :) /= sigma;
%endfor
% ============================================================

end
