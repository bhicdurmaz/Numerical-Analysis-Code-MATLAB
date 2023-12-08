function [t,y] = mybackeuler(t0,y0,t_end,h,fcn,tol)
n = fix((t_end-t0)/h)+1;
t = linspace(t0,t0+(n-1)*h,n)'; y = zeros(n,1);
y(1) = y0;
i = 2;
while i <= n
%
% forward Euler estimate %
yt1 = y(i-1)+h*feval(fcn,t(i-1),y(i-1));

%yt2 = y(i-1) + h*feval(fcn,t(i),yt1); 

count = 0;
diff = 1;
while diff > tol & count < 10
yt2 = y(i-1) + h*feval(fcn,t(i),yt1); diff = abs(yt2-yt1);
yt1 = yt2;
count = count +1;
end
count
y(i) = yt2;

i = i+1; 
end
