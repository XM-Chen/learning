%Logistic map��ֵ���

clear
format long

%������
r = 0.892;

%x�ĳ�ֵ
x(1) = 0.3;
N = 50000;

%�õ���ʽ���е���
for i = 1:N
x(i+1) = 4*r*x(i)*(1-x(i));
end

%�����������ͼ
figure()
plot(x,".");
title("r ="+num2str(r))
pause(0.01)
ylabel('xn');
xlabel('n');

(r-0.25)/r
