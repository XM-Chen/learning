%��ֵ���Kicked rotor model

clear

K = 0.1;%����k
n = 1%ȡ1���ʼֵ


%��������
N = 20000;

%��ֵ
x1 =  1;
p1 =  1;

%��ֵ����
for i = 1:N
    x(i) = x1;
    p(i) = p1;
   p1 =p1+K*sin(x1);
   x1 = x1+p1;
end

%����ͨ�ռ���ӻ������
figure()
plot(x,p,".")
xlabel('x');
ylabel('p');
title("k = "+num2str(K)+"����ͨ�ռ䣩")
hold on

%����ռ���ӻ������
figure()
for i = 1:n
plot(mod(x,2*pi),mod(p,2*pi),".")
hold on
xlabel('x');
ylabel('p');
title("k = "+num2str(K)+"����ռ䣩")
axis([0,2*pi,0,2*pi])
end



