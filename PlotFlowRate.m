% FLOW RATE
clear;
clc;

% default value
We = 0.5;
K = 0.3;
z = 0.52;
n = 0.7;
B1 = 4;
B2 = 4;
delta = 0.2;
sigma = 0.2;
[~,t] = InitVariables();

% FIG. 7
% We=0.5; K=0.8; z=0.52, n=0.7; delta=[0,0.2,0.4]; B1=4; B2=4;
[~,fr1] = FDMStenoEdit(We,0.8,z,n,0.0,sigma,B1,B2);
[~,fr2] = FDMStenoEdit(We,0.8,z,n,0.2,sigma,B1,B2);
[~,fr3] = FDMStenoEdit(We,0.8,z,n,0.4,sigma,B1,B2);

figure('Name','Grafik Laju Aliran Terhadap Waktu');
hold on;
plot(t,fr1,'-','LineWidth',1,'Color',[1 0 0]);
plot(t,fr2,'-','LineWidth',1,'Color',[0 1 0]);
plot(t,fr3,'-','LineWidth',1,'Color',[0 0 1]);

xlabel('Waktu Tak Berdimensi');
ylabel('Laju Aliran Tak Berdimensi');
legend('\delta = 0.0','\delta = 0.2', '\delta = 0.4');

% FIG. 8
% We=1; K=[0.1,0.3,0.8]; z=0.52, n=0.3; delta=0.2; B1=4; B2=4;
[~,fr1] = FDMStenoEdit(1,0.1,z,0.3,delta,sigma,B1,B2);
[~,fr2] = FDMStenoEdit(1,0.3,z,0.3,delta,sigma,B1,B2);
[~,fr3] = FDMStenoEdit(1,0.8,z,0.3,delta,sigma,B1,B2);

figure('Name','Grafik Laju Aliran Terhadap Waktu');
hold on;
plot(t,fr1,'-','LineWidth',1,'Color',[1 0 0]);
plot(t,fr2,'-','LineWidth',1,'Color',[0 1 0]);
plot(t,fr3,'-','LineWidth',1,'Color',[0 0 1]);

xlabel('Waktu Tak Berdimensi');
ylabel('Laju Aliran Tak Berdimensi');
legend('k = 0.1','k = 0.3', 'k = 0.8');

% FIG. 9
% We=0.5; K=0.367; z=0.52, n=0.7; delta=0.2; B1=4; B2=[4,2,0];
[~,fr1] = FDMStenoEdit(We,0.367,z,n,delta,sigma,B1,4);
[~,fr2] = FDMStenoEdit(We,0.367,z,n,delta,sigma,B1,2);
[~,fr3] = FDMStenoEdit(We,0.367,z,n,delta,sigma,B1,0);

figure('Name','Grafik Laju Aliran Terhadap Waktu');
hold on;
plot(t,fr1,'-','LineWidth',1,'Color',[1 0 0]);
plot(t,fr2,'-','LineWidth',1,'Color',[0 1 0]);
plot(t,fr3,'-','LineWidth',1,'Color',[0 0 1]);

xlabel('Waktu Tak Berdimensi');
ylabel('Laju Aliran Tak Berdimensi');
legend('B_{2} = 4','B_{2} = 2', 'B_{2} = 0');

% FIG. 10
% We=[1.5,0.5,0.1]; K=0.8; z=0.52, n=0.7; delta=0.2; B1=4; B2=4;
[~,fr1] = FDMStenoEdit(1.5,0.8,z,n,delta,sigma,B1,B2);
[~,fr2] = FDMStenoEdit(0.5,0.8,z,n,delta,sigma,B1,B2);
[~,fr3] = FDMStenoEdit(0.1,0.8,z,n,delta,sigma,B1,B2);

figure('Name','Grafik Laju Aliran Terhadap Waktu');
hold on;
plot(t,fr1,'-','LineWidth',1,'Color',[1 0 0]);
plot(t,fr2,'-','LineWidth',1,'Color',[0 1 0]);
plot(t,fr3,'-','LineWidth',1,'Color',[0 0 1]);

xlabel('Waktu Tak Berdimensi');
ylabel('Laju Aliran Tak Berdimensi');
legend('We = 1.5','We = 0.5', 'We = 0.1');
