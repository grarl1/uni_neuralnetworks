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
    prediction = [prediction; f_y];
  end