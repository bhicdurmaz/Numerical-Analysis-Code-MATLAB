
format long ;

n =1 % iterasyon sayısı

 f= @(x) [(x(1).^2+x(1)*x(2)-10);(x(2)+3*x(1)*x(2).^2-57)];

% jacobian matrisi
Df = @(x)[2*x(1)+x(2) , x(1) ;  3*x(2).^2, 1+6*x(1)*x(2)]

x = [1.5 3.5]' % başlangıç değerleri
x_0=[1.5 3.5]';
for i = 1: n
Dx = - Df(x)\ f(x); % lineer denklem sistemi çözümü ile "Dx: delta x vektörü" bulma
x = x + Dx % delta x i ekleyerek bir sonraki x vektörünü bulma
err_1=norm(f(x)) % kalıntı hatasının vektörünü bulma ve l2 hataı hesaplama
err_2=max(abs(f(x))) %maximum hata

i
end


max(abs(x-x_0)) %iterasyon hata vektörünün maximum hatası