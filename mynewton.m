function x = mynewton(f , f1 , x0 , n , tol)
% Solves f(x) = 0 by doing n steps of Newton ’s method starting at x0.
% Inputs : f -- the function
% f1 -- it ’s derivative
% x0 -- starting guess , a number
% n -- the number of steps to do
% Output : x -- the approximate solution

x = x0 ; % set x equal to the initial guess x0
for i = 1: n % Do n times
x = x - f( x )/ f1( x ) % Newton ;s formula , prints x too
end
%r residual error
r = abs( f ( x ))
if r > tol
warning( 'Istenilen tolerans degerine ulasilmadi')
end
