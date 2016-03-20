% Suffles the samples data randomly
% 
% Parameters:
%   - training_proportion: Proportion of training data.
%   - Sample_attr: A matrix containing the attributes data.
%   - Sample_class: A matrix containing the classification data.
%
% Returns:
%   - Train_set: Matrix containing the training attributes set.
%   - Train_class: Matrix containing the trainging classes.
%   - Test_set: Matrix containing the test attributes set.
%   - Test_class: Matrix containing the test classes.
function [Train_set, Train_class, Test_set, Test_class] = shuffle_samples(training_proportion, Sample_attr, Sample_class)
  
  % Get the number of samples
  n_samples = size(Sample_attr, 1);
  % Shuffle entries indexes of the matrices
  shuffled_indexes = shuffle_array(n_samples);
  
  % Shuffle the training set.
  training_indexes = shuffled_indexes(1:floor(training_proportion*n_samples));
  Train_set = Sample_attr(training_indexes,:);
  Train_class = Sample_class(training_indexes,:);

  % Shuffle the test set.
  test_indexes = shuffled_indexes(end-ceil(test*(n_samples - 1)):end);
  Test_set = Sample_attr(test_indexes,:);
  Test_class = Sample_class(test_indexes,:);
  
end