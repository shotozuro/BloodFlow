%Hasil 1/4 segiempat
[X,Z]=meshgrid(x,z);
ZZ=[Z;1+Z];
%Hasil 1/2 sdh ditransformasi
r=zeros(size([X;X]));
for k=1:M+1
    r(k,:)=R(k)*X(k,:);
    r(2*M+3-k,:)=r(k,:);
    wws(k,:)=ws(k,:);
    wws(2*M+3-k,:)=ws(k,:);
end
figure(1)
surf(r,ZZ,wws)
pause(1)
%[U,V] = gradient(ws,0.2,0.2);
%quiver(r,Z,U,V)
figure(2)

contour(r,ZZ,wws,20)
pause(1)

%Hasil utuh
figure(4)
w4s=[fliplr(wws) wws];
r4=[-fliplr(r) r];
Z4=[ZZ ZZ];
contour(r4,Z4,w4s,20)