clc
clear all

x=[1,2,3,5]; % Fonksiyon değerleri 
y=[1,8,27,125]; % Fonksiyon değerlerinin karşılıkları
n = length(x);
xint=4; % f(4)'ün değerini hesapla
a(1)=y(1);
for i=1: n-1
    divdiff(i,1)=(y(i+1)-y(i))/(x(i+1)-x(i));
end
for j=2:n-1
    for i=1:n-j
        divdiff(i,j)=(divdiff(i+1,j-1)-divdiff(i,j-1))/(x(i+j)-x(i));
    end
end
for j=2:n
    a(j)=divdiff(1,j-1);
end
y=a(1);
xn=1
for k=2:n
    xn=xn*(xint-x(k-1));
    y=y+a(k)*xn;
end
    
disp(xn);