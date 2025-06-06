clc;
clear all;

% Polynomial Function
x= -250:0.0001:300;

% Langrange Method

f = -4.516017316e-14.*(x+200).*(x+100).*(x).*(x-100).*(x-300)+ ...
    2.12e-12.*(x+250).*(x+100).*(x).*(x-100).*(x-300)- ...
    5.825e-12.*(x+250).*(x+200).*(x).*(x-100).*(x-300)+ ...
    5.8e-12.*(x+250).*(x+200).*(x+100).*(x-100).*(x-300)- ...
    2.24047619e-12.*(x+250).*(x+200).*(x+100).*(x).*(x-300)+ ...
    1.575757576e-13.*(x+250).*(x+200).*(x+100).*(x-100).*(x-100);
    
% Newton Method
g = 0.0163 + (x+250).*0.006034 + (x+250).*(x+200).*-2.224e-5+...
    (x+250).*(x+200).*(x+100).*1.24e-8 + (x+250).*(x+200).*(x+100)...
    .*(x).*9.76e-10 + (x+250).*(x+200).*(x+100).*(x).*(x-100)...
    .*(-6.514375e-12);
% Plot
plot(x,f), xlabel("Temperature (Celcius)"), ylabel("C_p (kJ/kg.k)")
hold on;
grid on;
plot(x,g);

%Plot Data
x1 = [-250, -200, -100, 0, 100, 300];
y1 = [0.00163, 0.318, 0.699, 0.87, 0.941, 1.04];
plot(x1,y1);
hold off;

legend("Langrange Method", "Newton Method", "Data Given");