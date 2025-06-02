clc;
clear all;

% Graph 1
t = 0:0.005:5;

% Analytically
y1 = exp(-0.3*t).*(4*cos(2.81247*t)+0.42667*sin(2.81247*t));

plot(t, y1), xlabel('t'), ylabel('y(t)');
title('Problem 3')
hold on;
grid on;

% Graph 2
h = 0.5;

% Initial Condition
y2(1) = 4;
dy = @(u) u;
u(1) = 0;
du = @(u, y) -0.6*u - (8*y);
t = 0:h:5;
a = (t(end) - t(1)) / h;

% Euler's method
for i = 1:a
    u(i+1) = u(i) + h * du(u(i), y2(i));
    y2(i+1) = y2(i) + h * dy(u(i));
end

plot(t, y2)

% Graph 3
h2 = 0.5;

% Initial Condition
y3(1) = 4;
dy3 = @(u) u;
u3(1) = 0;
du3 = @(u,y) (-0.6*u)-(8*y);
t = 0:h2:5;
a1 = (t(end)-t(1))/h2;

% Heun Method
for i = 1:a1
    % First Order
    k1y = dy3(u3(i));
    k1u = du3(u3(i), y3(i));

    % Second Order
    k2y = dy3(u3(i) + k1u*h2);
    k2u = du3(u3(i) + k1u*h2, y3(i) + k1y*h2);

    % Final Condition
    y3(i+1) = y3(i) + ((k1y/2) + (k2y/2)) * h2;
    u3(i+1) = u3(i) + ((k1u/2) + (k2u/2)) * h2;
end

plot(t, y3)


% Graph 4
h3 = 0.5;

% Initial Condition
y4(1) = 4;
dy = @(u) u;
u(1) = 0;
du = @(u,y) -0.6.*u - 8.*y;
t = 0:h3:5;
a = (t(end)-t(1))/h3;

% Fourth-Order RK Calculation
for i = 1:a
    % First Order
    k1_y(i) = u(i);
    k1_u(i) = -0.6.*k1_y(i) - 0.8.*y4(i);

    % Second Order
    k2_y(i) = u(i) + h3.*k1_u(i)./2;
    k2_u(i) = -0.6.*k2_y(i) - 8.*(y4(i) + h3.*k1_y(i)./2);

    % Third Order
    k3_y(i) = u(i) + h3.*k2_u(i)./2;
    k3_u(i) = -0.6.*k3_y(i) - 8.*(y4(i) + h3.*k2_y(i)./2);

    % Fourth Order
    k4_y(i) = u(i) + h3.*k3_u(i);
    k4_u(i) = -0.6.*k4_y(i) - 8.*(y4(i) + h3.*k3_y(i));

    % Final Condition
    y4(i+1) = y4(i) + 0.5.*(k1_y(i) + 2.*k2_y(i) + 2.*k3_y(i) + k4_y(i))./6;
    u(i+1) = u(i) + 0.5.*(k1_u(i) + 2.*k2_u(i) + 2.*k3_u(i) + k4_u(i))./6;
end

plot(t, y4)


% Graph 5
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

plot(xpc, y1pc), xlabel('t'), ylabel('y(t)');
title('All graphs')

legend('Analytically', 'Euler Method', 'Second-order RK Method', 'Fourth-order RK method', 'Predictor-Corrector method')
