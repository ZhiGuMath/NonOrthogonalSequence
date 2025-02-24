clear
clc
close all

load('SimDataWang_39x64.mat')
plot(bqujian,MSE_b_theoretical,'LineWidth',1.5,'Color',"#0072BD")
hold on
plot(bqujian,MSE_b,"LineStyle","none","Marker","s",'LineWidth',1.5,'Color',"#0072BD")

load('SimDataETSC_C_39x64.mat')
plot(bqujian,MSE_b_theoretical,'LineWidth',1.5,'Color',"#D95319")
plot(bqujian,MSE_b,"LineStyle","none","Marker","+",'LineWidth',1.5,'Color',"#D95319")

load('SimDataETSC_U_39x64.mat')
plot(bqujian,MSE_b_theoretical,'LineWidth',1.5,'Color',"#EDB120")
plot(bqujian,MSE_b,"LineStyle","none","Marker","o",'LineWidth',1.5,'Color',"#EDB120")

led=legend("Ref [10], theoretical value","Ref [10], Monte Carlo",...
    "ETSC-MM for non-unimodular, theoretical value","ETSC-MM for non-unimodular, Monte Carlo",..." + ...
    "ETSC-MM for unimodular, theoretical value","ETSC-MM for unimodular, Monte Carlo");

led.Position=[0.133928571428571 0.678571428571429 0.5464 0.2440]

grid on
xlabel('\beta')
ylabel('Sum MSE for LS Estimation')