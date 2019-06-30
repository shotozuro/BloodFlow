% SHEAR STRESS
clear;
clc;

% initiate variable
[We,K,z,n,B1,B2,delta,sigma] = InitPlottingVar();
[~,t] = InitVariables();

% FIG. 11
% We=[0.1,0.3,0.8]; K=0.3; z=0.52, n=0.7; delta=0.2; B1=4; B2=4;
[~,~,ss1] = FDMSteno(0.1,K,z,n,delta,sigma,B1,B2);
[~,~,ss2] = FDMSteno(0.3,K,z,n,delta,sigma,B1,B2);
[~,~,ss3] = FDMSteno(0.8,K,z,n,delta,sigma,B1,B2);

figure('Name','Grafik Tegangan Geser pada Dinding Terhadap Waktu');
hold on;
plot(t,ss1,'-','LineWidth',1,'Color','#0072BD');
plot(t,ss2,'--','LineWidth',1,'Color','#77AC30');
plot(t,ss3,'-.','LineWidth',1,'Color','#A2142F');

xlabel('Waktu Tak Berdimensi');
ylabel('Tegangan Geser pada Dinding Tak Berdimensi');
legend('We = 0.1','We = 0.3', 'We = 0.8');

% FIG. 12
% We=0.5; K=[0.1,0.3,0.8]; z=0.52, n=0.7; delta=0.2; B1=4; B2=4;
[~,~,ss1] = FDMSteno(We,0.1,z,n,delta,sigma,B1,B2);
[~,~,ss2] = FDMSteno(We,0.3,z,n,delta,sigma,B1,B2);
[~,~,ss3] = FDMSteno(We,0.8,z,n,delta,sigma,B1,B2);

figure('Name','Grafik Tegangan Geser pada Dinding Terhadap Waktu');
hold on;
plot(t,ss1,'-','LineWidth',1,'Color','#0072BD');
plot(t,ss2,'--','LineWidth',1,'Color','#77AC30');
plot(t,ss3,'-.','LineWidth',1,'Color','#A2142F');

xlabel('Waktu Tak Berdimensi');
ylabel('Tegangan Geser pada Dinding Tak Berdimensi');
legend('k = 0.1','k = 0.3', 'k = 0.8');
