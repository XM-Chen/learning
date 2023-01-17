%С����double well�еĶ���ѧ���̣�U = ax^2 + bx^4, a<0

clear

%����
Alfa = 1;
a = -10;
b = 1;
D = 16;

%�˶���ʼֵ
x(1) = 2;
v(1) = -5;


%�˶�ʱ��
t = 500;
dt = 0.001;
n = t/dt;
tt = linspace(0,t,n);


%�����ܺ���ͼ
p = [4*b,0,2*a,0];
gen = roots(p);
gen(2)
gen(3)
x = -4:0.001:4;
U = a*x.^2 + b*x.^4;
figure()
plot(x,U)
xlabel('x');
ylabel('U');
title("�ƺ���U")

%����ʱ�̵��˶����
for i = 1:n-1
    x(i+1) = x(i) + v(i)*dt;
    v(i+1) = v(i) - Alfa*v(i)*dt + (-2*a*x(i)-4*b*x(i)^3)*dt + sqrt(D/dt)*dt*randn(1);
end
figure()

%��������Сλ�õĸ�����
y1 = ones(1, length(tt))*gen(2);
y2 = ones(1, length(tt))*gen(3);
plot(tt,y1, "r--")
hold on
plot(tt,y2, "r--")

%�������˶����x(t)-tͼ
plot(tt,x,".","MarkerSize",0.5)
xlabel('t');
ylabel('x(t)');
title("�����˶����x(t)-tͼ")
