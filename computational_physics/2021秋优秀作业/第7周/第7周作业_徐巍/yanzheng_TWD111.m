%%�����ܣ�����ĳ�ֲַ����ɵ�n�����������С�������У��ҵ�����ֵ֮������ֵ��
%%������ظ�ǰ�沽���ҵ������ֵ���ӵķֲ��Ƿ����Tracy-Widom�ֲ�

clear

n1 = 1000000; %����1000000�����ֵ
n2 = 1000; %ÿ�����ɵ����������
max = zeros(1,n1); %��ʼ����¼���ֵ������

%ѭ�������ֵ
for i = 1:n1
    
    %���ɸ��ֲַ������������Ҫ�鿴ĳ�ֲַ�ʱ����ȡ����Ӧ��ע�ͷ���
    
    %random_number = rand(1,n2); %ȡֵ��ΧΪ0~1�ľ��ȷֲ�
    random_number = randn(1,n2); %��̬�ֲ�N(0, 1)
    %random_number = random("Normal",2,5,1, n2); %��̬�ֲ�N(2, 5)
    %random_number = exprnd(1,1,n2); %ָ���ֲ�������Ϊ 1 
    %random_number = gamrnd(1,1,1,n2); %٤��ֲ�������Ϊ1, 1
    %random_number = raylrnd(1, 1,n2); %�����ֲ�������Ϊ1
    %pd = makedist("rician",1,2); random_number = random(pd, 1, n2); %��˹�ֲ�������Ϊ1��2
    %pd = makedist("nakagami",1,2); random_number = random(pd, 1, n2); %nakagami�ֲ�������Ϊ1��2
    
    random_number = sort(random_number);%�����ɵ��������������
    
    %�ҳ�����ֵ֮������ֵ
    max_dif = 0;
    for j = 1:length(random_number)-1
        if random_number(j+1) - random_number(j) > max_dif
            max_dif = random_number(j+1) - random_number(j);
        end
    end
    max(i) = max_dif;
    
end

%figure()
%����ֱ��ͼ������������ڹ�һ��
[histFreq, histXout] = hist(max,1000);
binWidth = histXout(2)-histXout(1);
area = binWidth*sum(histFreq);

figure()

%�����ֵ�ֲ�ֱ��ͼ
subplot(2,2,1)
hist(max,1000);
grid on;
title("���ֵ�ֲ�ֱ��ͼ", "FontSize",11)
xlabel('max', "FontSize",11);
ylabel('Ƶ��', "FontSize",11);

%����һ��ֱ��ͼ
subplot(2,2,2)
bar(histXout, histFreq/area);
grid on;
title("��һ��ֱ��ͼ", "FontSize",11)
xlabel('max', "FontSize",11);
ylabel('Ƶ��/���', "FontSize",11);

%����һ��ֱ��ͼ����ͼ
subplot(2,2,3)
plot(histXout, histFreq/area);
grid on;
title("��һ��ֱ��ͼ����", "FontSize",11)
xlabel('max', "FontSize",11);
ylabel('Ƶ��/���', "FontSize",11);

%��ƽ������ͼ�����Ƹ����ܶȷֲ���
subplot(2,2,4)
%���ں˷ֲ�ƽ������ͼ
PD = fitdist(max', "Kernel");
plot(histXout, pdf(PD, histXout));
grid on
title("ƽ�����������Ƹ����ܶȷֲ���", "FontSize",11)
xlabel('max', "FontSize",11);
ylabel('Ƶ��/���', "FontSize",11);

ss = 0;
for i = 1: 1000
    ss = binWidth*histFreq(i);
end
