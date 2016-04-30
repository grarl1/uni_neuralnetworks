function success = adapta_fichero_serie (fOriginal, fAdaptado, na, ns)

  if ((na <= 0) || (ns <= 0))
    success = false;
    return;
  end

  inputfile = fopen(fOriginal,'r');
  if (inputfile == -1)
    success = false;
    return;
  end
  
  outputfile = fopen(fAdaptado,'w');
  if (outputfile == -1)
    fclose(inputfile);
    success = false;
    return;
  end
  
  % Read na attributes and ns class
  [attr{1} naread] = fscanf(inputfile, '%f\n', na); % Read na attributes in a vector
  [attr{2} nsread] = fscanf(inputfile, '%f\n', ns); % Read ns attributes in a vector
  if ((naread < na) || (nsread < ns)) % not enough attributes in file
    success = false;
    fclose(inputfile);
    fclose(outputfile);
    return;
  end
  attr{1} = attr{1}';
  attr{2} = attr{2}';
  
  % write to new file and read a new attribute each iteration.
  fprintf(outputfile, "%d %d\n", na, ns);
  nread = 1;
  while ( nread ~= 0 )
    % print new format line and read a new attribute
    fprintf(outputfile, "%f ",attr{1}, attr{2});
    fprintf(outputfile, "\n");
    attr{1} = shift(attr{1},-1);
    attr{1}(na) = attr{2}(1);
    attr{2} = shift(attr{2},-1);
    [value_read nread] = fscanf(inputfile, "%f\n", 1);
    if (nread > 0)
      attr{2}(ns) = value_read(1);
    end
  end
  # Close the input file
  fclose(inputfile);
  fclose(outputfile);
  success = true;
end