function R = ArterialGeometry(z, delta, sigma)
    eta1 = 4*delta;
    a = 1;

    function geometry = getGeometry(z)
        if (sigma <= z) && (z <= sigma + 3/2)
            geometry = a.*(1-64/10.*eta1.*(11/32.*(z-sigma)-47/48.*(z-sigma).^2+...
                (z-sigma).^3-1/3.*(z-sigma).^4));
        else
            geometry = a;
        end
    end

    R = arrayfun(@getGeometry,z);
end