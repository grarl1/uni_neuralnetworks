#! /usr/bin/octave -qf

% Modeling the Artificial Neural Network as a graph

% Input control
args_list = argv();
argc = length(args_list);

% Parse arguments
if (argc != 2)
  disp('Usage: mp input_file_path output_file_path');
  return
end

% This matrix should be interpreted as follows:
% Each row and column represents a perceptron.
% The number in position (i,j) represents the weight
% of the connection from perceptron i to perceptron j.
Net = [0,0,0,1,0,0,1,0,0,1,0,0,0,0;
       0,0,0,0,1,0,0,1,0,0,1,0,0,0;
       0,0,0,0,0,1,0,0,1,0,0,1,0,0;
       0,0,0,0,0,0,0,1,0,0,0,1,0,0;
       0,0,0,0,0,0,0,0,1,1,0,0,0,0;
       0,0,0,0,0,0,1,0,0,0,1,0,0,0;
       0,0,0,0,0,0,0,0,0,0,0,0,-2,1;
       0,0,0,0,0,0,0,0,0,0,0,0,-2,1;
       0,0,0,0,0,0,0,0,0,0,0,0,-2,1;
       0,0,0,0,0,0,0,0,0,0,0,0,1,-2;
       0,0,0,0,0,0,0,0,0,0,0,0,1,-2;
       0,0,0,0,0,0,0,0,0,0,0,0,1,-2;
       0,0,0,0,0,0,0,0,0,0,0,0,0,0;
       0,0,0,0,0,0,0,0,0,0,0,0,0,0];
Net = sparse(Net);

% Defining the activation threshold for each perceptron
% of our net.
threshold = [1 1 1 1 1 1 2 2 2 2 2 2 1 1];

% Input
input_file = fopen(args_list(1,1),'r');
input_vector = fscanf(input_file, '%d', 3);

% Ouput
output_file = fopen(args_list(2,1),'w');

% Main loop reads input file, extends it to a vector of 
% length of *perceptron_No* with zeroes, then multiplies
% it by Net matrix and checks activation thresholds to set 
% the perceptrons active or inactive.
% After each iteration we print status of perceptrons 13 and 14
% which represent the output layer of the neural net.
status = zeros(1,14);
while ( ( length(input_vector) ~= 0 ) || (status ~= 0) )
  input_vector(14) = 0; % Extend vector read with zeros
  status = status + transpose(input_vector);
  status = status * Net;
  status = ( status >= threshold );
  fprintf(output_file, "%d %d\n", status(13:14));
  input_vector = fscanf(input_file, '%d', 3);
end

% Close files
fclose(input_file);
fclose(output_file);
