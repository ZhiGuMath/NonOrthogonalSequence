% 稀疏版本的第二套方案
% 幺模
% 20240928
clear
clc
% close all

rng(1)
N=39;
K=32;
M=K*2;
A0=exp(2i*pi*rand(N,M))/sqrt(N);
A=A0;
b=0;
W=[ones(K) sqrt(b)*ones(K);sqrt(b)*ones(K) ones(K)];

lmabda_L=N;

cishu=2e4;
for c=1:cishu
    x=A(:);
    R2=A'*A.*W;
    R=kron(conj(R2),sparse(eye(N)));
    lmabda_R=eigs(R2,1);
    y=R*x-(M*lmabda_L+lmabda_R)*x;
    A1=reshape(y,N,M);
    A1=sign(A1)/sqrt(N);

    x=A1(:);
    R2=A1'*A1.*W;
    R=kron(conj(R2),sparse(eye(N)));
    lmabda_R=eigs(R2,1);
    y=R*x-(M*lmabda_L+lmabda_R)*x;
    A2=reshape(y,N,M);
    A2=sign(A2)/sqrt(N);

    r=A1-A;
    v=A2-A1-r;
    alp=-norm(r,'fro')/norm(v,'fro');
    A3=A-2*alp*r+alp^2*v;
    A3=sign(A3)/sqrt(N);
    Fk=sum(abs(A'*A.*W).^2,'all');
    F3=sum(abs(A3'*A3.*W).^2,'all');
    while F3>Fk && alp~=-1
        alp=(alp-1)/2;
        A3=A-2*alp*r+alp^2*v;
        A3=sign(A3)/sqrt(N);
        F3=sum(abs(A3'*A3.*W).^2,'all');
    end
    A=A3;

    ISL(c)=sum(abs(A'*A.*W).^2,'all');

    %     x=sign(-y);
%     A=reshape(x,N,M)/sqrt(N);
%     ISL(c)=sum(abs(A'*A.*W).^2,'all');
end
ISL(end)
semilogy(ISL)

EWB=2*K^2*(1+b)/(K+b*(N-K))