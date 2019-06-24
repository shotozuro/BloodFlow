function [x,t,dx,dt,N,nT,e,c1,c2,alpha,m,L,P] = InitVariables()
    %Atur diskritisasi
    dx = 0.025;
    dt = 0.00001;

    N = 1/dx;
    nT = 600000;

    %Parameter dari jurnal
    c = 0.2;
    L = 1.8;
    fp = 1.2;
    fb = 1.2;
    P = 0;

    %Parameter dari jurnal lain yang berkaitan
    A0 = 32;
    A1 = c*A0;
    alpha = 2;
    e = A1/A0;
    c1 = 2*pi;
    omg_r = fb/fp;
    c2 = 2*pi*omg_r;

    m = 0.0616;

    t  =  0:dt:nT*dt;
    x  =  0:dx:N*dx;
end