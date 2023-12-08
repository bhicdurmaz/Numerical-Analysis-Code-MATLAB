function L = mymidpoint(f,n,a,b)
% [a b] aralığında f fonksiyonu n adımda sayısal integrasyonu
h=(b-a)/n;
L = 0;
for i = 1: n
% accumulate height times width
L = L + f((i-1)*h+h/2)*h;
end
end