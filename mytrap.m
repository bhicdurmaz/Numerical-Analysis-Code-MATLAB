function T = mytrap(x,y)
% Calculates the Trapezoid rule approximation of the integral from data
% Inputs: x -- vector of the x coordinates of the partitian
% y -- vector of the corresponding y coordinates
% Output: returns the approximate integral
n = length(x); T = 0;
for i = 1:n-1
% accumulate twice the signed area of the trapezoids
T = T + (y(i) + y(i+1)) * (x(i+1) - x(i));
end
T = T/2; % correct for the missing 1/2 end