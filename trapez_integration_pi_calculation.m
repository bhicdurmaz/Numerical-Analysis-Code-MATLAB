% Calculates pi using a trapezoid approximation of the unit circle .
format long
n = 100; % evaluate points on the circle
t = linspace (0 ,2*pi , n +1);
x = cos( t );
y = sin( t );
plot (x , y )
A = 0 % accumulate ( twice ) the trapezoid area
for i = 1: n
A = A - ( y ( i )+ y ( i +1))*( x ( i +1) - x ( i ));
end
A = A /2 % correct for the missing 1/2