clc;
clear all;

t = 0:0.005:5;

% Analytically
y1 = exp(-0.3*t).*(4*cos(2.81247*t)+0.42667*sin(2.81247*t));

plot(t, y1), xlabel('t'), ylabel('y_1(t)');
title('Problem 3a (Analytically)');
