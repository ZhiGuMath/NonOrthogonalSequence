clear
clc
close all

L=10e5;
load('ETSC_C_39x96_yuan.mat')
loglog(1:L,ISL(1:L),'LineWidth',1.5)
hold on

load('ETSC_C_39x96.mat')
loglog(1:L,ISL(1:L),'LineWidth',1.5)


legend("Original scheme","Accelerated scheme")
grid on
xlabel('iteration')
ylabel('ETSC')