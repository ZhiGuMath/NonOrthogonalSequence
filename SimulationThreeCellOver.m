% This is simulation code which consider the single-antenna
% 20240826
clear
clc
% close all

K = 42;
tau=39;
cishu=1e4;
rng(1)

load('ETSC_C_39x126.mat')
% load('Construction_39x126.mat')
% load('WBE_39x126.mat')
% load('Random_39x126.mat')

S1=A(:,1:K);S2=A(:,K+1:2*K);S3=A(:,2*K+1:3*K);

b=[1  0.8 0.2;
  0.8  1  0.6;
  0.2  0.6  1];
W=kron(sqrt(b),ones(K));
ETSC=sum(abs(A'*A.*W).^2,'all');
snr_qujian=0:3:30;
for ksnr=1:length(snr_qujian)
    SNR=snr_qujian(ksnr);SNRline=10^(SNR/10);
    for c=1:cishu
        h11=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h12=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h13=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h21=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h22=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h23=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h31=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h32=(randn(K,1)+1i*randn(K,1))/sqrt(2);
        h33=(randn(K,1)+1i*randn(K,1))/sqrt(2);

        %%
        Y1=sqrt(b(1,1))*S1*h11+sqrt(b(1,2))*S2*h12+sqrt(b(1,3))*S3*h13;
        Y1=awgn(Y1,SNR);
        Y2=sqrt(b(2,1))*S1*h21+sqrt(b(2,2))*S2*h22+sqrt(b(2,3))*S3*h23;
        Y2=awgn(Y2,SNR);
        Y3=sqrt(b(3,1))*S1*h31+sqrt(b(3,2))*S2*h32+sqrt(b(3,3))*S3*h33;
        Y3=awgn(Y3,SNR);

        %%
        h11_hat_LS=(S1)'*Y1;
        h22_hat_LS=(S2)'*Y2;
        h33_hat_LS=(S3)'*Y3;

        MSE(c)=norm(h11-h11_hat_LS,"fro")^2+norm(h22-h22_hat_LS,"fro")^2+norm(h33-h33_hat_LS,"fro")^2;
    end
    MSE_b(ksnr)=mean(MSE)
    MSE_b_theoretical(ksnr)=ETSC-3*K+3*K/SNRline
end
semilogy(snr_qujian,MSE_b_theoretical)
hold on
semilogy(snr_qujian,MSE_b,'s')
grid on