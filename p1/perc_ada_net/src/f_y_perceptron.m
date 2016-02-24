% Function: f_y_perceptron
%
% Description:
%   Evaluates f(y) function for a perceptron.
%
% Parameters:
%   y: for a perceptron this value is b + SUM(xi*wi).
%   theta: threshold value for the perceptron. Can be 
%      either a single value or a vector of the same 
%      size as y.
%
% Returns a value:
%     1 if y > theta
%    -1 if y < -theta
%     0 otherwise
%
function f_y = f_y_perceptron (y, theta)
  f_y = (y > theta) - (y < -theta);