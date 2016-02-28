#! /usr/bin/octave -qf

% Function: perceptron_train
%
% Description:
%   Implements a learning algorithm for a perceptron
%
% Parameters:
%   alpha: train rate 
%   theta: threshold value.
%   max_ages: max iterations of the algorithm, in case
%      it does not stop by itself.
%   Train_set: matrix in which each row represents
%      a sample. 
%   Class_set: matrix containing the class for each sample
%      in Train_set.
%
% Returns:
%   b: bias value
%   w: weight vector
%   error: vector of values between 0 and 1 representing, for each
%     iteration of the main loop, the amount of matches between 
%     class predicted and actual class being 0 a 100% match and 1 a 0%.
%   n_ages: iterations performed during training.
%
function [b w error ecm n_ages] = perceptron_train (alpha, theta, max_ages, Train_set, Class_set)

  % Initializing values
  perceptron_out_no = size(Class_set, 2); %number of output perceptrons
  b = zeros(perceptron_out_no, 1); % b as column vector 
  % the number of weights for each perceptron is the same as the number of attributes on each sample
  w_size = size(Train_set, 2); 
  w = zeros(perceptron_out_no , w_size); % weights are in a matrix of number_of_perceptrons x w_size
  n_samples = size(Train_set, 1); %the number of samples is the number of rows in Train_set
  n_ages = 0;
  stop_condition=false;
  %change zeroes of Class_set to -1
  Class_set(Class_set == 0) = -1;

  % main loop
  while (stop_condition == false) 
    previous_w = w;
    previous_b = b;
    n_errors = 0;
    ecm_iter = 0;

    for i = 1:n_samples
      y_in = b + w*Train_set( i, : )';
      ecm_iter += sum((Class_set(i,:)'-y_in).^2);
      predicted = f_y_perceptron(y_in, theta)';
      if ( ~isequal( predicted, Class_set(i,:)))
        %mismatch stores 0 on coords that match and the value of Class_set on coord mismatch
        mismatch = (predicted ~= Class_set(i,:)) .* Class_set(i,:);
        w = w + alpha*mismatch'*Train_set(i, :);
        b = b + alpha*mismatch';
        n_errors++;
      end
      
    end
    n_ages++;
    ecm(n_ages) = ecm_iter / n_samples;
    error(n_ages) = n_errors / n_samples;
    stop_condition = ( isequal(b, previous_b) && isequal(w, previous_w) ) || (n_ages >= max_ages);
  endwhile



