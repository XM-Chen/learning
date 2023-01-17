%%��ά�����������������ֵ�ֲ�
clear
nnn = 10000000;
for ii = 1:nnn
a11 = randn(1);

a12 = normrnd(0,0.5,1) + i*normrnd(0,0.5,1);
a21 = conj(a12);

a22 = randn(1);

H = [a11, a12; a21, a22];


[x,y] = eig(H);

r = zeros(1,2);
r(1) = y(1,1);
r(2) = y(2,2);
r = r(randperm(length(r)));

r1(ii) = r(1);
r2(ii) = r(2);

end



figure()
plot(r1,".")
hold on
plot(r2,".")
legend("����ֵ1", "����ֵ2")
xlabel("ѭ������");
ylabel("����ֵ")




n1 = 6;
bc = 0.1;
rr = -n1:bc:n1;
nr = length(rr);

Ds = zeros(nr,nr);

n0 = 0;
%ͳ������ֵ�ķֲ����
for i = 1:nnn
    
    if r1(i)>6||r1(i)<-6||r2(i)>6||r2(i)<-6
        n0 = 1 + n0;
        continue;
    end
    
    ii =  round((r1(i)+n1)*1/bc)+1;
    jj =  round((r2(i)+n1)*1/bc)+1;
    Ds(ii, jj) = Ds(ii, jj) + 1;
    
end

%��һ��
Ds = Ds/(bc^2*sum(sum(Ds)));


X = rr;
Y = X;


[x, y] = meshgrid(rr,rr);

%��ָ��������ʽ���
[xData, yData, zData] = prepareSurfaceData( x, y, Ds );

ft = fittype( 'C*abs(x-y)^2*exp(-A*(x^2+y^2))', 'independent', {'x', 'y'}, 'dependent', 'z' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.729478253314498 0.300029182951152];
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );
fitresult

Const = fitresult.C;
A = fitresult.A;

P = Const*abs(x-y).^2.*exp(-A*(x.^2 + y.^2));

chazhi = Ds - P;



figure()
plot3(xData, yData, zData ,"r.","MarkerSize",3)
xlabel("x")
ylabel("y")
zlabel("P")
title("��ֵͳ�ƽ��")

figure()
mesh(X, Y, P)
xlabel("x")
ylabel("y")
zlabel("P")
title("�ֲ�������Ͻ��")


figure()
fig1 = plot3(xData, yData, zData ,"r.","MarkerSize",3);
hold on
fig2 = mesh(X, Y, P);
xlabel("x")
ylabel("y")
zlabel("P")
title("��ֵͳ�ƽ����ֲ�������Ͻ���Ա�")
legend([fig1, fig2],"��ֵͳ�ƽ��","�ֲ�������Ͻ��")


figure()
mesh(X,Y,chazhi)
xlabel("x")
ylabel("y")
zlabel("dP")
title("��ֵͳ�ƽ����ֲ�������Ͻ��֮��")









    





    
    