clear 
clc

% 实现 Kicked totor model的模拟
% 迭代法
% 大概有点跑题
% 实现了多个粒子轨迹的追踪
% 初始时刻的状态是随机的
% 具体在PDF中详细解释


% 预设
m=1;
k=2;
t0=1;

% 步长
dt=0.01;

% 迭代次数
N=5e3;

% 粒子数
n=100;

% 初态
% 每个粒子的初态都是随机的
x0=-100+200*rand(1,n);
p0=-5+10*rand(1,n);

% 初始化
x=zeros(n,N+1);
p=zeros(n,N+1);

% 初态
for i=1:n
    x(i,1)=x0(i);
    p(i,1)=p0(i);
end

% 利用y坐标将不同初始时刻的粒子分隔开
y=zeros(n,N+1);
for i=1:n
    for j=1:N+1
        y(i,j)=(-n/2+(i-1))/n;
    end
end

% 初始时刻接近0但不是0，便于判断是否到达动量突变点。
t=1e-5:dt:1e-5+N*dt;

for j=1:n
    for i=1:N
        x(j,i+1)=x(j,i)+dt*p(j,i);
        
        % 判断是否到达动量突变点
        if abs(mod(t(i),t0))<1e-3
            p(j,i+1)=p(j,i)+k*sin(x(j,i));
        else
            p(j,i+1)=p(j,i);
        end
        
    end
end

figure

hold on

% 绘制初始点
h=plot(x(:,1),y(:,1));

% 坐标轴范围
axis([-600 600 -0.6 0.6])

xlabel('x/m');
ylabel('y/m');

% 时刻
title(['t=' num2str(t(1)-1e-5)])


for j=2:length(x)
    % 删除上一个点
    delete(h);
    
    % 绘制下一个点
    h=plot(x(:,j),y(:,j),'.b');
    
    % 时刻
    title(['t=' num2str(t(j)-1e-5) 's'])
    
    pause(0.1*dt);
end

