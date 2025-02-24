% 20240929
clear
clc
% close all
rng(1)


K=32;
tau=39;
b=0.4;

v=fft(eye(K))/sqrt(K);
u=fft(eye(tau))/sqrt(tau);
U1=u(:,1:tau-K);
U2=u(:,tau-K+1:K);
U3=u(:,K+1:end);

lamda1=K*(1+b)/(K+b*(tau-K));
lamda2=lamda1/(1+b);

S1=[U1,U2]*diag([sqrt(lamda1)*ones(1,tau-K) sqrt(lamda2)*ones(1,2*K-tau)])*v';
S2=[U3,U2]*diag([sqrt(lamda1)*ones(1,tau-K) sqrt(lamda2)*ones(1,2*K-tau)])*v';

nl1=sum(abs(S1).^2);
[nl1min,m]=min(nl1);[nl1max,n]=max(nl1);

c=1;

while nl1max-nl1min>1e-10
    p=min([m,n]);q=max([m,n]);
    app=nl1(p);aqq=nl1(q);apq=(S1(:,p))'*S1(:,q);
    t=(real(apq)+sqrt( (real(apq))^2-(app-1)*(aqq-1) ) )/(aqq-1);

    Theta=eye(K);
    Theta(p,p)=1/sqrt(1+t^2);
    Theta(p,q)=t/sqrt(1+t^2);
    Theta(q,p)=-t/sqrt(1+t^2);
    Theta(q,q)=1/sqrt(1+t^2);

    S1=S1*Theta;
    nl1=sum(abs(S1).^2);
    [nl1min,m]=min(nl1);[nl1max,n]=max(nl1);

    Gbeta=[S1'*S1 sqrt(b)*S1'*S2;
        sqrt(b)*S2'*S1 S2'*S2];
    ISL(c)=norm(Gbeta,"fro")^2;
    c=c+1;
end

nl2=sum(abs(S2).^2);
[nl2min,m]=min(nl2);[nl2max,n]=max(nl2);
while nl2max-nl2min>1e-10
    p=min([m,n]);q=max([m,n]);
    app=nl2(p);aqq=nl2(q);apq=(S2(:,p))'*S2(:,q);
    t=(real(apq)+sqrt( (real(apq))^2-(app-1)*(aqq-1) ) )/(aqq-1);

    Theta=eye(K);
    Theta(p,p)=1/sqrt(1+t^2);
    Theta(p,q)=t/sqrt(1+t^2);
    Theta(q,p)=-t/sqrt(1+t^2);
    Theta(q,q)=1/sqrt(1+t^2);

    S2=S2*Theta;
    nl2=sum(abs(S2).^2);
    [nl2min,m]=min(nl2);[nl2max,n]=max(nl2);

    Gbeta=[S1'*S1 sqrt(b)*S1'*S2;
        sqrt(b)*S2'*S1 S2'*S2];
    ISL(c)=norm(Gbeta,"fro")^2;
    c=c+1;
end

Gbeta=[S1'*S1 sqrt(b)*S1'*S2;
    sqrt(b)*S2'*S1 S2'*S2];
ETSC=norm(Gbeta,"fro")^2

EWB=2*K^2*(1+b)/(K+b*(tau-K))

S(:,:,1)=S1;
S(:,:,2)=S2;
