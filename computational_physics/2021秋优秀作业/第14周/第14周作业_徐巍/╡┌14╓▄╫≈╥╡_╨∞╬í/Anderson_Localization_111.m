%%Anderson Localization����������ʱ
clear
format long

t = 1;
%w = 0;

n = 2000;

eg = [];
w0 = [0,0.01,0.06,0.2,0.7,2,5];%���򳤶�
%w0 = 0.01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii = 1:length(w0)
w = w0(ii);
h1 = (rand(1,n)-0.5)*2*w;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


h2 = ones(1,n-1)*(-t);

H1 = diag(h1);
H2 = diag(h2,1);
H3 = diag(h2,-1);
H = H1 + H2 + H3;




[x, y] = eig(H);
eigenvalues = diag(y);
eg = [eg,eigenvalues];

 figure()
 subplot(2,1,1)
 plot(x(:,1));
 hold on
 plot(x(:,5));
 plot(x(:,9));
 xlabel("Lattice sites")
 ylabel("phi")
 title("������"+"(W = "+num2str(w0(ii))+")")
 legend("��̬", "��5������̬","��15������̬")
 
 subplot(2,1,2)
 plot(x(:,1).^2);
 hold on
 plot(x(:,5).^2);
 plot(x(:,9).^2);
 xlabel("Lattice sites")
 ylabel("|phi|^2")
 title("̬�ܶ�ͼ"+"(W = "+num2str(w0(ii))+")")
 legend("��̬", "��5������̬","��15������̬")
 
 figure()
 plot(eigenvalues,".")
 xlabel("��n��̬")
 ylabel("En")
 title("����"+"(W = "+num2str(w0(ii))+")")

end


clear x
figure()

for i = 1:length(w0)
    x = ones(length(eigenvalues),1)*w0(i);
    plot(x,eg(:,i),".")
    hold on
end
xlabel("W")
ylabel("En")
title("����")










