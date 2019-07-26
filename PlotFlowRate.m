clear;
clc;

% Initiate variable
[We,K,z,n,B1,B2,delta,sigma] = InitPlottingVar();
[~,t] = InitVariables();

% We=0.5; K=0.8; z=0.52, n=0.7; delta=[0,0.2,0.4]; B1=4; B2=4;
[~,fr1] = FDMSteno(We,0.8,z,n,0.0,sigma,B1,B2);
[~,fr2] = FDMSteno(We,0.8,z,n,0.2,sigma,B1,B2);
[~,fr3] = FDMSteno(We,0.8,z,n,0.4,sigma,B1,B2);

figure('Name','Grafik Laju Aliran Terhadap Waktu');
hold on;
plot(t,fr1,'-','LineWidth',1,'Color','#0072BD');
plot(t,fr2,'--','LineWidth',1,'Color','#77AC30');
plot(t,fr3,'-.','LineWidth',1,'Color','#A2142F');

xlabel('Waktu Tak Berdimensi');
ylabel('Laju Aliran Tak Berdimensi');
legend('\delta = 0.0','\delta = 0.2', '\delta = 0.4');

% We=1; K=[0.1,0.3,0.8]; z=0.52, n=0.3; delta=0.2; B1=4; B2=4;
[~,fr1] = FDMSteno(1,0.1,z,0.3,delta,sigma,B1,B2);
[~,fr2] = FDMSteno(1,0.3,z,0.3,delta,sigma,B1,B2);
[~,fr3] = FDMSteno(1,0.8,z,0.3,delta,sigma,B1,B2);

figure('Name','Grafik Laju Aliran Terhadap Waktu');
hold on;
plot(t,fr1,'-','LineWidth',1,'Color','#0072BD');
plot(t,fr2,'--','LineWidth',1,'Color','#77AC30');
plot(t,fr3,'-.','LineWidth',1,'Color','#A2142F');

xlabel('Waktu Tak Berdimensi');
ylabel('Laju Aliran Tak Berdimensi');
legend('k = 0.1','k = 0.3', 'k = 0.8');

% We=0.5; K=0.3; z=0.52, n=0.7; delta=0.2; B1=4; B2=[4,2,0];
[~,fr1] = FDMSteno(We,0.3,z,n,delta,sigma,B1,0);
[~,fr2] = FDMSteno(We,0.3,z,n,delta,sigma,B1,2);
[~,fr3] = FDMSteno(We,0.3,z,n,delta,sigma,B1,4);

figure('Name','Grafik Laju Aliran Terhadap Waktu');
hold on;
plot(t,fr1,'-','LineWidth',1,'Color','#0072BD');
plot(t,fr2,'--','LineWidth',1,'Color','#77AC30');
plot(t,fr3,'-.','LineWidth',1,'Color','#A2142F');

xlabel('Waktu Tak Berdimensi');
ylabel('Laju Aliran Tak Berdimensi');
legend('B_{2} = 0','B_{2} = 2', 'B_{2} = 4');


% We=[1.5,0.5,0.1]; K=0.8; z=0.52, n=0.7; delta=0.2; B1=4; B2=4;
[~,fr1] = FDMSteno(0.1,0.8,z,n,delta,sigma,B1,B2);
[~,fr2] = FDMSteno(0.5,0.8,z,n,delta,sigma,B1,B2);
[~,fr3] = FDMSteno(1.5,0.8,z,n,delta,sigma,B1,B2);

figure('Name','Grafik Laju Aliran Terhadap Waktu');
hold on;
plot(t,fr1,'-','LineWidth',1,'Color','#0072BD');
plot(t,fr2,'--','LineWidth',1,'Color','#77AC30');
plot(t,fr3,'-.','LineWidth',1,'Color','#A2142F');

xlabel('Waktu Tak Berdimensi');
ylabel('Laju Aliran Tak Berdimensi');
legend('We = 0.1','We = 0.5', 'We = 1.5');
