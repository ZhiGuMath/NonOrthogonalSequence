%% Run time test
clear
clc
close all

tau_qj=[20 40 60];
K_qj=[16 32 64 128];

for k_tau=1:length(tau_qj)
    for k_K=1:length(K_qj)
        tau=tau_qj(k_tau);
        K=K_qj(k_K);

        tic
        N=K*2;
        A0=exp(2i*pi*rand(tau,N))/sqrt(tau);
        A=A0;
        b=[1  0.8;
            0.8  1];
        W=kron(sqrt(b),ones(K));
        lmabda_L=tau;

        cishu=1e4;
        for c=1:cishu
            x=A(:);
            R2=A'*A.*W;
            R=kron(conj(R2),sparse(eye(tau)));
            lmabda_R=eigs(R,1);
            y=R*x-(N*lmabda_L+lmabda_R)*x;
            A=reshape(y,tau,N);
            A=A./sqrt(sum(abs(A).^2));
            ISL(c)=sum(abs(A'*A.*W).^2,'all');
        end
        t(k_tau,k_K)=toc
    end
end
bar(t')