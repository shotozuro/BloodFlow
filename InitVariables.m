function [x,t,dx,dt,N,nT,e,c1,c2,alpha,m,L,P] = InitVariables()
    dx = 0.025;
    dt = 0.00001;

    N = 1/dx;
    nT = 600000;
    
    c = 0.2;
    L = 1.8;
    fp = 1.2;
    fb = 1.2;
    omega_p = 2*pi*fp;
    omega_b = 2*pi*fb;
    P = 0;
    omega = 1.2;

    A0 = 32;
    A1 = c*A0;
    alpha = 2;
    e = A1/A0;
    c1 = omega_p / omega;
    c2 = omega_b / omega;

    m = 0.0616;

    t  =  0:dt:nT*dt;
    x  =  0:dx:N*dx;
end