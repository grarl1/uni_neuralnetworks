#! /usr/bin/octave -qf

% Input control
args_n = 4;
args_list = argv();
argc = length(args_list);

% Add sources path
addpath("./src/");
% Parse arguments
if (argc ~= args_n)
  printf('Usage: ./adapta_fichero input output na ns\n');
  printf('\tinput: Path of the file containing the data.\n');
  printf('\toutput: The path of the file where to write the processed input\n');
  printf('\tna: Number of attributes.\n');
  printf('\tns: Number of classes.\n');
  return;
end

na = str2num(args_list{3});
ns = str2num(args_list{4});
if (isequal(na, []) || isequal(ns, []))
  printf('ERROR: na & ns arguments must be numbers\n');
  return;
end
adapta_fichero_serie(args_list{1},args_list{2},na,ns);