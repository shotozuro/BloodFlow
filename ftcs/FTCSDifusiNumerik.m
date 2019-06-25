clc, clear;
format short;

%interval x and t
da = 0.1;
dt = 0.01;

a = 0:da:1;
t = 0:dt:0.1;

na = length(a);
mt = length(t);

% kondisi awal
for i = 1 : na
  if a(i) >= 0 && a(i) < 0.5
    r(i, 1) = 2 * a(i);
  elseif a(i) >= 0.5 && a(i) <= 1
    r(i, 1) = 2 * (1 - a(i));
  end
end

%kondisi batas
r(1,1) = 0;
r(na, 1) = 0;

for j = 1 : mt - 1
  % Asumsi
  A(j) = -dt;
  B(j) = (da ^ 2) + 2 * dt;
  
  % Matriks triagonal
  for i = 1 : na
    J(i, i) = B(j);

  end
  
  for i = 1 : na - 1
    J(i, i+1) = A(j);
  end
  
  for i = 2 : na
    J(i, i-1) = A(j);
  end
  
%   Ruas kanan
  for i = 1 : na
    D(i, j) = (da ^ 2) * r(i,j);
  end
  
  % Nilai u
  r(:, j+1) = inv(J) * D(:, j);
  
  % Kondisi batas
  r(1, j+1) = 0;
  r(na, j+1) = 0;
  
end

r((na + 1) / 2, :);

figure(1);
[X,Y] = meshgrid(0:0.1:1, 0:0.01:0.1)
surf(X,Y,r);
ylabel('(x)');
xlabel('(t)');

figure(2);
plot(a,r)
ylabel('(x)');
xlabel('(t)');