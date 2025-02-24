% 稀疏版本的第一套方案
clear
clc
% close all

rng(1)
N=32;
K=28;
M=K*2;
A0=exp(2i*pi*rand(N,M));
A=A0;
b=0.5;
W=[ones(K) sqrt(b)*ones(K);sqrt(b)*ones(K) ones(K)];

for m=1:M
    S(:,:,m)=zeros(N,N*M);
    S(:,(1:N)+(m-1)*N,m)=eye(N);
end
for i=1:M
    for j=1:M
        Uall{i,j}=(sparse(S(:,:,i)))'*sparse(S(:,:,j));
    end
end

% L=sparse((N*M)^2,(N*M)^2);
% for i=1:M
%     for j=1:M
%         U=Uall{i,j};
%         L=L+(U(:))*U(:)'*W(i,j);
%     end
% end
% lmabda_L=eigs(L,1);
lmabda_L=N;

cishu=1e3;
for c=1:cishu
    x=A(:);
    X=x*x';
    R=sparse(N*M,N*M);
    for i=1:M
        for j=1:M
            U=Uall{i,j};
            R=R+(U(:))'*X(:)*W(i,j)*U;
        end
    end
    lmabda_R=eigs(R,1);
    y=(R-lmabda_L*X-lmabda_R*eye(N*M))*x;

%     x=sign(-y);
%     A=reshape(x,N,M)/sqrt(N);
%     ISL(c)=sum(abs(A'*A.*W).^2,'all');

    A=reshape(y,N,M);
    A=A./sqrt(sum(abs(A).^2));
    ISL(c)=sum(abs(A'*A.*W).^2,'all');
end
ISL(end)
semilogy(ISL)

EWB=2*K^2*(1+b)/(K+b*(N-K))