%diskritisasi
dx=0.025;
dz=0.1;
dt=0.00001;

N=1/dx;
M=1/dz;
nT=5;


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

% karangan
c = 0.2;
A0=32;
A1=c*A0;
alpha=2;
e=A1/A0;
c1=2*pi;
omg_r=fb/fp;
c2=2*pi*omg_r;

m = 0.5;
We = 0.5;

for i = 1 : N+1
  x(i) = (i - 1) * dx;  
end

for j = 1 : nT
  t(j) = (j - 1) * dt;
end

N = 4;
nt = 5;
w = zeros(N+1, nt)

% koefisien R
delta = 0.2;
etal = 4 * delta;
epsi = 0.2;
z = 0.52;

R = (1 + epsi * z) * (1 - 64 / 10 * etal * ((11/32 * (z-sigma)) - (47/48 * ((z-sigma) ^ 2)) + ((z - sigma)^3) - (1/3 * ((z-sigma) ^4)) ))

for i = 1 : N+1
  for j = 1 : nT
    if t(j) == 0
      w(i,1) = 0;
     elseif x(i) == 1
      w((N+1),j) = 0; 
     elseif x(i) == 0
      printf("masuk 3");
      w(1,j) = w(2,j)
     else
      dw = (w(i+1, j) - w(i-1,j)) / 2 * dx;
      ddw = (w(i+1,j) - 2 * w(i,j) + w(i-1, j)) / dx ^ 2;
      Dxp = abs(w(i+1,j) - w(i,j)) / dx;
      Dxn = abs(w(i,j) - w(i-1,j)) / dx;
      Dx = (1-m) * ((1 + We/R * Dxp) ^ (n-1)) ^ (-1) - (1 + (We/R * Dxn) ^ (n-1)) ^ (-1);
      
      w(i,j-1) = w(i,j) + (dt / alpha * (B1 * (1 + e * cos(c1 * t(j))) + B2 * (cos(c2 * t(j) + P)) ))...
        + (1 / (x(i) * R^2) * (m + ((1-m) * (1 + (We / R * abs(dw)) ^ (n-1) ) ^ (-1)) ) * dw...
        + (ddw / (R ^ 2) * (m + 1))...
        - 1/4 ...
        * Dx ...
        - (w(i,j))
     end
     
     w(1, j+1) = w(2, j+1);
     w(N+1, j+1) = 0;
   endfor
endfor

display(w)