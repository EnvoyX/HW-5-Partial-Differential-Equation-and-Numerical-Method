N = [10 20 40 100 1000];
y1 = [1.82101 0.91267 0.47845 0.27372 0.21998];   % Trapezoidal Rule
y2 = [1.21402 0.60989 0.33371 0.23127 0.21938];   % Simpson's 1/3 Rule
y3 = [1.36577 0.68532 0.36751 0.23783 0.21939];   % Simpson's 3/8 Rule

% Plot
figure; hold on; grid on
xlabel('Number of Partitions (N)');
ylabel('Approximated Integral Value');
title('Comparison of Numerical Integration Methods');

a1 = plot(N, y1, '-o', 'LineWidth', 2); M1 = 'Trapezoidal Rule';
a2 = plot(N, y2, '-s', 'LineWidth', 2); M2 = 'Simpson 1/3 Rule';
a3 = plot(N, y3, '-^', 'LineWidth', 2); M3 = 'Simpson 3/8 Rule';

legend([a1, a2, a3], M1, M2, M3)
xlim([-200, 1100]);
ylim([0, 2.3]);
