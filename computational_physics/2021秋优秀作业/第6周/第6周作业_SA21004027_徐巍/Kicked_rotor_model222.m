%��ֵ���Kicked rotor model
clear

K = 1.5;%����k
n=10%ȡ10���ʼֵ�������������һ��ͼ��


for jj = 1:n
    
N = 20000;%��������

%���ȡ��ֵ
x1 =  rand(1)*2*pi;
p1 =  rand(1)*2*pi;

%��ֵ����
for i = 1:N
    x(i) = x1;
    p(i) = p1;
   p1 =p1+K*sin(x1);
    x1 = x1+p1;
end

pp(jj,:)=p;
xx(jj,:)=x;
end

%����ռ���ӻ�10���ʼֵ�������
figure()
for i = 1:n
plot(mod(xx(i,:),2*pi),mod(pp(i,:),2*pi),".")
hold on
xlabel('x');
ylabel('p');
title("k = "+num2str(K)+"����ռ䣩")
axis([0,2*pi,0,2*pi])
end
