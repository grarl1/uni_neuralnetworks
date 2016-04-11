#! /usr/bin/octave -qf

% Gets two inputs file, using the first one to train the 
% network and make predictions for the second one.

% Input control
args_n = 5;
args_list = argv();
argc = length(args_list);

% Add sources path
addpath("./src/");
% Parse arguments
if (argc ~= args_n)
  printf('Usage: ./bp_pred input_train input_data output_path alpha hidden_layer_n\n');
  return;
end

% Files
input_train = fopen(args_list{1},'r');
if (input_train == -1)
  printf('Error while opening the training file\n');
  return;
end

input_data = fopen(args_list{2},'r');
if (input_data == -1)
  printf('Error while opening the data file\n');
  return;
end

output_file = fopen(args_list{3}, 'w');
if (output_file == -1)
  printf('Error while opening the output file\n');
  return;
end

% Parameters
max_ages = 1000;
training_proportion = 1;
alpha = str2double(args_list{4});
hidden_layer_n = str2double(args_list{5});

% Read and shuffle samples
[Sample_attr, Sample_class] = read_samples(input_train);
[Train_set, Train_class, Test_set, Test_class] = shuffle_samples(training_proportion, Sample_attr, Sample_class);

% Train the net
[b w n_ages error] = bp_train(Train_set, Train_class, alpha, hidden_layer_n, max_ages, -1);

% Make the prediction
[Sample_attr, Sample_class] = read_samples(input_data);
prediction = network_test(b, w, Sample_attr);

% Print the predictions
for i = 1 : size(prediction, 1)
  fprintf(output_file, "%d ", prediction(i, :));
  fprintf(output_file, "\n");
end

% Close the file
fclose(output_file);
