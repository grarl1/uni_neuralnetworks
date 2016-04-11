#! /usr/bin/octave -qf

% Gets a data file and normalizes the data.

% Input control
args_n = 2;
args_list = argv();
argc = length(args_list);

% Add sources path
addpath("./src/");
% Parse arguments
if (argc ~= args_n)
  printf('Usage: ./norm_data input_path output_path\n');
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

[Sample_attr, Sample_class] = read_samples(input_file);

% Normalization
Norm_attr = (Sample_attr - repmat(mean(Sample_attr), size(Sample_attr, 1), 1)) ./ repmat(std(Sample_attr), size(Sample_attr, 1), 1);

% Print the result
fprintf(output_file, "%d %d\n", [size(Sample_attr, 2) size(Sample_class, 2)])
for i = 1 : size(Norm_attr, 1)
  fprintf(output_file, "%.2f ", Norm_attr(i,:));
  fprintf(output_file, "%d ", Sample_class(i,:));
  fprintf(output_file, "\n");
end

% Close output file
fclose(output_file);
