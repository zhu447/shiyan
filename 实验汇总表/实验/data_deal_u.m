clear all
clc
load("800jieyue.mat");
u_pid_last=jieyuedata(:,4);
u_cntsmc_last=jieyuedata(:,6);
%%%%%%控制率u进行滤波%%%%%
x = u_cntsmc_last;     % 原始信号
y = zeros(size(x));     % 滤波后信号
tau = 0.2;              % 时间常数（单位：秒）
Ts = 0.01;              % 采样周期（单位：秒）

alpha1 = 0.1;
alpha2 = 0.9;
y(1) = x(1);            % 初始条件
alpha=y;
alpha(1:1000)=alpha(1:1000)+alpha1;
alpha(1001:1050)=alpha(1001:1050)+alpha2;
alpha(1051:1750)=alpha(1051:1750)+alpha1;
alpha(1751:1860)=alpha(1751:1860)+alpha2;
alpha(1861:2550)=alpha(1861:2550)+alpha1;
alpha(2551:2650)=alpha(2551:2650)+alpha2;
alpha(2651:3380)=alpha(2651:3380)+alpha1;
alpha(3381:3480)=alpha(3381:3480)+alpha2;
alpha(3481:4180)=alpha(3481:4180)+alpha1;
alpha(4181:4280)=alpha(4181:4280)+alpha2;
alpha(4281:4980)=alpha(4281:4980)+alpha1;
alpha(4981:5080)=alpha(4981:5080)+alpha2;
alpha(5081:end)=alpha(5081:end)+alpha1;

for n = 2:length(x)
    y(n) = y(n-1) + alpha(n) * (x(n) - y(n-1));
end
u_cntsmc_last=y;


% x = pid_last(:,5);     % 原始信号
% y = zeros(size(x));     % 滤波后信号
% tau = 0.03;              % 时间常数（单位：秒）
% Ts = 0.01;              % 采样周期（单位：秒）
% 
% alpha = Ts / (tau + Ts);
% y(1) = x(1);            % 初始条件
% 
% for n = 2:length(x)
%     y(n) = y(n-1) + alpha * (x(n) - y(n-1));
% end
% pid_last(:,5)=y;
% speed_aim=zeros(size(pid_last(:,5)))+1000;
% pid_last(:,1)=0:0.01:0.01*(size(pid_last(:,1))-1);
% cntsm_last(:,1)=0:0.01:0.01*(size(pid_last(:,1))-1);
% rail=[pid_last(:,1) pid_last(:,3) pid_last(:,4) cntsm_last(:,4)];
% u=[pid_last(:,1) pid_last(:,5) cntsm_last(:,5)];
% speed=[pid_last(:,1) pid_last(:,2)+55 speed_aim];
% error=[pid_last(:,1) pid_last(:,3)-pid_last(:,4) pid_last(:,3)-cntsm_last(:,4)];

