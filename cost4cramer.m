function [M A] = cost4cramer(n,method)
%COST4CRAMER   Operation cost for Cramer's rule.
%   [M A] = COST4CRAMER(N,METHOD) returns the number of multiplicative (M)
%   and additive (A) operat10^3ions required for solving a system of linear 
%   equations with N unknowns. The computational cost is determined by
%   METHOD, being either 'recursive' or 'explicit'.
%
%   See also   CRAMERDEMO

%   Zoltán Csáti
%   2015/04/06

% Check input
if nargin < 1
    n = 2;
    method = 'recursive';
elseif nargin < 2
    method = 'recursive';
end

if n < 2
    error('The regarded system must contain at least 2 equations.');
end

switch method
    case 'recursive'
        % Determine the cost of the calculation of one determinant
        r = 2; % 2 multiplications for a determinant of order 2
        s = 1; % 1 subtraction for a determinant of order 2
        % Perform an iteration to determine the cost of the determinant of order n
        for k = 3:n
            r = k*r + k;
            s = k*s + k-1;
        end
        % The total cost: n+1 determinants of order n and n divisions
        M = (n+1)*r + n;
        A = (n+1)*s;
    case 'explicit'
        M = -gamma(n+2) + n + (n+1)*n*exp(1)*gamma(n)*(1-gammainc(1,n));
        A =  gamma(n+2) - n - 1;
    otherwise
        error('MATLAB:cost4cramer:wrongMethod', ...
        'Provided method must be either ''recursive'' or ''explicit''. ');
end