function [w,fRate,shearStress,resistance] = FDMSteno(We,K,z,n,delta,sigma,B1,B2)

% Inisiasi Variable
[x,t,dx,dt,N,nT,e,c1,c2,alpha,m,L,P] = InitVariables();

% Koefisien R
R = ArterialGeometry(z, delta, sigma);

% Menentukan velocity (w)
w=zeros(nT+1,N+1);
for j=1 : nT
    %FTCS
    varA = B1*(1+e*cos(c1*t(j)));
    varB = B2*(cos(c2*t(j)+P));
    for i=2 : N
        dw=(w(j,i+1)-w(j,i-1))/(2*dx);
        Dxp=abs(w(j,i+1)-w(j,i))/dx;
        Dxn=abs(w(j,i)-w(j,i-1))/dx;
        Dx=(1-m)*((1+((We/R)*Dxp)^(n-1))^(-1)-(1+((We/R)*Dxn)^(n-1))^(-1))*(1/dx);
%         Dx=(1-m)*(We/R)*((Dxp-Dxn)/dx);
        ddw=(w(j,i+1)-2*w(j,i)+w(j,i-1))/(dx*dx);

        varC = 1/(x(i)*(R^2))*(m+(1-m)*(1+((We/R)*abs(dw))^(n-1))^(-1))*dw;
        varD = (ddw /(R*R))*(m+(1-m)*(1+((We/R)*abs(dw))^(n-1))^(-1));
        varE = (1/R^(n+1))*dw*(1-m)*(1+((We/R)*abs(dw))^(n-1))^(-2)*Dx;
        varF = (w(j,i)/K)*(m+(1-m)/(1+We^(n-1)*abs(w(j,i))^(n-1)));

        w(j+1,i)=w(j,i)+dt/alpha*(varA + varB + varC + varD - varE - varF);
              
    end

    %syarat batas
    w(j+1,1)=w(j+1,2);
    w(j+1,N+1)=0;
end


%Flow Rate
fRate = FlowRate(w(:,N), R);

%Shear Stress
dw2=(w(:,N+1)-w(:,N))./ dx;
shearStress = ShearStress(We,R,dw2,m,n);

%Resistance to Flow
dp = (B1.*(1+e.*cos(c1.*t'))) .* -1;
resistance = ResistanceToFlow(L,dp,fRate);
end