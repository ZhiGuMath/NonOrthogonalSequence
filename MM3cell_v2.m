% 稀疏版本的第一套方案
clear
clc
% close all

rng(2)
% N=39;
% K=32;
% M=K*3;
% A0=exp(2i*pi*rand(N,M))/sqrt(N);
% A=A0;
% b=[1  0.8 0.2;
%   0.8  1  0.6;
%   0.2  0.6  1];
N=5;
K=12;
M=K*3;
A0=exp(2i*pi*rand(N,M))/sqrt(N);
A=A0;
b=[1  1 0.0;
  1  1  0.4;
  0.  0.4  1];
W=kron(sqrt(b),ones(K));

lmabda_L=N;

cishu=1e4;
for c=1:cishu
    x=A(:);
    R2=A'*A.*W;
    R=kron(conj(R2),sparse(eye(N)));
    lmabda_R=eigs(R2,1);
    y=R*x-(N*M*lmabda_L+lmabda_R)*x;

    x=sign(-y);
    A=reshape(x,N,M)/sqrt(N);
    ISL(c)=sum(abs(A'*A.*W).^2,'all');

%     A=reshape(y,N,M);
%     A=A./sqrt(sum(abs(A).^2));
%     ISL(c)=sum(abs(A'*A.*W).^2,'all');
end
ISL(end)
semilogy(ISL)

NewEWB=K^2/N*sum(b,'all')