clear
clc
close all

load('TimeCeshi.mat')

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 使用 bar 的矩阵输入创建多行
bar1 = bar(t'/60,'Parent',axes1);
set(bar1(3),'DisplayName','\tau=20');
set(bar1(2),'DisplayName','\tau=40');
set(bar1(1),'DisplayName','\tau=60');

% 创建 ylabel
ylabel('Time (minute)');

% 创建 xlabel
xlabel('K');

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'XTick',[1 2 3 4],'XTickLabel',{'16','32','64','128'});
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.167261875858647 0.75 0.145833333333333 0.121428571428571]);

