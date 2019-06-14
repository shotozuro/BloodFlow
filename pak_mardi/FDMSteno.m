function [x,w,ws]=FDMSteno(We,delta,B1,B2,n)

%Atur diskritisasi

dx=0.025;
dz=0.1;
dt=0.00001;

N=1/dx;
M=1/dz;
nT=50000;

%Parameter dari jurnal
c=0.2;
d=0.2;
lo=1;
L=1.8;
%B1=4;
%B2=4;
%n=0.7;
fp=1.2;
omegap=2*pi*fp;
fb=1.2;
omegab=2*pi*fb;
P=0;
sigma=0.2;
%We=0.5;
%Parameter masih ngarang, beberapa ngikuti punya Ida Wahidah
A0=32;
A1=c*A0;
alpha=2;
e=A1/A0;
c1=2*pi;
omg_r=fb/fp;
c2=2*pi*omg_r;

m=1;

w=zeros(nT+1,N+1);
ws=zeros(M+1,N+1);
for j=1:nT
    t(j)=(j-1)*dt;
end
for i=1:N+1
    x(i)=(i-1)*dx;
end

%koefisien R

%delta=0.2;
eta1=4*delta;
epsi=0.2;

for k=1:M+1
    z(k)=(k-1)*dz;
    R(k)=(1+epsi*z(k))*(1-64/10*eta1*(11/32*(z(k)-sigma)-47/48*(z(k)-sigma)^2+...
        (z(k)-sigma)^3-1/3*(z(k)-sigma)^4));
end
%Gambar geometri steno artery
plot(z,R)
pause(1)


%Metode beda hingga
%diskritisasi ruang variabel z
for k=1:M+1
    %diskritisasi ruang variabel r dan waktu
    for j=1:nT;
        %FTCS     
        for i=2:N
            dw=(w(j,i+1)-w(j,i-1))/(2*dx);
            Dxp=abs(w(j,i+1)-w(j,i))/dx;
            Dxn=abs(w(j,i)-w(j,i-1))/dx;
            Dx=(1-m)*((1+(We/R(k)*Dxp)^(n-1))^(-1)-(1+(We/R(k)*Dxn)^(n-1))^(-1));
            ddw=(w(j,i+1)-2*w(j,i)+w(j,i-1))/(dx*dx);
            w(j+1,i)=w(j,i)+dt/alpha*(B1*(1+e*cos(c1*t(j)))+B2*(cos(c2*t(j)+P))...
                +1/(x(i)*R(k)*R(k))*(m+(1-m)*(1+(We/R(k)*abs(dw))^(n-1))^(-1))*dw...
                +ddw/(R(k)*R(k))*(m+(1-m)*(1+(We/R(k)*abs(dw))^(n-1))^(-1))...
                -1/R(k)^(n+1)*dw*(1-m)*(1+(We/R(k)*abs(dw))^(n-1))^(-2)*Dx...
                -w(j,i)/k*(m+(1-m)/(1+We^(n-1)*abs(w(j,i))^(n-1))));
        end
        %syarat batas
        w(j+1,1)=w(j+1,2);
        w(j+1,N+1)=0;
    end
    ws(k,:)=w(nT,:);
end



