clear
clc
close all

tau=39;
cishu=1e4;
rng(1)

Kqujian=42:2:48;
bqujian=0:0.1:1;
for Kk=1:length(Kqujian)
    K=Kqujian(Kk);
    F=fft(eye(K));
    Asub=F(1:tau,:)/sqrt(tau);
    A=[Asub Asub Asub];
    for bk=1:length(bqujian)
        b=bqujian(bk);
        B=[1  b  b;
            b  1  b;
            b  b  1];
        W=kron(sqrt(B),ones(K));
        ETSC_our(bk,Kk)=sum(abs(A'*A.*W).^2,'all');
    end

    F=fft(eye(3*K));
    A=F(1:tau,:)/sqrt(tau);
    for bk=1:length(bqujian)
        b=bqujian(bk);
        B=[1  b  b;
            b  1  b;
            b  b  1];
        W=kron(sqrt(B),ones(K));
        ETSC_WBE(bk,Kk)=sum(abs(A'*A.*W).^2,'all');
    end
end

plot(bqujian,ETSC_our(:,1),"Marker","o",'LineWidth',1.5,'Color',"#0072BD")
hold on
plot(bqujian,ETSC_our(:,2),"Marker","o",'LineWidth',1.5,'Color',"#D95319")
plot(bqujian,ETSC_our(:,3),"Marker","o",'LineWidth',1.5,'Color',"#EDB120")
plot(bqujian,ETSC_our(:,4),"Marker","o",'LineWidth',1.5,'Color',"#7E2F8E")

plot(bqujian,ETSC_WBE(:,1),"Marker","s",'LineWidth',1.5,'Color',"#0072BD")
plot(bqujian,ETSC_WBE(:,2),"Marker","s",'LineWidth',1.5,'Color',"#D95319")
plot(bqujian,ETSC_WBE(:,3),"Marker","s",'LineWidth',1.5,'Color',"#EDB120")
plot(bqujian,ETSC_WBE(:,4),"Marker","s",'LineWidth',1.5,'Color',"#7E2F8E")

led=legend("Construction 1, K=42","Construction 1, K=44",...
    "Construction 1, K=46","Construction 1, K=48",...
    "WBE sequence set, K=42","WBE sequence set, K=44",...
    "WBE sequence set, K=46","WBE sequence set, K=48");
led.Position=[0.560119047619048 0.118650793650794 0.336309523809524 0.309920634920635]
grid on
xlabel('\beta')
ylabel('ETSC')
