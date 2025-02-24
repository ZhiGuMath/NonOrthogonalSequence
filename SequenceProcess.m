clear
clc
%%
load('Wang_39x64_0_0.mat')
SeqAll(:,:,1)=A;

load('Wang_39x64_0_2.mat')
SeqAll(:,:,2)=A;

load('Wang_39x64_0_4.mat')
SeqAll(:,:,3)=A;

load('Wang_39x64_0_6.mat')
SeqAll(:,:,4)=A;

load('Wang_39x64_0_8.mat')
SeqAll(:,:,5)=A;

load('Wang_39x64_1_0.mat')
SeqAll(:,:,6)=A;

save SeqAllWang_39x64 SeqAll
%%
clear
clc

load('ETSC_C_39x64_0_0.mat')
SeqAll(:,:,1)=A;

load('ETSC_C_39x64_0_2.mat')
SeqAll(:,:,2)=A;

load('ETSC_C_39x64_0_4.mat')
SeqAll(:,:,3)=A;

load('ETSC_C_39x64_0_6.mat')
SeqAll(:,:,4)=A;

load('ETSC_C_39x64_0_8.mat')
SeqAll(:,:,5)=A;

load('ETSC_C_39x64_1_0.mat')
SeqAll(:,:,6)=A;

save SeqAllETSC_C_39x64 SeqAll
%%
clear
clc

load('ETSC_U_39x64_0_0.mat')
SeqAll(:,:,1)=A;

load('ETSC_U_39x64_0_2.mat')
SeqAll(:,:,2)=A;

load('ETSC_U_39x64_0_4.mat')
SeqAll(:,:,3)=A;

load('ETSC_U_39x64_0_6.mat')
SeqAll(:,:,4)=A;

load('ETSC_U_39x64_0_8.mat')
SeqAll(:,:,5)=A;

load('ETSC_U_39x64_1_0.mat')
SeqAll(:,:,6)=A;

save SeqAllETSC_U_39x64 SeqAll