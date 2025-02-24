clear
clc
close all

load('SimDataRandom_39x96.mat')
plot(snr_qujian,MSE_b_theoretical,'LineWidth',1.5,'Color',"#0072BD")
hold on
plot(snr_qujian,MSE_b,"LineStyle","none","Marker","s",'LineWidth',1.5,'Color',"#0072BD")

load('SimDataWBE_39x96.mat')
plot(snr_qujian,MSE_b_theoretical,'LineWidth',1.5,'Color',"#D95319")
plot(snr_qujian,MSE_b,"LineStyle","none","Marker","+",'LineWidth',1.5,'Color',"#D95319")

load('SimDataETSC_C_39x96.mat')
plot(snr_qujian,MSE_b_theoretical,'LineWidth',1.5,'Color',"#EDB120")
plot(snr_qujian,MSE_b,"LineStyle","none","Marker","o",'LineWidth',1.5,'Color',"#EDB120")

load('SimDataETSC_U_39x96.mat')
plot(snr_qujian,MSE_b_theoretical,'LineWidth',1.5,'Color',"#7E2F8E")
plot(snr_qujian,MSE_b,"LineStyle","none","Marker",".",'LineWidth',1.5,'Color',"#7E2F8E")

led=legend("Random sequence set, theoretical value","Random sequence set, Monte Carlo",...
    "WBE sequence set, theoretical value","WBE sequence set, Monte Carlo",...
    "ETSC-MM for non-unimodular, theoretical value","ETSC-MM for non-unimodular, Monte Carlo",..." + ...
    "ETSC-MM for unimodular, theoretical value","ETSC-MM for unimodular, Monte Carlo");



grid on
xlabel('SNR(dB)')
ylabel('Sum MSE for LS Estimation')