function L = myrightsum(x , y )
% produces the left sum from data input .
% Inputs : x -- vector of the x coordinates of the partition
% y -- vector of the corresponding y coordinates
% Output : returns the approximate integral
n = length( x );
L = 0;
for i = 2: n
% accumulate height times width
L = L + y( i )*( x( i) - x( i-1 ));
end
end