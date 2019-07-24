function R = ArterialGeometry(z, delta, sigma)
    eta1 = 4*delta;
    epsi = 0;

    function geometry = getGeometry(z)
        if (sigma <= z) && (z <= sigma + 3/2)
            geometry = (1+epsi.*z).*(1-64/10.*eta1.*(11/32.*(z-sigma)-47/48.*(z-sigma).^2+...
                (z-sigma).^3-1/3.*(z-sigma).^4));
        else
            geometry = (1+epsi.*z);
        end
    end

    R = arrayfun(@getGeometry,z);
end