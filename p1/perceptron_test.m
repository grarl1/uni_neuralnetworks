% Function: prediction
%
% Description:
%   Test function for a perceptron given it's bias and weight values.
%
% Parameters:
%   theta: threshold value for the perceptron
%   b: perceptron bias
%   w: perceptron weight vector
%   Test_set: matrix containing every sample to test.
%
% Returns:
%   Vector of predictions for each sample in Test_set.
% 

function prediction = perceptron_test (theta, b, w, Test_set)
  n_test = size( Test_set, 1 );
  prediction = zeros(n_test, 1);
  for i = 1:n_test
    y = b + Test_set(i,:)*w';
    prediction(i) = f_y_perceptron(y, theta);
  end