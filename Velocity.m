function [w,ws] = Velocity(We,K,R,n,B1,B2)
    [x,t,dx,dt,N,nT,e,c1,c2,alpha,m,~,P] = InitVariables();

    nZ = length(R);
    w=zeros(nT+1,N+1);
    ws = zeros(nZ, N+1);
    for k=1 : nZ
        for j=1 : nT
            varA = B1.*(1+e.*cos(c1.*t(j)));
            varB = B2.*(cos(c2.*t(j)+P));
            for i=2 : N
                dw=(w(j,i+1)-w(j,i-1))./(2.*dx);
                Dxp=abs(w(j,i+1)-w(j,i))./dx;
                Dxn=abs(w(j,i)-w(j,i-1))./dx;
                Dx=(1-m).*((1+((We./R(k)).*Dxp).^(n-1)).^(-1)-(1+((We./R(k)).*Dxn).^(n-1)).^(-1)).*(1./dx);
                ddw=(w(j,i+1)-2.*w(j,i)+w(j,i-1))./(dx.*dx);

                varC = 1./(x(i).*(R(k).^2)).*(m+(1-m).*(1+((We./R(k)).*abs(dw)).^(n-1)).^(-1)).*dw;
                varD = (ddw ./(R(k).*R(k))).*(m+(1-m).*(1+((We./R(k)).*abs(dw)).^(n-1)).^(-1));
                varE = (1./R(k).^(n+1)).*dw.*(1-m).*(1+((We./R(k)).*abs(dw)).^(n-1)).^(-2).*Dx;
                varF = (w(j,i)./K).*(m+(1-m)./(1+We.^(n-1).*abs(w(j,i)).^(n-1)));

                w(j+1,i)=w(j,i)+dt./alpha.*(varA + varB + varC + varD - varE - varF);

            end
            w(j+1,1)=w(j+1,2);
            w(j+1,N+1)=0;
        end
        ws(k,:) = w(nT,:);
    end
end
