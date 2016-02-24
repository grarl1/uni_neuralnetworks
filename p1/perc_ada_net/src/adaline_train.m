#! /usr/bin/octave -qf

% Function: adaline_train
%
% Description:
%   Implements a learning algorithm for an adaline
%
% Parameters:
%   alpha: train rate 
%   tol: tolerance value for the error.
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
%   error: vector  of cuadratic error for each age
%   n_ages: iterations performed during training.
%
function [b w error ecm n_ages] = adaline_train (alpha, tol, max_ages, Train_set, Class_set)

  % Initializing values
  adaline_out_no = size(Class_set, 2); %number of output neurons
  b = zeros(adaline_out_no, 1); % b as column vector 
  % the number of weights for each input neuron is the same as the number of attributes on each sample
  w_size = size(Train_set, 2); 
  w = zeros(adaline_out_no , w_size); % weights are in a matrix of number_of_output_neurons x w_size
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
      w = w + alpha*(Class_set(i,:)'-y_in)*Train_set(i, :);
      b = b + alpha*(Class_set(i,:)'-y_in);
      ecm_iter += sum((Class_set(i,:)'-y_in).^2);
      predicted = f_y_adaline(y_in)';
      if ( ~isequal( predicted, Class_set(i,:))) %if predicted class does not match actual class
        n_errors++;
      end
    end
    n_ages++;
    ecm(n_ages) = ecm_iter/n_samples; 
    error(n_ages) = n_errors / n_samples;
    max_b_change = max( abs( previous_b - b ) );
    max_w_change = max( max( abs( previous_w - w ) ) );
    stop_condition = ( ( ( max_b_change < tol ) && ( max_w_change < tol ) ) 
                        || ( n_ages >= max_ages ) );
  endwhile



