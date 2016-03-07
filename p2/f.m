% Function: Bipolar sigmoid function.
%
% Description:
%   Evaluates the bipolar sigmoid function.
%
% Parameters:
%   y: value or vector.
%
% Return:
%     f(y) where f is the bipolar sigmoid function.
%
function f_y = f(y)
  f_y = (2 ./ (1 + exp(-y))) - 1
end