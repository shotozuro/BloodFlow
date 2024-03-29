clear;
clc;

% Initiate variable
[We,K,z,n,B1,B2,delta,sigma] = InitPlottingVar();
[x,t,~,~,~,nT] = InitVariables();

% We=0.5; K=0.3; z=0.48, n=0.7; delta=0.2; B1=4; B2=[4,2,0];
[w1] = FDMSteno(We,K,z,n,delta,sigma,B1,0);
[w2] = FDMSteno(We,K,z,n,delta,sigma,B1,2);
[w3] = FDMSteno(We,K,z,n,delta,sigma,B1,4);

figure('Name','Grafik Kecepatan terhadap Radius');
figure(1);
hold on;

plot(x,w1(nT,:),'-','LineWidth',1,'Color','#0072BD');
plot(x,w2(nT,:),'--','LineWidth',1,'Color','#77AC30');
plot(x,w3(nT,:),'-.','LineWidth',1,'Color','#A2142F');

xlabel('Radius Tak Berdimensi');
ylabel('Kecepatan Tak Berdimensi')
legend('B_{2} = 0','B_{2} = 2', 'B_{2} = 4');

% We=0.5; K=0.3; z=0.48, n=0.7; delta=[0,0.2,0.4]; B1=4; B2=[4,2,0];
[w1] = FDMSteno(We,K,z,n,0,sigma,B1,B2);
[w2] = FDMSteno(We,K,z,n,0.2,sigma,B1,B2);
[w3] = FDMSteno(We,K,z,n,0.4,sigma,B1,B2);

figure('Name','Grafik Kecepatan terhadap Radius');
hold on;

plot(x,w1(nT,:),'-','LineWidth',1,'Color','#0072BD');
plot(x,w2(nT,:),'--','LineWidth',1,'Color','#77AC30');
plot(x,w3(nT,:),'-.','LineWidth',1,'Color','#A2142F');

xlabel('Radius Tak Berdimensi');
ylabel('Kecepatan Tak Berdimensi')
legend('\delta = 0','\delta = 0.2', '\delta = 0.4');

% We=[2.5,1.5,0.5]; K=0.3; z=0.48, n=0.7; delta=0.3; sigma=0.5; B1=4; B2=[4,2,0];
[w1] = FDMSteno(0.5,K,z,n,0.3,0.5,B1,B2);
[w2] = FDMSteno(1.5,K,z,n,0.3,0.5,B1,B2);
[w3] = FDMSteno(2.5,K,z,n,0.3,0.5,B1,B2);

figure('Name','Grafik Kecepatan terhadap Radius');
hold on;

plot(x,w1(nT,:),'-','LineWidth',1,'Color','#0072BD');
plot(x,w2(nT,:),'--','LineWidth',1,'Color','#77AC30');
plot(x,w3(nT,:),'-.','LineWidth',1,'Color','#A2142F');

xlabel('Radius Tak Berdimensi');
ylabel('Kecepatan Tak Berdimensi')
legend('We = 0.5','We = 1.5', 'We = 2.5');

% We=0.5; K=[0.1,0.3,0.8]; z=0.48, n=0.8; delta=0.2; B1=4; B2=4;
[w1] = FDMSteno(We,0.1,z,0.8,delta,sigma,B1,B2);
[w2] = FDMSteno(We,0.3,z,0.8,delta,sigma,B1,B2);
[w3] = FDMSteno(We,0.5,z,0.8,delta,sigma,B1,B2);

figure('Name','Grafik Kecepatan terhadap Radius');
hold on;

plot(x,w1(nT,:),'-','LineWidth',1,'Color','#0072BD');
plot(x,w2(nT,:),'--','LineWidth',1,'Color','#77AC30');
plot(x,w3(nT,:),'-.','LineWidth',1,'Color','#A2142F');

xlabel('Radius Tak Berdimensi');
ylabel('Kecepatan Tak Berdimensi')
legend('k = 0.1','k = 0.3', 'k = 0.8');

