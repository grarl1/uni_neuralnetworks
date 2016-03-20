% Function: Derivative of the bipolar sigmoid function.
%
% Description:
%   Evaluates the derivative of the bipolar sigmoid function.
%
% Parameters:
%   f_y: value of f(y) where f is the bipolar sigmoid function.
%
% Return:
%     f'(y) where f is the bipolar sigmoid function.
%
function f_prime = f_prime(f_y)
  f_prime = (1/2) * (1+f_y).*(1-f_y);
end