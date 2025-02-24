% 稀疏版本的第二套方案
% 20240927
clear
clc
% close all

rng(1)
N=32;
K=28;
M=K*2;
A0=exp(2i*pi*rand(N,M));
A=A0;
b=0.8;
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

cishu=1e5;
for c=1:cishu
    x=A(:);
    X=x*x';
    R2=A'*A.*W;
    R=sparse(N*M,N*M);
    for i=1:M
        for j=1:M
            U=Uall{i,j};
            R=R+R2(j,i)*U;
        end
    end
    
    lmabda_R=eigs(R,1);
    y=(R-lmabda_L*X-lmabda_R*eye(N*M))*x;
    A1=reshape(y,N,M);
    A1=A1./sqrt(sum(abs(A1).^2));

    x=A1(:);
    X=x*x';
    R2=A1'*A1.*W;
    R=sparse(N*M,N*M);
    for i=1:M
        for j=1:M
            U=Uall{i,j};
            R=R+R2(j,i)*U;
        end
    end
    
    lmabda_R=eigs(R,1);
    y=(R-lmabda_L*X-lmabda_R*eye(N*M))*x;
    A2=reshape(y,N,M);
    A2=A2./sqrt(sum(abs(A2).^2));


    r=A1-A;
    v=A2-A1-r;
    alp=-norm(r,'fro')/norm(v,'fro');
    A3=A-2*alp*r+alp^2*v;
    A3=A3./sqrt(sum(abs(A3).^2));
    Fk=sum(abs(A'*A.*W).^2,'all');
    F3=sum(abs(A3'*A3.*W).^2,'all');
    while F3>Fk && alp~=-1
        alp=(alp-1)/2;
        A3=A-2*alp*r+alp^2*v;
        A3=A3./sqrt(sum(abs(A3).^2));
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