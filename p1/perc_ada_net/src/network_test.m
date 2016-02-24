% Function: network_test
%
% Description:
%   Test function for a perceptron given it's bias and weight values.
%   Works for perceptron and adaline.
%
% Parameters:
%   b: perceptron bias vector
%   w: perceptron weight matrix
%   Test_set: matrix containing every sample to test.
%
% Returns:
%   Vector of predictions for each sample in Test_set.
% 

function prediction = network_test (b, w, Test_set)
  n_test = size( Test_set, 1 );
  prediction = [];
  for i = 1:n_test
    y = b + w*Test_set(i,:)'; 
    f_y = (y == max(y))';
    % in case more than one coordinate matches max value, remove every 1
    % after first occurence
    non_zero_i = find (f_y, 1);
    f_y = [f_y(1:non_zero_i), zeros(1, length(f_y) - non_zero_i)];
    prediction = [prediction; f_y];
  end