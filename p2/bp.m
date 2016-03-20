#! /usr/bin/octave -qf

% Input control
args_n = 5;
args_list = argv();
argc = length(args_list);

% Parse arguments
if (argc ~= args_n)
  printf('Usage: ./bp input_path training_percentage alpha hidden_layer_n output_path\n');
  printf('\tinput_path: Path of the file containing the data.\n');
  printf('\ttraining_percentage: The percentage of the training set.\n');
  printf('\talpha: The learning rate.\n');
  printf('\thidden_layer_n: Number of nodes in the hidden layer.\n');
  printf('\toutput_path: The path of the file where to write the mean squared error and the weights of each age.\n');
  return
end

% Files
input_file = fopen(args_list{1},'r');
output_file = fopen(args_list{5}, 'w+');
if ( (input_file == -1) || (output_file == -1) )
  printf('Error opening files\n');
  return
end

% Parameters
max_ages = 1000;
training_proportion = str2double(args_list{2}) / 100;
alpha = str2double(args_list{3});
hidden_layer_n = str2double(args_list{4});

% Read and shuffle samples
[Sample_attr, Sample_class] = read_samples(input_file);
[Train_set, Train_class, Test_set, Test_class] = shuffle_samples(training_proportion, Sample_attr, Sample_class)

% Train the net
[b w n_ages error ecm] = bp_train(Train_set, Train_class, alpha, hidden_layer_n, max_ages);

% Test
prediction = network_test(b, w, Test_set);
matched = all(prediction == Test_class, 2);

% Print success rates
printf("Back propagation:\n");
printf("Ages of training: %d\n", n_ages);
printf("%% of accuracy over TRAIN set: %f%%\n", (1-error(end))*100);
printf("%% of accuracy over TEST set: %f%%\n", (sum(matched) / length(matched))*100);

% Print data to file
fprintf(output_file,"%d %f %f\n", [1:n_ages ; error ; ecm]);
# Close the output file
fclose(output_file);