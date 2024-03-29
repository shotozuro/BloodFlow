clear;
clc;

% Initiate variable
[~,~,z,n,B1,~,delta,sigma] = InitPlottingVar();
[~,t] = InitVariables();

% We=0.1; K=[0.1,0.3,0.8]; z=0.48, n=0.7; delta=0.2; B1=4; B2=0;
[~,fr1,~,res1] = FDMSteno(0.1,0.1,z,n,delta,sigma,B1,0);
[~,fr2,~,res2] = FDMSteno(0.1,0.3,z,n,delta,sigma,B1,0);
[~,fr3,~,res3] = FDMSteno(0.1,0.8,z,n,delta,sigma,B1,0);

figure('Name','Grafik Resistensi untuk Mengalir Terhadap Waktu');
hold on;
plot(t(10000:end),res1(10000:end),'-','LineWidth',1,'Color','#0072BD');
plot(t(10000:end),res2(10000:end),'--','LineWidth',1,'Color','#77AC30');
plot(t(10000:end),res3(10000:end),'-.','LineWidth',1,'Color','#A2142F');

xlabel('Waktu Tak Berdimensi');
ylabel('Resistensi untuk Mengalir Tak Berdimensi');
legend('k = 0.1','k = 0.3', 'k = 0.8');
