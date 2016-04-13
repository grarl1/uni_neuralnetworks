% Adds noise to a set of samples.
%
% Parameters:
%   -Attr_set: Set of attributes with noise.
%   -Class_set: Set of classes wit noise.
%
% Returns: 
%   -attributes: Set of attributes without noise.
%   -classes: Set of classes without noise.
%   -F: Number of pixels randomly changed.
%   -rep: Number of repetitions.
%
function [Attr_set, Class_set] = add_noise(attributes, classes, F, rep)

  % Check if there are not errors.
  if (F == 0)
    Attr_set = attributes;
    Class_set = classes;
    return;
  end
  
  Attr_set = repmat(attributes, rep, 1);
  Class_set = repmat(classes, rep, 1);
  
  % Add the noise
  for i = 1 : size(Attr_set, 1)
    perm = randperm(size(Attr_set, 2), F);
    Attr_set(i, perm) = mod(Attr_set(i, perm) + 1, 2);
  end
end