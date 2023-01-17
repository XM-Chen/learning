%%�ڣ�3���������a)
clear

N = 1000;

n = 30;%�ظ��������
ddd=[];
for ii = 1:n
M = randn(N);

for ii = 1:length(M)
    for jj = 1:length(M)
        if jj > ii
            M(ii, jj) = normrnd(0, 1, 1);
            M(jj, ii) = conj(M(ii, jj));
        end
    end
end


[x, y] = eig(M);

eigenvalues = diag(y);

for i = 1:length(eigenvalues) - 1;
    dd(i) = eigenvalues(i+1) - eigenvalues(i);
end

ddd = [ddd,dd];
end

dd = ddd;

nbins = 200;%ֱ��ͼ��������


[histFreq, histXout]=hist(dd, nbins);

binWidth = histXout(2)-histXout(1);
area = binWidth*sum(histFreq);

figure()
subplot 311
bar(histXout,histFreq/area);
grid on;
title("��һ��ֱ��ͼ")
xlabel("��")
ylabel("P")


subplot 312
plot(histXout,histFreq/area,'r*');
grid on;
title("ֱ��ͼ����ɢ��ͼ")
xlabel("��")
ylabel("P")
 
subplot 313
bar(histXout,histFreq/area);
hold on;
plot(histXout,histFreq/area,'r-',"LineWidth",2);
grid on;
title("ֱ��ͼ��ɢ��ͼ")
xlabel("��")
ylabel("P")

x = histXout;
y = histFreq/area;

[xData, yData] = prepareCurveData(x, y);

%��ָ��������ʽ���
ft = fittype( 'C*abs(x)^a*exp(-b*x^2)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.261424308472039 0.159148924534647 0.466548486978114];

[fitresult, gof] = fit( xData, yData, ft, opts );
fitresult


xmax = x(length(x));
C = fitresult.C;
a = fitresult.a;
b = fitresult.b;

x1 = 0:0.001:xmax;
y1 = C*(abs(x1).^a).*exp(-b*x1.^2);
figure()
plot(x1,y1,"b-","LineWidth",1.5)
hold on
plot(histXout,histFreq/area,'r.',"MarkerSize",11);
legend("�������", "��ֵɢ��")
xlabel("��")
ylabel("P(��)")


(72.63+74.65+77.76)/3
(0.8433+0.8516+0.8644)/3
(54.1+54.6+55.28)/3



















% clear
% 
% N = 1000;
% 
% for i1 = 1:10000
% i1
% M = randn(N);
% 
% for ii = 1:length(M)
%     for jj = 1:length(M)
%         if jj > ii
%             M(ii, jj) = normrnd(0, 0.5, 1);
%             M(jj, ii) = conj(M(ii, jj));
%         end
%     end
% end
% 
% 
% [x, y] = eig(M);
% 
% eigenvalues = diag(y);
% 
% for i = 1:length(eigenvalues) - 1;
%     dd(i) = eigenvalues(i+1) - eigenvalues(i);
% end
% 
% maxD(i1) = max(dd);
% end
% 
% 
% 
% figure()
% plot(maxD, ".")
% 
% nbins = 51;
% figure()
% hist(maxD, nbins)
% 
% figure()
% nbins = nbins;
% [histFreq, histXout]=hist(maxD, nbins);
% subplot 311
% hist(dd,nbins);
% grid on;
% 
% subplot 312
% plot(histXout,histFreq,'r','linewidth',2);
% grid on;
%  
% subplot 313
% hist(maxD,nbins);
% hold on;
% plot(histXout,histFreq,'r','linewidth',2);
% grid on;