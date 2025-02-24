clear
clc
close all


L=10e5;
load('ETSC_C_39x96.mat')
semilogy(1:L,ISL(1:L),'LineWidth',1.5)
hold on

load('ETSC_U_39x96.mat')
semilogy(1:L,ISL(1:L),'LineWidth',1.5)

load('ETSC_C_39x128.mat')
semilogy(1:L,ISL(1:L),'LineWidth',1.5)

load('ETSC_U_39x128.mat')
semilogy(1:L,ISL(1:L),'LineWidth',1.5)


legend("J=3, non-unimodular","J=3, unimodular","J=4, non-unimodular","J=4, unimodular")
grid on
xlabel('iteration')
ylabel('ETSC')






figure
load('ETSC_C_39x96.mat')
loglog(1:L,ISL(1:L),'LineWidth',1.5)
hold on

load('ETSC_U_39x96.mat')
loglog(1:L,ISL(1:L),'LineWidth',1.5)

load('ETSC_C_39x128.mat')
loglog(1:L,ISL(1:L),'LineWidth',1.5)

load('ETSC_U_39x128.mat')
loglog(1:L,ISL(1:L),'LineWidth',1.5)


legend("J=3, non-unimodular","J=3, unimodular","J=4, non-unimodular","J=4, unimodular")
grid on
xlabel('iteration')
ylabel('ETSC')