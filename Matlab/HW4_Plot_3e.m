clc;
clear all;

% Initial Condition
xpc(1) = 0;
y1pc(1) = 4;
y2pc(1) = 0;
delx = 1;
Nt = 5;

% Predictor-Corrector method
for i = 1:Nt
    % Predictor - Euler
    y1pred = y1pc(i) + delx * y2pc(i);
    y2pred = y2pc(i) + delx * (-0.6*y2pc(i) - 8*y1pc(i));

    % Corrector - Trapezoidal
    f1curr = y2pc(i);
    f2curr = -0.6*y2pc(i) - 8*y1pc(i);

    f1pred = y2pred;
    f2pred = -0.6*y2pred - 8*y1pred;

    y1pc(i+1) = y1pc(i) + (delx/2)*(f1curr + f1pred);
    y2pc(i+1) = y2pc(i) + (delx/2)*(f2curr + f2pred);
    xpc(i+1) = xpc(i) + delx;
end

plot(xpc, y1pc), xlabel('t'), ylabel('y_5(t)');
title('Predictor-Corrector method with h = 1.0')
