
function [F]=Muller()
f=input('Fonksiyonu girin:  ');

%Kökler ve gerçek değer
x0=input('x0 degerini gir:  ');
x1=input('x1 degerini gir:  ');
x2=input('x2 degerini gir:  ');
e =input('Bitmesini istediğniz hata değerini gir:  ');

fx=inline(f);

k=0;
xi=0;
baslangic=1;

while(baslangic)
    xi=x2;
    k=k+1;
    fprintf('\n Iterasyon ');
    fprintf('%f', k);
    
    h0=x1-x0;
    h1=x2-x1;
    
    D0=(fx(x1)-fx(x0))/(x1-x0);
    %D0=(fx(x1)-fx(x0))/h0;
    D1=(fx(x2)-fx(x1))/(x2-x1);
    %D1=(fx(x2)-fx(x1))/h1;
    
    a=(D1-D0)/(h1-h0);
    b=(a*h1)+D1;
    c=fx(x2);
    
    kok=sqrt(b*b-(4*a*c));
    %Kökün büyük gelmesi durumu
    if abs(b+kok)>abs(b-kok)
        payda=b+kok;
    %Kökün küçük gelmesi durumu
    else
        payda=b-kok;
    end
    
    dx3=(2*c)/payda;
    x3=x2-dx3; %Yeni x3 değeri
    baslangic=abs((dx3)/x3)>e || k<c || abs(fx(x3))>e;
    
    %Ea değeri
    Et=abs(x3-x2)/x3;
    Ea=Et*100;
    
    %Yeni kökler
    x0=x1;
    x1=x2;
    x2=x3;
    
    fprintf('\n Xi: ');
    fprintf('%f', xi );
    
    fprintf('\n Ea:  ');
    fprintf('%f', Ea);

    fprintf('\n ');
    
end
    
