% Test a network with one hidden layer.
%
% Parameters:
%   - b: List of bias matrices.
%   - w: List of weight matrices.
%   - Test_set: Matrix containing the test attributes set.
% Returns:
%   - prediction: Matrix in which each row represents the predicted class.
function [prediction] = network_test(b, w, Test_set)

  % Initialize result
  prediction = [];
  
  % Start prediction
  for i = 1 : size(Test_set, 1)
    % Hidden layer
    z_in = b{1} + w{1}*Test_set(i, :)';
    z = @f(z_in);
    % Output layer
    y_in = b{2} + w{2}*z;
    y = @f(y_in);
    
    % Predict
    classify = bp_classify(y');
    classify(classify == -1) = 0;
    prediction = [prediction; classify];
  end

end