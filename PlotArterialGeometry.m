clear; clc;

[x,~,~,~,N,~,~,~,~,~,~,L,~] = InitVariables();
[~,~,~,~,~,~,delta,sigma] = InitPlottingVar();

dz = 0.1;
z = 0:dz:L;

R = ArterialGeometry(z, delta, sigma);
r = x' .* R;

zzz = [z fliplr(z)];
rrr = [R -fliplr(R)];

figure(1);
plot(z,R);

xlabel('z');
ylabel('r');

figure(2);
plot(zzz,rrr);
xlabel('z');
ylabel('r');
