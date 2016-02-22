% Function: f_y_adaline
%
% Description:
%   Evaluates f(y) function for an adaline.
%
% Parameters:
%   y: for an adaline this value is b + SUM(xi*wi).
%
% Returns a value:
%     1 if y >= 0
%    -1 if y < 0
%
function f_y = f_y_adaline (y)
  f_y = (y >= 0) - (y < 0);