% Test a network with one hidden layer for time series.
%
% Parameters:
%   - b: List of bias matrices.
%   - w: List of weight matrices.
%   - Test_set: Matrix containing the test attributes set.
% Returns:
%   - prediction: Matrix in which each row represents the predicted class.
function [prediction] = predice_recursivamente(b, w, entry, Nf)

  % Initialize result
  prediction = [];
  entry_size = length(entry);
  
  % Start prediction
  for i = 1 : Nf
    % Hidden layer
    z_in = b{1} + w{1}*entry';
    z = @f(z_in);
    % Output layer
    y_in = b{2} + w{2}*z;
    y = @f_identity(y_in);
    
    % Predict
    classify = y';
    prediction = [prediction; classify];
    entry = shift(entry, -1);
    entry(entry_size) = classify(1);
  end

end