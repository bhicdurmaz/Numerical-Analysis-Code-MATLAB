%Tablo 4.1 için aşağıdaki kodları sırayla çalıştırınız:

f=@(t,y)-100*y;

[T Y]=myeuler(f,[0 0.2],1,2);
Y(end)
[T Y]=myeuler(f,[0 0.2],1,4);
Y(end)
[T Y]=myeuler(f,[0 0.2],1,10);
Y(end)
[T Y]=myeuler(f,[0 0.2],1,20);
Y(end)
[T Y]=myeuler(f,[0 0.2],1,200);
Y(end)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tablo 4.2 için aşağıdaki kodları sırayla çalıştırınız:


[T Y]=backwardEuler(f, 1, [0 0.2], 0.1);
Y(end)
[T Y]=backwardEuler(f, 1, [0 0.2], 0.05);
Y(end)
[T Y]=backwardEuler(f, 1, [0 0.2], 0.02);
Y(end)
[T Y]=backwardEuler(f, 1, [0 0.2], 0.01);
Y(end)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Tablo 4.3 için aşağıdaki kodları çalıştırınız:
lambda=-1;
f2=@(t,y)lambda*y+(1-lambda)*cos(t)-(1+lambda)*sin(t);
%y_gercek=sin(t)+cos(t)

[T Y]=myeuler(f2,[0 1],1,2); %h=0.5 t=1 Euler
abs(Y(end)-(sin(1)+cos(1)))

%Tablo 4.4 için aşağıdaki kodları çalıştırınız:

[T Y]=backwardEuler(f2, 1, [0 2], 0.5); %h=0.5 t=2 BackEuler
abs(Y(end)-(sin(2)+cos(2)))

%Tablo 4.5 için aşağıdaki kodları çalıştırınız:

[T Y]=trapezMethod(f2, 1, [0 2], 0.5); %h=0.5 t=2 Trapez
abs(Y(end)-(sin(2)+cos(2)))

