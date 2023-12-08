function x=gauss_seidel_relaxation

A=[5 -2 5 4;2 7 3 1;-1 3 10 1;1 1 3 9];
b=[1 1 0 2]';
n=length(b);
x=zeros(1,n); %Create an empty matrix for x
w=1; %Relaxation constant
for t=1:5%maximum iteration
error=0;
for i=1:n,
s=0; xb(i)=x(i);
for j=1:n,
if i~=j, s=s+A(i,j)*x(j); 
end
end
x(i)=w*(b(i)-s)/A(i,i)+(1-w)*x(i);
end
end
x=x';

x_gercek=A\b;
fprintf('Iteration no = %3.0f, error = %7.2e \n', t, error)
%if error<10^-4, break; end %tolerance value
%end
error_yuzde=sqrt(sum((x-x_gercek).^2))*100/sqrt(sum((x_gercek).^2))
error_kalinti=sqrt(sum((A*x-b).^2))

error1=max(abs(x-xb'))
error2=sqrt(sum((x-xb').^2))

