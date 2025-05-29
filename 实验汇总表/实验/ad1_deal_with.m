clear all
clc
load("800jieyue.mat");
rail=jieyuedata(:,1:5);
u1=jieyuedata(:,4:5);

% === 输入数据 ===
x1 = rail(:,3)-rail(:,2);             % x1(t)，长度N
dt = 0.01;                            % 采样周期
x2 = gradient(x1, dt);                  % x2 = dx1/dt 差分导数
N = length(x1);
% === 参数设置 ===
sigma_delta3 = 5000;  % 死区阈值 σ_Δ
eta3f = 50;  % ηf系数
delta_b1_delin =400;
chi_f3 = 10;
delta_b1_star = 400;

% ==== 初始化变量 ====
delta_b1 = zeros(N,1)+500;
sigma_f  = zeros(N,1);

% 初始值（你可根据情况设为非零）
delta_b1(1) = delta_b1_star;

% ==== 时间递推计算 ====
% for t = 1:N
%     % 滑动面 σ_f(t)
%     sigma_f(t) = 5 * x1(t) + 10* abs(x1(t))^(9/5) * sign(x1(t)) + 0.5*x2(t);
%     % === δ_b1 ===
%             d_delta = eta3f * sign(abs(sigma_f(t)) - sigma_delta3);
%            delta_b1(t+1) = delta_b1(t) + d_delta * dt;
%     
% end
% abs(sigma_f(t))
for t = 1:N
    % 滑动面 σ_f(t)
    sigma_f(t) = 5 * x1(t) + 10* abs(x1(t))^(9/5) * sign(x1(t)) + 0.5*x2(t);
    c(t)=abs(sigma_f(t));
    % === δ_b1 ===
%     if delta_b1(t) >= delta_b1_delin
               d_delta = eta3f *  abs(sigma_f(t))*sign(abs(sigma_f(t)) - sigma_delta3);
%     else
%         d_delta = chi_f3;
%     end
    delta_b1(t+1) = delta_b1(t) + d_delta * dt;
    e(t)=d_delta * dt;
    a(t)=d_delta;
d(t)=eta3f *abs(sigma_f(t))*sign(abs(sigma_f(t)) - sigma_delta3);
end
delta=delta_b1;