clc, clear;
format long;
x=0:0.1:1;
t=0:0.01:0.1;

uu = @(x, t) (0.810745552739333 .* sin(1 .*pi .*x) .* exp(-(1 .*(pi .^2) .*t)))...
+ (0.000646132462383 .* sin(2 .* pi .* x) .* exp(-(4 .* (pi .^2) .*t)))...
+ (-0.090369779948953 .* sin(2 .* pi .* x) .* exp(-(9 .* (pi .^2) .*t)))...
+ (-0.000000000819471 .* sin(2 .* pi .* x) .* exp(-(16 .* (pi .^2) .*t)));

r = uu(x',t);

figure(1);
plot(x, r);
title('Solusi U(x,t)');
ylabel('(r)');
xlabel('(x)');
