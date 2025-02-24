clear
clc
% close all

K = 32;
tau=39;
cishu=1e4;
rng(1)

load('SeqAllWang_39x64.mat')
load('SeqAllETSC_C_39x64.mat')
load('SeqAllETSC_U_39x64.mat')

bqujian=0:0.2:1;
for kb=1:length(bqujian)
    b=bqujian(kb);
    S1=SeqAll(:,1:K,kb);S2=SeqAll(:,K+1:end,kb);
    Gb=[S1'*S1 sqrt(b)*S1'*S2;sqrt(b)*S2'*S1 S2'*S2];
    ETSC=norm(Gb,'fro')^2
    EWB=2*K^2*(1+b)/(K+b*(tau-K))
    for c=1:cishu
        h11=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h12=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h21=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h22=(randn(K,1)+1i*randn(K,1))/sqrt(2);

        %%
        Y1=S1*h11+sqrt(b)*S2*h12;
        Y1=awgn(Y1,30);
        Y2=S2*h22+sqrt(b)*S1*h21;
        Y2=awgn(Y2,30);

        %%
        h11_hat_LS=(S1)'*Y1;
        h22_hat_LS=(S2)'*Y2;

        MSE(c)=norm(h11-h11_hat_LS,"fro")^2+norm(h22-h22_hat_LS,"fro")^2;
    end
    MSE_b(kb)=mean(MSE)
    MSE_b_theoretical(kb)=ETSC-2*K+2*1e-3
end
plot(bqujian,MSE_b_theoretical)
hold on
plot(bqujian,MSE_b,'s')
grid on