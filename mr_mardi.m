clear;
clc;

%diskritisasi
dx=0.025;
dz=0.1;
dt=0.00001;

N=1/dx;
M=1/dz;
nT=10;


%Parameter dari jurnal
d = 0.2;
l0 = 1;
L = 1.8;
B1 = 4;
B2 = 4;
n = 0.7;

fp = 1.2;
omega_p = 2 * pi * fp;

fb = 1.2;
omega_b = 2 * pi * fb;

P = 0;
sigma = 0.2;
We = 0.5;
bigK = 0.3;

% dari tesis IDA
c = 0.2;
A0 = 32;
A1 = c * A0;
alpha = 2;
e = A1 / A0;
c1 = 2 * pi;
omg_r = fb / fp;
c2 = 2 * pi * omg_r;

m = 1;


w = zeros(nT + 1, N + 1)
%ws = zeros(M+1, N + 1);

for i = 1 : N+1
  x(i) = (i - 1) * dx;
end

for j = 1 : nT
  t(j) = (j - 1) * dt;
end


% koefisien R
delta = 0.2;
etal = 4 * delta;
epsi = 0.2;

for k = 1 : M+1
  z(k) = (k-1) * dz;
  R(k) = (1 + epsi * z(k)) * (1 - 64 / 10 * etal * ((11/32 * (z(k)-sigma))...
    - (47/48 * ((z(k)-sigma) ^ 2))...
    + ((z(k) - sigma)^3) - (1/3 * ((z(k)-sigma) ^4)) ));
end
figure(1);
plot(z, R);

% metode beda hingga
for k = 1 : M + 1
  for j = 1 : nT - 1
    for i = 2 : N
      dw = (w(j, i+1) - w(j,i-1)) / 2 * dx;
      ddw = (w(j, i+1) - 2 * w(j,i) + w(j, i-1)) / dx ^ 2;
      Dxp = abs(w(j,i+1) - w(j,i)) / dx;
      Dxn = abs(w(j,i) - w(j,i-1)) / dx;
      Dx = (1-m) * ((1 + We/R(k) * Dxp) ^ (n-1)) ^ (-1) - (1 + (We/R(k) * Dxn) ^ (n-1)) ^ (-1);
      notationA = 1 + (We / R(k) * abs(dw) ^ (n-1));
      
      varA = B1 * (1 + e * cos(c1 * t(j))) + B2 * (cos(c2 * t(j) + P));
      varB = (1 / (x(i) * R(k)^2)) * (m + (1-m) * notationA ^ (-1)) * dw;
      varC = ddw / (R(k) ^ 2) * (m + (1-m) * notationA ^ (-1));
      varD = (dw / R(k) ^ 2) * (1-m) * (notationA ^ (-2)) * Dx * ((1-m) * notationA);
      varE = w(j,i) / bigK * (m + (1-m) / (1 + (We ^ (n-1)) * (abs(w(j,i)) ^ (n-1)) ));
      varD = 0;
      w(j+1, i) = w(j,i) + dt / alpha * (varA + varB + varC - varD - varE);
   endfor
   % syarat batas
   w(j+1, 1) = w(j+1,2);
   w(j+1, N+1) = 0;
  endfor
endfor

figure(2);
plot(x, w(nT,:))

