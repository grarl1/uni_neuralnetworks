#! /usr/bin/octave -qf

% Input control
args_list = argv();
argc = length(args_list);

% Parse arguments
if (argc ~= 5)
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

% Prepare reading
n_samples = 0;
Sample_attr = [];
Sample_class = [];
n_attributes = fscanf(input_file, '%d', 1);
[n_classes read] = fscanf(input_file, '%d', 1);
% Read whole training file
while ( read ~= 0 )
   sample_attr = fscanf(input_file, '%f', n_attributes); % Read attributes in a vector
   [sample_class read] = fscanf(input_file, '%f', n_classes); % Read class in a vector
   if (read ~= 0)
     Sample_attr = [Sample_attr ; sample_attr']; % Save attributes to a matrix
     Sample_class = [Sample_class ; sample_class']; % Save classes to a matrix
     n_samples++;
   end
end
# Close the input file
fclose(input_file);

% Shuffle entries of the matrices
shuffled_indexes = shuffle_array(n_samples);
% Shuffle the training set.
training_indexes = shuffled_indexes(1:floor(training_proportion*n_samples));
Train_set = Sample_attr(training_indexes,:);
Train_class = Sample_class(training_indexes,:);
% Shuffle the test set.
test_indexes = shuffled_indexes(end-ceil(test*(n_samples - 1)):end);

% Train the net
[b w error ecm n_ages] = bp_train(Train_set, Train_class, alpha, hidden_layer_n, max_ages);

% Test
Test_set = Sample_attr(test_indexes,:);
Test_class = Sample_class(test_indexes,:);
prediction = network_test(b, w, Test_set);

% Print data
printf("Back propagation: \n");
printf("Actual vs Predicted class on TEST set:\n");
printf("%d %d \t %d %d \n", [Test_class'; prediction']);
printf("Ages of training: %d \n", n_ages);
printf("%% of accuracy over TRAIN set: %f %% \n", (1-error(end))*100);
matched = all(prediction == Test_class, 2);
printf("%% of accuracy over TEST set: %f %% \n", (sum(matched) / length(matched))*100);
fprintf(output_file,"%d %f %f\n", [1:n_ages ; error ; ecm]);

# Close the output file
fclose(output_file);