function [w,fRate,shearStress,resistance] = FDMSteno(We,K,z,n,delta,sigma,B1,B2)

[~,t,dx,~,N,~,e,c1,~,~,m,L] = InitVariables();

R = ArterialGeometry(z, delta, sigma);

%Velocity
[w] = Velocity(We,K,R,n,B1,B2);

%Flow Rate
fRate = FlowRate(w(:,21), R);

%Shear Stress
dw2=(w(:,N+1)-w(:,N))./ dx;
shearStress = ShearStress(We,R,dw2,m,n);

%Resistance to Flow
dp = (B1.*(1+e.*cos(c1.*t'))) .* -1;
resistance = ResistanceToFlow(L,dp,fRate);
end