A=rand(1000,1000);
bb=rand(10000,1);

tic
[L U P]=lu(A);
b=[];
for i=1:10;
    b=bb((i-1)*1000+1:i*1000);
    
d=P*b;
y=L\d;
x=U\y;
 % Check the result
end;
rnorm=norm(A*x-b)
toc

tic 
for i=1:10;
    b=bb((i-1)*1000+1:i*1000);
x2=A\b;
end;
rnorm2=norm(A*x2-b)
toc