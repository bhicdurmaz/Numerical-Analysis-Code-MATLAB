function [ x e1 e2 ] = mybisect(f ,a ,b , n )
% function [x e] = mybisect (f,a,b,n)
% Does n iterations of the bisection method for a function f
% Inputs : f -- a function
% a,b -- left and right edges of the interval
% n -- the number of bisections to do.
% Outputs : x -- the estimated solution of f(x) = 0
% e -- an upper bound on the error
% evaluate at the ends and make sure there is a sign change
c = f ( a ); d = f ( b );
if c * d > 0.0
error( 'Fonksiyonun isareti araligin son noktalarinda ayni. ')
end
disp( 'x y')
for i = 1: n
% find the middle and evaluate there
x = ( a + b )/2;
y = f ( x );
disp ([ x y ])
if y == 0.0 % solved the equation exactly
a = x ;
b = x ;
break % jumps out of the for loop
end
% decide which half to keep , so that the signs at the ends differ
if c * y < 0
b = x ;
else
a = x ;
end
end
% set the best estimate for x and the error bound

e1 = (b - a )/2;
e2=abs(f(x));
end
