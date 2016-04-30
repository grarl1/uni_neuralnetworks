% Test a network with one hidden layer for time series.
%
% Parameters:
%   - b: List of bias matrices.
%   - w: List of weight matrices.
%   - Test_set: Matrix containing the test attributes set.
% Returns:
%   - prediction: Matrix in which each row represents the predicted class.
function [prediction mse mse_basic] = network_test_time(b, w, Test_set, Test_class)

  % Initialize result
  prediction = [];
  mse = 0;
  mse_basic = 0;
  n_attr = size(Test_set, 2);
  n_classes = size(Test_class, 2);
  n_samples = size(Test_set, 1);
  
  % Start prediction
  for i = 1 : n_samples
    % Hidden layer
    z_in = b{1} + w{1}*Test_set(i, :)';
    z = @f(z_in);
    % Output layer
    y_in = b{2} + w{2}*z;
    y = @f_identity(y_in);
    
    % Predict
    classify = y';
    prediction = [prediction; classify];
    
    % mse for this prediction and the most basic one
    if (exist('Test_class', 'var'))
      mse += sum((Test_class(i, :) - classify).^2);
      mse_basic += sum((Test_class(i, :) - repmat(Test_set(i,n_attr),1,n_classes)).^2);
    end
  end
  if (exist('Test_class', 'var'))
    mse = mse/n_samples;
    mse_basic = mse_basic/n_samples;
  end

end