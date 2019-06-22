function shearStress = ShearStress(We,R,dw,m,n)
    shearStress = 1./R .* (m + (1-m).*(1+(We./R .* abs(dw)).^(n-1)) .^(-1) ) .* abs(dw);
end