tic
% Define the values of N to test
N_values = [20, 50, 100, 200, 400, 800, 1600, 5000, 20000, 40000];

% Number of runs
num_runs = 5;

% Initialize a matrix to store the proportions for all runs
all_proportions = zeros(num_runs, length(N_values));

% Set up the figure for plotting
figure;
hold on;

% Loop over the number of runs
for run = 1:num_runs
    proportions = zeros(size(N_values));
    
    for j = 1:length(N_values)
        N = N_values(j);
        
        % Step 1: Generate N bits with Alice's basis and numbers
        alice_bits = randi([0, 1], 1, N);
        alice_basis = arrayfun(@(x) '+', alice_bits);
        alice_basis(alice_bits == 1) = 'x';

        % Step 2: Generate what Bob sees based on the new probabilities provided
        bob_results = strings(1, N);
        for i = 1:N
            if alice_bits(i) == 0  % Alice sends 0 in basis +
                outcome = randsample(["0+", "1x", "0x", "1+"], 1, true, [0.375, 0.25, 0.25, 0.125]);
            else  % Alice sends 1 in basis x
                outcome = randsample(["0+", "1x", "0x", "1+"], 1, true, [0.25, 0.375, 0.125, 0.25]);
            end
            bob_results(i) = outcome;
        end

        % Step 3: Determine "Granted/Denied" status based on Bob's measurement
        granted_count = sum(bob_results == "0x" | bob_results == "1+");

        % Calculate the proportion of "granted" bits
        proportions(j) = (granted_count / N) * 100;
    end

    % Store the proportions for this run
    all_proportions(run, :) = proportions;

    % Plot the proportion of "granted" bits for this run
    plot(N_values, proportions, '-o', 'DisplayName', ['Run ' num2str(run)]);
end

% Calculate the minimum and maximum proportions across all runs
min_proportions = min(all_proportions, [], 1);
max_proportions = max(all_proportions, [], 1);

% Create a shaded area (error region) between the min and max values
fill([N_values, fliplr(N_values)], [max_proportions, fliplr(min_proportions)], ...
    [0.8 0.8 1], 'FaceAlpha', 0.3, 'EdgeColor', 'none');

% Configure the plot
set(gca, 'XScale', 'log');
xlabel('Number of Bits (N)', 'FontName', 'Times New Roman', 'FontSize', 20);
ylabel('Proportion of "Granted" Bits (%)', 'FontName', 'Times New Roman', 'FontSize', 20);
title('Proportion of "Granted" Bits as a Function of N with New Probabilities', 'FontName', 'Times New Roman', 'FontSize', 20);
grid on;

% Set axis number font size and font
set(gca, 'FontName', 'Times New Roman', 'FontSize', 20);
legend('show');
ylim([0 100])

hold off;
toc
