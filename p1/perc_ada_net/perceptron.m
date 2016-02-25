#! /usr/bin/octave -qf

%
% This script trains and tests a perceptron 
% with input_file passed and prints some results
%

addpath("./src/");

% Implements a learning perceptron given a file
% containing data to learn from.

% Input control
args_list = argv();
argc = length(args_list);

% Parse arguments
if (argc < 6)
  disp('Usage: ./perceptron input_file_path out_file_path alpha train_proportion max_ages theta [real_problem_file]');
  return
end

% Input
input_file = fopen(args_list{1},'r');
output_file = fopen(args_list{2}, 'w+');
if ( (input_file == -1) || (output_file == -1) )
  disp('Error opening files');
  return
end
alpha = str2double(args_list{3});
% NOTE: A training value of 0.5 means that the perceptron will
%   train with the first 50% of the samples given.
%   A test value of 0.1 means that the perceptron will test with the last 10%
%   of the samples. So if training=test=0.9, 80% of the whole set of samples
%   will be used both for training and testing.
training = str2double(args_list{4});
test = 1-training;
if (test == 0) %case where train and test must be 100%
  test = 1;
end
max_ages = str2double(args_list{5});
theta = str2double(args_list{6});
if (argc >= 7)
  real_problem_file = fopen(args_list{7}, 'r'); 
else 
  real_problem_file = -1;
end

% Read whole train file
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
if (real_problem_file ~= -1) %read whole real problem file if there is one
   read = 1;
   Test_set = [];
   fscanf(real_problem_file, '%d %d'); %read and ignore attribute number and classes
   while ( read ~= 0 )
     sample_attr = fscanf(real_problem_file, '%f', n_attributes); % read attributes in a vector
     [sample_class read] = fscanf(real_problem_file, '%f', n_classes); % read class in a vector
     if (read ~= 0) %sample_class can be ignored as it will be unknown
       Test_set = [Test_set ; sample_attr']; % save attributes to a matrix
     end
  end
  fclose(real_problem_file);
end

% shuffle entries of the matrix
shuffled_indexes = shuffle_array(n_samples);
training_indexes = shuffled_indexes(1:floor(training*n_samples));
test_indexes = shuffled_indexes(end-ceil(test*(n_samples - 1)):end);
Train_set = Sample_attr(training_indexes,:);
Train_class = Sample_class(training_indexes,:);

% Train the perceptron
[b w error ecm n_ages] = perceptron_train(alpha, theta, max_ages, Train_set, Train_class);

if (real_problem_file == -1) % No real problem to solve, perform test for remaining samples and output some stats
  Test_set = Sample_attr(test_indexes,:);
  Test_class = Sample_class(test_indexes,:);
  prediction = network_test(b, w, Test_set);
  printf("PERCEPTRON: \n");
  printf("Actual vs Predicted class on TEST set:\n");
  printf("%d %d \t %d %d \n", [Test_class'; prediction']);
  printf("Ages of training: %d \n", n_ages);
  printf("%% of accuracy over TRAIN set: %f %% \n", (1-error(end))*100);
  matched = all(prediction == Test_class, 2);
  printf("%% of accuracy over TEST set: %f %% \n", (sum(matched) / length(matched))*100);
  fprintf(output_file,"%d %f %f\n", [1:n_ages ; error ; ecm]);
else % if there is a real problem to solve, print predictions for samples given.
  prediction = network_test(b, w, Test_set);
  fprintf(output_file, "%d %d \n", prediction');
end

fclose(output_file);