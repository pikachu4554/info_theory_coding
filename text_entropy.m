
% Opening file
fileID = fopen("assign_1.txt", 'r');
A = fscanf(fileID, '%c');
fclose(fileID);

% equivalent ASCII values
numeric = double(A);

%remove new line character
numeric(numeric == 10)=[];

% Calculate histogram of ASCII values
plot_values = hist(numeric, 0:255);

% Remove zero frequency values 
plot_values(plot_values == 0) = [];

% Calculate probabilities
total=0;
for i=1:numel(plot_values)
    total=total+plot_values(i);
end
probabilities = plot_values / total;

% Calculate entropy
entropy=0;
for i=1:numel(probabilities)
    entropy=entropy-probabilities(i)*log2(probabilities(i));
end

% Example usage
fprintf('Entropy: %.4f\n', entropy);
