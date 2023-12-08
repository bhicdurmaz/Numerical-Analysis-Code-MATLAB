function x=gauss_seidel(A,b);
% A is a matrix
% Use Gauss-Seidel iterative method to solve x for Ax=b;
[n,m]=size(A);
if n~=m | n<0
error('A must be a square matrix');
end
%Tol = 1e-4; % Set precision
Tol=1e-30;
MaxIter=2; % Set maximum iterations
Iter = 0;
x0 = [1 1 1]'; % Initial value
x = zeros(n,1); % output x
while Iter < MaxIter
for i=1:n
x(i) =(-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n)+b(i))/A(i,i);
end
abs(x-x0);

if norm(x-x0,inf)<Tol
  norm(x-x0,inf);
  norm(x-x0);
break;
end
norm(x-x0,inf);
  norm(x-x0);
x0=x

Iter = Iter+1;
end
norm(x-x0,inf);
  norm(x-x0)
disp(['Number of Iterations:' num2str(Iter)]);
if Iter >= MaxIter
disp('Maximum Number of Iterations Exceeded!');
end
