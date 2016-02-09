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
%   train_set: matrix in which each row represents
%      a sample. The last column represents the class
%      of such sample.
%
% Returns:
%   b: bias value
%   w: weight vector
%   error: vector of values between 0 and 1 representing, for each
%     iteration of the main loop, the amount of matches between 
%     class predicted and actual class being 0 a 100% match and 0 a 0%.

function [b w error n_ages] = perceptron_train (alpha, theta, max_ages, Train_set)

  % Initializing values
  b = 0;
  w_size = size(Train_set, 2) - 1;
  w = zeros(1 , w_size);
  actual_class = Train_set( : , end )'; % last column stores the sample class
  n_samples = size(Train_set, 1); %number of rows in Train_set
  previous_w = [];
  previous_b = 0;
  n_ages = 0;
  stop_condition=false;

  % main loop
  while (stop_condition == false) 
    previous_w = w;
    previous_b = b;
    n_errors = 0;

    for i = 1:n_samples
      y_in = b + Train_set( i, 1:end-1 )*w';
      predicted(i) = f_y_perceptron(y_in, theta);
      if (predicted(i) ~= actual_class(i))
        w = w + alpha*actual_class(i)*Train_set( i, 1:end-1 );
        b = b + alpha*actual_class(i);
        n_errors++;
      end
      
    end
    n_ages++;
    error(n_ages) = n_errors / n_samples;
    stop_condition = ( (b == previous_b) && isequal(w, previous_w) ) || (n_ages >= max_ages);
  endwhile



