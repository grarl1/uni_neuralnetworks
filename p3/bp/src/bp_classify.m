% Classifies a vector, depending on the output of the transfer
% function.
%
% Parameters:
%   -y: Transfer function evaluated at y_in.
%
% Returns: 
%   -prediction: A vector filled of -1 except for one value,
%    whose position corresponds to the class predicted.
function [prediction] = bp_classify(y)
  prediction = (y > 0) - (y <= 0);
end