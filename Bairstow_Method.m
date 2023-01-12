clc ;
clear all;
close all;

polinom_boyut= input('Polinomun boyutunu girin: ');
fun=[];
for n = 1 : polinom_boyut
            fprintf("%d",polinom_boyut-n)   
            a = input('.derece olan katsayıyı giriniz ');
            fun=[fun a];
end         
r = -1;
s = -1;
es = 1;

bairstow(fun, r, s, es) 

function bairstow(a, r0, s0, EE)
    n = length(a); % girilen polinomun boyutunu alıyoruz
    a = a(n : -1 : 1); % polinomu ters çeviriyoruz
    hata_eas=[];
    hata_ear=[];

    % polinom derecesi tek mi çift mi çift mi kontrol ediyoruz
    if(mod(n-1, 2) ~= 0)
        m = (n-2)/2 ; 
    else
        m = (n-3)/2 ; 
    end
    
    %burada dışardan gelen değerleri fonksiyon içine atıyoruz
    for jj = 1 : m
        r = r0; 
        s = s0;
        Ear = 100;
        Eas = 100;
        
        while (Ear > EE || Eas > EE)
            % b ve c değerlerini hesaplıyoruz
            b(n) = a(n) ;
            b(n-1) = a(n-1)+ r*b(n);
            c(n) = b(n);
            c(n-1) = b(n-1) + r*c(n);
            for j = n-2 : -1 : 1
                b(j) = a(j) + r*b(j+1) + s*b(j+2);
                c(j) = b(j) + r*c(j+1) + s*c(j+2);
            end
            
            den = (c(2)*c(4) - c(3)^2);
            
           
            % hata değerlerini hesaplamak için c ve b değerlerini kontrol
            % ediyoruz
            dr = -(-c(3)*b(2) + b(1)*c(4)) / den;
            ds = (-c(2)*b(2) + c(3)*b(1)) / den;
            
            %normal r değerimize üstteki bulduğumuz değerleri ekliyoruz
            r = r + dr; 
            s = s + ds;
            
            % son değerlerle hata değerimizi buluyoruz
            Ear = abs(dr/r)*100; 
            Eas = abs(ds/s)*100;
            hata_eas=[hata_eas Eas];
            hata_ear=[hata_ear Ear];

        end

        x(2*jj - 1) = (r + sqrt(r^2 + 4*s)) / 2;
        x(2*jj) = (r - sqrt(r^2 + 4*s )) / 2;
        
        % sonraki iterasyon için değerleri set ediyoruz
        a = b(3 : n);
        n = length(a);
        r0 = r;
        s0 = s;
    end
    
    r = -a(2);
    s = -a(1);
    
    if(n == 2) % tek kök yoksa
        x(2*jj + 1) = (-s)/r;
    else(n == 3) % iki kök yoksa
        x(2*jj + 1) = (r + sqrt(r^2 + 4*s)) / 2;
        x(2*jj + 2) = (r - sqrt(r^2 + 4*s)) / 2;
   
    end
    fprintf(" EAR hata degeri: %f\n",hata_ear);
    fprintf(" \n\n\n\n");
    fprintf(" EAS hata degeri: %f\n",hata_eas);
    disp("x degerleri");
    disp(x');
  
end