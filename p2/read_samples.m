% Reads a file of data with the following format:
%
% - The first line of the file has two numbers separated by a space: n m
%   Where:
%     n represents the number of attributes.
%     m represents the number of classes.
% - The following lines have n+m numbers separated by spaces, representing
%   the data.
%
% Parameters:
%   - input_file: An input file descriptor.
%
% Returns:
%   - Sample_attr: A matrix containing the attributes data.
%   - Sample_class: A matrix containing the classification data.
%   
function [Sample_attr Sample_class] = read_samples(input_file)
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
    end
  end
  # Close the input file
  fclose(input_file);
end
