%����Feigenbaum Constant

clear
format long

%������
r = 0.7:0.0000025:0.95;

j = 1;

%������ŵ��ָ���ľ���ֵС�ڸ�ֵʱ��¼��Ӧ�Ĳ�����
e = 0.0016;

%��������
n = 10000;

%���������ȡֵ�µ�������ŵ��ָ���������ж�
for i = 1:length(r)
    s = 0;
    x1 = 0.3;
    
    %�õ���ʽ���е���
    for ii = 1:n
        x2 = 4*r(i)*(x1-x1^2);
        s = s + log(4*abs(r(i)-2*r(i)*x1));
        x1 = x2;
    end
    
    %��������ŵ��ָ�����ж�
    s = s/n;
    if abs(s) < e 
            rr(j) = r(i);
            ss(j) = s; 
            j = j + 1; 
    end
end

%��������Ҫ��ĸ���������ŵ��ָ��
figure()
plot(ss)
xlabel('n');
ylabel('s');


%�ҵ�ͼ��ǰn�������0��sֵ
flag = 1;
nn0 = 5;%ֻ��ǰ����㣬����ĵ���Ҫ������
nn = 1;
jj = 1;
for i = 1:length(ss)
    if nn <= nn0
        if flag ==1
            if ss(i+1)<ss(i)
                sss(jj) = ss(i);
                rrr(jj) = rr(i);
                jj = jj + 1;
                flag = -flag;
                 nn = nn +1;
            end
        else
            if ss(i+1)>ss(i)
                flag = -flag;
            end
        end
    end
end

%�������ҵ���5����ֵ����0.0002��Χ�ڣ��ֱ����������ŵ��ָ��
j1  =  1;
for i2 = 1:length(rrr)

    clear rr
clear r
clear ss

r = rrr(i2)-0.0002:0.0000005:rrr(i2)+0.0002;

j = 1;
rr(j)= 0;
e = 0.002;
n = 10000;

for i = 1:length(r)
    s = 0;
%     for i1 = 1:50
%     x1 = rand(1);
    x1 = 0.3;
    for ii = 1:n
        x2 = 4*r(i)*(x1-x1^2);
        s = s + log(4*abs(r(i)-2*r(i)*x1));
        x1 = x2;
    end
%     end
    s = s/n;
    if abs(s) < e 
            rr(j) = r(i);
            ss(j) = s; 
            j = j + 1; 
    end
end

%��������Ҫ��ĸ���������ŵ��ָ��
figure()
plot(ss)
xlabel('n');
ylabel('s');

%����ǰ5���ֲ��
s0 = 1;
for i = 1:length(ss)
    if abs(ss(i)) < s0
        j = i;
        s0 = abs(ss(i));
    end
end
rrrr(j1) =  rr(j);
j1 = j1+1;
end

%���ǰ5���ֲ���Ӧ�Ħ�ֵ
rrrr

%����Feigenbaum Constant�������
for i = 1:length(rrrr)-2
     (rrrr(i+1)-rrrr(i))/(rrrr(i+2)-rrrr(i+1))
end
