% Program to find QR decomposition of Matrix A using Gram-Schmidt Method
%==========================================================================
% Required Inputs:
%==========================================================================
% Coefficient Matrix, A (m-by-n)
%==========================================================================
% Output
%==========================================================================
% Orthogonal Matrix, Q
% Upper Traingular Matrix, R
%==========================================================================
% Version 1.0
% Date: 12th September,2019
%==========================================================================
% Developed by : Arshad Afzal, India, Email: arshad.afzal@gmail.com 
%==========================================================================
% Copyright (c) 2019, Arshad Afzal
%==========================================================================
fprintf('\n         ==================================================================================');
fprintf('\n                      QR Decomposition using Gram-Schmidt orthogonalization ');
fprintf('\n         ==================================================================================');
fprintf('         ----------------------------------------------------------------------------------');
% Required Input
A = input('\nEnter the coeffcient matrix, A :');
%==========================================================================
[m,n] = size(A);
%==========================================================================
% Initialization
z = zeros(n,1);
Q = zeros(m,n);
R = zeros(n,n);
%==========================================================================
% Main Program for QR Algorithm
%==========================================================================
% Initializing the Q vector
for i = 1:m
    Q(i,1) = A(i,1) / norm(A(:,1));
end
% Iterative Loop
for i = 2:n
    
    sum = zeros(m,1);
    
    for k = 1:i-1
          sum = sum + (A(:,i)'*Q(:,k))*Q(:,k);
    end
    
    z = A(:,i) - sum;
    
    for j = 1:m
        Q(j,i) = z(j)/norm(z);
    end
end
% Calculation for R
for i = 1:m
    for j = i:n
        R(i,j) = Q(:,i)'*A(:,j);
    end
end
   
%==========================================================================
% QR decomposition of A
fprintf('\n  QR DECOMPOSITION OF A :\n');
Q
R
%==========================================================================
    
    