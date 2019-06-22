function [R] = ArterialGeometry(z, delta, sigma)
    eta1 = 4*delta;
    epsi = 0.2;

    R = (1+epsi*z)*(1-64/10*eta1*(11/32*(z-sigma)-47/48*(z-sigma)^2+...
        (z-sigma)^3-1/3*(z-sigma)^4));
end