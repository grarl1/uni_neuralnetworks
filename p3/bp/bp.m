#! /usr/bin/octave -qf

% Input control
args_n = 7;
args_list = argv();
argc = length(args_list);

% Add sources path
addpath("./src/");

% Parse arguments
if (argc ~= args_n)
  printf('Usage: ./bp input_path output_path training_percentage alpha hidden_layer_n f_training f_test\n');
  printf('\tinput_path: Path of the file containing the data.\n');
  printf('\toutput_path: The path of the file where to write the mean squared error and the weights of each age.\n');
  printf('\ttraining_percentage: The percentage of the training set.\n');
  printf('\talpha: The learning rate.\n');
  printf('\thidden_layer_n: Number of nodes in the hidden layer.\n');
  printf('\tf_training: Number of pixels changed randomly in each sample for training.\n');
  printf('\tf_test: Number of pixels changed randomly in each sample in the test.\n');
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
rep = 10;
training_proportion = str2double(args_list{3}) / 100;
alpha = str2double(args_list{4});
hidden_layer_n = str2double(args_list{5});
f_training = str2double(args_list{6});
f_test = str2double(args_list{7});

% Read and shuffle samples.
[Sample_attr, Sample_class] = read_samples(input_file);
[Train_set, Train_class, Test_set, Test_class] = shuffle_samples(training_proportion, Sample_attr, Sample_class);

% Add noise
[Train_set, Train_class] = add_noise(Train_set, Train_class, f_training, rep);
[Test_set, Test_class] = add_noise(Test_set, Test_class, f_test, rep);

% Train the net
[b w n_ages error] = bp_train(Train_set, Train_class, alpha, hidden_layer_n, max_ages, output_file);

% Test
prediction = network_test(b, w, Test_set);
test_error = (sum(sum(abs(prediction - Test_class)))) / size(Test_class, 1);

% Print success rates
printf("Back propagation:\n");
printf("Ages of training: %d\n", n_ages);
printf("PE in TRAIN set: %f\n", error(end));
printf("PE in TEST set: %f\n", test_error);

# Close the output file
fclose(output_file);