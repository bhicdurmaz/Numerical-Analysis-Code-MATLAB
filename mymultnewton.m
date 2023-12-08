

format long ;
n =2 % set some number of iterations , may need adjusting
%f = @(x)[ x(1)^3+x(2)-1 ; x(2)^3-x(1)+1] % the vector function
 f= @(x) [(x(1).^2+x(2).^2-9);(x(1).^3-x(2)-x(1))];
% the matrix of partial derivatives
Df = @(x)[2*x(1) , 2*x(2) ; (3)*(x(1))^(2)-1 , -1]

x = [-2 -2]' % starting guess
for i = 1: n
Dx = - Df(x)\ f(x); % solve for increment
x = x + Dx % add on to get new guess
err=norm(f(x)) % see if f(x) is really zero
i
if err<10^(-15)
    break;
end;
end

