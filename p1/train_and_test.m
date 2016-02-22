#! /usr/bin/octave -qf

%
% This script trains and tests a perceptron and
% an Adaline with input_file passed and prints some results
%

addpath("./utils/");

% Implements a learning perceptron given a file
%   containing data to learn from.

% Input control
args_list = argv();
argc = length(args_list);

% Parse arguments
if (argc < 2)
  disp('Usage: train_and_test input_file_path output_file_path [alpha]');
  return
end

% Input
input_file = fopen(args_list{1},'r');
if (input_file == -1)
  printf("Error opening %s",args_list{1});
  return
end
%TODO REMOVE
input_file = fopen(args_list{1},'r');

% Read alpha value if specified, otherwise set it to 1.
if (argc >= 3)
  alpha = str2double(args_list{3});
else
  alpha = 1;
end

% Read whole file
n_attributes = fscanf(input_file, '%d', 1);
[n_classes read] = fscanf(input_file, '%d', 1);
n_samples = 0;
Sample_attr = [];
Sample_class = [];
while ( read ~= 0 )
   sample_attr = fscanf(input_file, '%f', n_attributes); % read attributes in a vector
   [sample_class read] = fscanf(input_file, '%f', n_classes); % read class in a vector
   if (read ~= 0)
     Sample_attr = [Sample_attr ; sample_attr']; % save attributes to a matrix
     Sample_class = [Sample_class ; sample_class']; % save classes to a matrix
     n_samples++;
   end
end
fclose(input_file);

% Proportion of samples for learning purposes:
% NOTE: A training value of 0.5 means that the perceptron will
%   train with the first 50% of the samples in the matrix.
%   A test value of 0.1 means that the perceptron will test with the last 10%
%   of the matrix. So if training=test=0.9, 80% of the whole set of samples
%   will be used both for training and testing.
training = 0.7;
test = 0.3;
max_ages = 100;
theta = 0;
tolerance = 0.001;

% shuffle entries of the matrix
shuffled_indexes = shuffle_array(n_samples);
training_indexes = shuffled_indexes(1:floor(training*n_samples));
test_indexes = shuffled_indexes(end-ceil(test*(n_samples - 1)):end);
% As in these examples we just have to classes, we are going to define
% the class for each sample as (0 1) -> -1 and (1 0) -> 1
Train_set = Sample_attr(training_indexes,:);
Train_class = Sample_class(training_indexes,:);
Test_set = Sample_attr(test_indexes,:);

%TODO remove following lines, are just for testint neural networks.
% Train the perceptron
[b w error ecm n_ages] = perceptron_train(alpha, theta, max_ages, Train_set, Train_class);
% Perform test for remaining samples.
prediction = network_test(b, w, Test_set);
printf("PERCEPTRON: \n");
printf("%% of accuracy over test set after %d ages of training:\n", n_ages);
matched = all(prediction == Sample_class(test_indexes,:), 2);
sum(matched)/length(matched)*100
printf("%d misses\n",length(matched)-sum(matched));
printf("ECM for Perceptron :\n");
ecm

%Train the Adaline
alpha = 0.01;
[b w error ecm n_ages] = adaline_train(alpha, tolerance, max_ages, Train_set, Train_class);
prediction = network_test(b, w, Test_set);
printf("ADALINE: \n");
printf("%% of accuracy over test set after %d ages of training:\n", n_ages);
matched = all(prediction == Sample_class(test_indexes,:), 2);
sum(matched)/length(matched)*100
printf("%d misses\n",length(matched)-sum(matched));
printf("ECM for Adaline :\n");
ecm
