clear
clc
close all

N=39;
K=32;

load('ETSC_U_39x64_0_0.mat')
semilogy(1:2e4,ISL,'LineWidth',1.5)
hold on

load('ETSC_U_39x64_0_2.mat')
semilogy(1:2e4,ISL,'LineWidth',1.5)

load('ETSC_U_39x64_0_4.mat')
semilogy(1:2e4,ISL,'LineWidth',1.5)

load('ETSC_U_39x64_0_6.mat')
semilogy(1:2e4,ISL,'LineWidth',1.5)

load('ETSC_U_39x64_0_8.mat')
semilogy(1:2e4,ISL,'LineWidth',1.5)

load('ETSC_U_39x64_1_0.mat')
semilogy(1:2e4,ISL,'LineWidth',1.5)


b=0;
jie=2*K^2*(1+b)/(K+b*(N-K));
plot([1 2e4],[jie jie],'LineStyle','--','Color',"#0072BD")

b=0.2;
jie=2*K^2*(1+b)/(K+b*(N-K));
plot([1 2e4],[jie jie],'LineStyle','--','Color',"#D95319")

b=0.4;
jie=2*K^2*(1+b)/(K+b*(N-K));
plot([1 2e4],[jie jie],'LineStyle','--','Color',"#EDB120")

b=0.6;
jie=2*K^2*(1+b)/(K+b*(N-K));
plot([1 2e4],[jie jie],'LineStyle','--','Color',"#7E2F8E")

b=0.8;
jie=2*K^2*(1+b)/(K+b*(N-K));
plot([1 2e4],[jie jie],'LineStyle','--','Color',"#77AC30")

b=1;
jie=2*K^2*(1+b)/(K+b*(N-K));
plot([1 2e4],[jie jie],'LineStyle','--','Color',"#4DBEEE")


legend("\beta=0","\beta=0.2","\beta=0.4","\beta=0.6","\beta=0.8","\beta=1")
grid on
xlabel('iteration')
ylabel('ETSC')

