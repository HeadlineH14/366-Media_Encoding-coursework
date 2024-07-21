clear;
close all;

a = [0.5, -0.2, 1.7]';
b = [0.2, 0.9, 0.45]';

Distance1 = SSD(a,b);

display(sprintf('SSD=%f',Distance1));

c = [0.14, -0.2, 1.7, -0.9, -0.2]';
d = [-0.35, 0.26, -0.18, 0.2, 1.7]';

Distance2 = SSD(c,d);

display(sprintf('SSD=%f',Distance2));
