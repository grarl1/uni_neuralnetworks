% Train a network with one hidden layer using back propagation.
%
% Parameters:
%   - Train_set: Matrix containing the training attributes set.
%   - Train_class: Matrix containing the trainging classes.
%   - alpha: Learning rate.
%   - hidden_layer_n: Number of nodes in the hidden layer.
%   - max_ages: Limit of the trainging ages.
%
% Returns:
%   - b: List of matrices representing the bias of each layer.
%   - w: List of matrices representing the weights of each layer.
%   - n_ages: Number of ages of the trainging.
%   - error: Matrix of errors for each age.
%   - output_file: Descriptor of a file to print the age, the mean squared error and the weights.
%
function [b w n_ages error] = bp_train(Train_set, Train_class, alpha, hidden_layer_n, max_ages, output_file)

  % Number of samples, attributes and classes,
  n_samples = size(Train_set, 1);
  n_attr = size(Train_set, 2);
  n_classes = size(Train_class, 2);
  
  % Inicialization
  gamma_val = 0.5;
  % Bias vectors
  b = {2*gamma_val*rand(hidden_layer_n, 1) - gamma_val, 2*gamma_val*rand(n_classes, 1) - gamma_val};
  % Weights matrices
  w = {2*gamma_val*rand(hidden_layer_n, n_attr) - gamma_val, 2*gamma_val*rand(n_classes, hidden_layer_n) - gamma_val};
  
  %% Nguyen-Widrow initialization algorithm
  % beta_val = 0.7*hidden_layer_n^(1/n_attr);
  % v_mod = sqrt(sum(w{1}.^2, 2));
  % b{1} = 2*beta_val*rand(hidden_layer_n, 1) - beta_val;
  % w{1} = (beta_val * w{1}) ./ repmat(v_mod, 1, size(w{1}, 2));
  
  % Change zeroes of Class_set to -1
  Train_class(Train_class == 0) = -1;
  
  % Training
  n_ages = 0;
  stop_condition = false;
  
  % Start trainging
  while (stop_condition == false)
  
    % Errors values
    n_errors = 0;
    mse_iter = 0;
  
    % Update values
    prev_w = w;
    prev_b = b;
    
    for i = 1 : n_samples
      %% Feedforward %%
      % Hidden layer
      z_in = b{1} + w{1}*Train_set(i, :)';
      z = @f(z_in);
      % Output layer
      y_in = b{2} + w{2}*z;
      y = @f(y_in);
      
      %% Backpropagation %%
      % Output layer
      delta = (Train_class(i, :)' - y) .* @f_prime(y);
      delta_b_output = alpha * delta;
      delta_w_output = delta_b_output * z';
      
      % Hidden layer
      delta_in = (w{2})'*delta;
      delta = delta_in .* @f_prime(z);
      delta_b_hidden = alpha*delta;
      delta_w_hidden = delta_b_hidden*Train_set(i, :);
      
      %% Update bias and weights %%
      b{1} += delta_b_hidden;
      b{2} += delta_b_output;
      w{1} += delta_w_hidden;
      w{2} += delta_w_output;
      
      %% Mean squared error
      mse_iter += sum((Train_class(i, :)' - y).^2);
      
      %% Classification %%
      if (~all((bp_classify(y) - Train_class(i, :)') == 0))
        n_errors++;
      end
    end
    
    % Age completed.
    n_ages++;
    
    % Print age, mse and weights.
    if (output_file ~= -1)
      fprintf(output_file, "%d\t", n_ages);
      fprintf(output_file, "%f\t", mse_iter / n_samples);
      fprintf(output_file, "%f\t", b{1}(:));
      fprintf(output_file, "%f\t", w{1}(:));
      fprintf(output_file, "%f\t", b{2}(:));
      fprintf(output_file, "%f\t", w{2}(:));
      fprintf(output_file, "\n");
    end
    
    % Update error values.
    error(n_ages) = n_errors / n_samples;
    
    % Check the stop condition.
    stop_condition = (all((b{1} - prev_b{1}) == 0) && all((w{1} - prev_w{1}) == 0 )) && ...
                     (all((b{2} - prev_b{2}) == 0) && all((w{2} - prev_w{2}) == 0 )) || ...
                     (n_ages >= max_ages);
  end
end