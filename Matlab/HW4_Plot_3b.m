clc;
clear all;

h = 0.5;

% Initial Condition
y2(1) = 4;
dy = @(u) u;
u(1) = 0;
du = @(u,y) -(0.6*u)-(8*y);
t = 0:h:5;
a = (t(end)-t(1))/h;

% Persamaan Euler
for i = 1:a
    u(i+1) = u(i) + h * du(u(i), y2(i));
    y2(i+1) = y2(i) + h * dy(u(i));
end

plot(t, y2), xlabel('t'), ylabel('y_2(t)');
title('(Euler''s method with h = 0.5)')
