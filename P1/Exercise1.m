% Modeling the Artificial Neural Network as a graph

% This matrix should be interpreted as follows:
%   Each row and column represents a perceptron.
%   The number in position (i,j) represents the weight
%   of the connection from perceptron i to perceptron j.

Net = [0,0,0,1,0,0,1,0,0,1,0,0,0,0;
       0,0,0,0,1,0,0,1,0,0,1,0,0,0;
       0,0,0,0,0,1,0,0,1,0,0,1,0,0;
       0,0,0,0,0,0,0,1,0,0,0,1,0,0;
       0,0,0,0,0,0,0,0,1,1,0,0,0,0;
       0,0,0,0,0,0,1,0,0,0,1,0,0,0;
       0,0,0,0,0,0,0,0,0,0,0,0,1,-1;
       0,0,0,0,0,0,0,0,0,0,0,0,1,-1;
       0,0,0,0,0,0,0,0,0,0,0,0,1,-1;
       0,0,0,0,0,0,0,0,0,0,0,0,-1,1;
       0,0,0,0,0,0,0,0,0,0,0,0,-1,1;
       0,0,0,0,0,0,0,0,0,0,0,0,-1,1;
       0,0,0,0,0,0,0,0,0,0,0,0,0,0;
       0,0,0,0,0,0,0,0,0,0,0,0,0,0];
       
Net = sparse(Net);
       
% Defining the activation threshold for each perceptron
%   of our net.
threshold = [1 1 1 1 1 1 2 2 2 2 2 2 1 1];

input_file = 'sampledata' %TODO change this for some argument
file = fopen (input_file,'r');
input_vector = fscanf(file, '%d', 3);
status = zeros(1,14);
% Main loop reads input file, extends it to a vector of 
%   length of *perceptron_No* with zeroes, then multiplies
%   it by Net matrix and checks activation thresholds to set 
%   the perceptrons active or inactive.
% After each iteration we print status of perceptrons 13 and 14
%   which represent the output layer of the neural net.
while ( ( length(input_vector) ~= 0 ) | (status ~= 0) )
  input_vector(14) = 0; % extend vector read with zeros
  status = status + transpose(input_vector);
  status = status * Net;
  status = ( status >= threshold );
  status(13:14)
  input_vector = fscanf(file, '%d', 3);
end
fclose(file);
