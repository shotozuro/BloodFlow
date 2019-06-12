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

for i = 1 : N+1
  x(i) = (i - 1) * dx;  
end

for j = 1 : nT
  t(j) = (j - 1) * dt;
end

N = 4;
nt = 5;
w = zeros(N+1, nt)
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
      w(i, j-1) = i * j
##      w(i,j-1) = w(i,j) + dt / alpha * (B1 * (1 + e * cos(c1 * t(j))) + B2 * (cos(c2 * t(j) + P)) )
     end
   endfor
endfor

display(w)