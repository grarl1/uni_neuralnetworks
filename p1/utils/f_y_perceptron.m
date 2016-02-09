% Function: f_y_perceptron
%
% Description:
%   Evaluates f(y) function for a perceptron.
%
% Parameters:
%   y: for a perceptron this value is b + SUM(xi*wi)
%   theta: threshold value for the perceptron.
%
% Returns:
%     1 if y > theta
%    -1 if y < -theta
%     0 otherwise
%
function f_y = f_y_perceptron (y, theta)
  if y > theta
    f_y = 1;
  elseif y < -theta
    f_y = -1;
  else
    f_y = 0;
  end