clear
clc
close all



load('ETSC_C_39x64_0_0.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5)
hold on

load('ETSC_C_39x64_0_2.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5)

load('ETSC_C_39x64_0_4.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5)

load('ETSC_C_39x64_0_6.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5)

load('ETSC_C_39x64_0_8.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5)

load('ETSC_C_39x64_1_0.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5)

load('Wang_39x64_0_0.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5,'LineStyle','--','Color',"#0072BD")

load('Wang_39x64_0_2.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5,'LineStyle','--','Color',"#D95319")

load('Wang_39x64_0_4.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5,'LineStyle','--','Color',"#EDB120")

load('Wang_39x64_0_6.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5,'LineStyle','--','Color',"#7E2F8E")

load('Wang_39x64_0_8.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5,'LineStyle','--','Color',"#77AC30")

load('Wang_39x64_1_0.mat')
p=10*log10(max(abs(A)).^2*size(A,1));
[f,x] = ecdf(p);
plot(x,1-f,'LineWidth',1.5,'LineStyle','--','Color',"#4DBEEE")



grid on
xlabel('x:PAPR(dB)')
ylabel('P(X>x)')

lgd = legend({"\beta=0","\beta=0.2","\beta=0.4","\beta=0.6","\beta=0.8","\beta=1","\beta=0","\beta=0.2","\beta=0.4","\beta=0.6","\beta=0.8","\beta=1"},...
    'Location','northwest','NumColumns',2);
title(lgd,'ETSC-MM         Ref [10]    ')