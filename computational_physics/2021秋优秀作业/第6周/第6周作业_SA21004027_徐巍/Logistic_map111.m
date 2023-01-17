%Logistic map��ֵ���

clear
format long

%x�ĳ�ֵ
x(1) = 0.3;

%������
r = 0.025:0.00025:1;

%�õ���ʽ���е���
for j = 1:length(r)
    x(1) = 0.3;
    for i = 1:20000
        x(i+1) = 4*r(j)*x(i)*(1-x(i));
    end
    xx(j,:) = x;
end

%�����������ͼ(�ȶ�ֵ�ͻ���ʱ�Ĳ���ֵ)
figure()
for j = 1:length(r)
    if r(j)<2.9/4
        plot(r(j),xx(j,length(x)),".");%���ȶ�ֵֻ��һ��ʱ��ֻ��һ����
        hold on
        continue
    elseif r(j)<3.55/4
        for jj = 19970:20000
            plot(r(j),xx(j,jj),".");
            hold on
            continue
        end
    else
        for jj = 19900:20000
            plot(r(j),xx(j,jj),".");
            hold on
        end
    end
    ylabel('x');
    title("Logistic Map")
    xlabel('r');
end
