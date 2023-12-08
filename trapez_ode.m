function [t,y] = trapez_ode(t0,y0,t_end,h,fcn,tol)
n = fix((t_end-t0)/h)+1;
t = linspace(t0,t0+(n-1)*h,n)'; y = zeros(n,1);
y(1) = y0;
i = 2;
% advancing while i <= n
fyt = feval(fcn,t(i-1),y(i-1));
yt1 = y(i-1)+h*fyt; % trapezoidal iteration
count = 0;
diff = 1;
while diff > tol & count < 10
yt2 = y(i-1) + h*(fyt+feval(fcn,t(i),yt1))/2; diff = abs(yt2-yt1);
yt1 = yt2;
count = count +1;
end
if count >= 10
disp('Not converging after 10 steps at t = ')
fprintf('%5.2f\n', t(i)) 
end
y(i) = yt2;
i = i+1; 
end