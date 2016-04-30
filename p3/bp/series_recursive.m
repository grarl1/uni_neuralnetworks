#! /usr/bin/octave -qf

% Input control
args_n = 6;
args_list = argv();
argc = length(args_list);

% Add sources path
addpath("./src/");

% Parse arguments
if (argc ~= args_n)
  printf('Usage: ./series_recursive input_path output_path training_percentage alpha hidden_layer_n sample_start\n');
  printf('\tinput_path: Path of the file containing the data.\n');
  printf('\toutput_path: The path of the file where to write the mean squared error and the weights of each age.\n');
  printf('\ttraining_percentage: The percentage of the training set.\n');
  printf('\talpha: The learning rate.\n');
  printf('\thidden_layer_n: Number of nodes in the hidden layer.\n');
  printf('\tsample_start: index of the sample to start.\n');
  return;
end

% Files
input_file = fopen(args_list{1},'r');
if (input_file == -1)
  printf('Error while opening the input file\n');
  return;
end

output_file = fopen(args_list{2}, 'w');
if (output_file == -1)
  printf('Error while opening the output file\n');
  return;
end

% Parameters
max_ages = 200;
training_proportion = str2double(args_list{3}) / 100;
alpha = str2double(args_list{4});
hidden_layer_n = str2double(args_list{5});
sample_start = str2num(args_list{6});

% Read and shuffle samples.
[Sample_attr, Sample_class] = read_samples(input_file);
[Train_set, Train_class, Test_set, Test_class] = split_samples(training_proportion, Sample_attr, Sample_class);

% Train the net
[b w n_ages error] = bp_train_time(Train_set, Train_class, alpha, hidden_layer_n, max_ages, output_file);

% Recursive predictions TODO add randomness
prediction = predice_recursivamente(b, w, Test_set(sample_start,:), 100);

% Print predictions
prediction

# Close the output file
fclose(output_file);