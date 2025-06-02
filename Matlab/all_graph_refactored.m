clc;
clear all;

%% Graph 1: Analytical Solution
t = 0:0.005:5;
y1 = exp(-0.3 * t) .* (4 * cos(2.81247 * t) + 0.42667 * sin(2.81247 * t));

figure;
plot(t, y1, 'LineWidth', 1.5);
hold on;
grid on;
xlabel('t');
ylabel('y(t)');

%% Graph 2: Euler Method
h = 0.5;
t = 0:h:5;
a = (t(end) - t(1)) / h;

% Initial conditions
y2(1) = 4;
u(1) = 0;

% Differential equations
dy = @(u) u;
du = @(u, y) -0.6 * u - 8 * y;

for i = 1:a
    u(i+1) = u(i) + h * du(u(i), y2(i));
    y2(i+1) = y2(i) + h * dy(u(i));
end

plot(t, y2, 'LineWidth', 1.5);

%% Graph 3: Heun Method (Second-order Runge-Kutta)
h2 = 0.5;
t = 0:h2:5;
a1 = (t(end) - t(1)) / h2;

% Initial conditions
y3(1) = 4;
u3(1) = 0;

% Differential equations
dy3 = @(u) u;
du3 = @(u, y) -0.6 * u - 8 * y;

for i = 1:a1
    % First step
    k1y = dy3(u3(i));
    k1u = du3(u3(i), y3(i));
    
    % Second step
    k2y = dy3(u3(i) + k1u * h2);
    k2u = du3(u3(i) + k1u * h2, y3(i) + k1y * h2);
    
    % Final update
    y3(i+1) = y3(i) + h2 * (k1y + k2y) / 2;
    u3(i+1) = u3(i) + h2 * (k1u + k2u) / 2;
end

plot(t, y3, 'LineWidth', 1.5);

%% Graph 4: Fourth-order Runge-Kutta Method
h3 = 0.5;
t = 0:h3:5;
a = (t(end) - t(1)) / h3;

% Initial conditions
y4(1) = 4;
u(1) = 0;

dy = @(u) u;
du = @(u, y) -0.6 * u - 8 * y;

for i = 1:a
    k1_y = u(i);
    k1_u = du(u(i), y4(i));
    
    k2_y = u(i) + h3 * k1_u / 2;
    k2_u = du(u(i) + h3 * k1_u / 2, y4(i) + h3 * k1_y / 2);
    
    k3_y = u(i) + h3 * k2_u / 2;
    k3_u = du(u(i) + h3 * k2_u / 2, y4(i) + h3 * k2_y / 2);
    
    k4_y = u(i) + h3 * k3_u;
    k4_u = du(u(i) + h3 * k3_u, y4(i) + h3 * k3_y);
    
    y4(i+1) = y4(i) + (h3 / 6) * (k1_y + 2 * k2_y + 2 * k3_y + k4_y);
    u(i+1) = u(i) + (h3 / 6) * (k1_u + 2 * k2_u + 2 * k3_u + k4_u);
end

plot(t, y4, 'LineWidth', 1.5);

%% Graph 5: Predictor-Corrector Method (Euler + Trapezoidal)
xpc(1) = 0;
y1pc(1) = 4;
y2pc(1) = 0;
delx = 1;
Nt = 5;

for i = 1:Nt
    % Predictor (Euler)
    y1pred = y1pc(i) + delx * y2pc(i);
    y2pred = y2pc(i) + delx * (-0.6 * y2pc(i) - 8 * y1pc(i));
    
    % Corrector (Trapezoidal)
    f1curr = y2pc(i);
    f2curr = -0.6 * y2pc(i) - 8 * y1pc(i);
    
    f1pred = y2pred;
    f2pred = -0.6 * y2pred - 8 * y1pred;
    
    y1pc(i+1) = y1pc(i) + (delx / 2) * (f1curr + f1pred);
    y2pc(i+1) = y2pc(i) + (delx / 2) * (f2curr + f2pred);
    xpc(i+1) = xpc(i) + delx;
end

plot(xpc, y1pc, 'LineWidth', 1.5);
xlabel('t');
ylabel('y(t)');
title('All Graphs');

legend('Analytical', 'Euler Method', 'Second-order RK Method', 'Fourth-order RK Method', 'Predictor-Corrector Method')
