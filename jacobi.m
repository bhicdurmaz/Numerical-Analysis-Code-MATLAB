%% Jacobi Method
%% Solution of x in Ax=b using Jacobi Method
% * _*Initailize 'A' 'b' & intial guess 'x'*_
%%
A=[7,-1, 1;2 4 2;1 -2 9]
b=[5 2 10]'
x=[0 0 0]'
n=size(x,1);
normVal=Inf; 
%% 
% * _*Tolerence for method*_
tol=1e-4; itr=0;
%% Algorithm: Jacobi Method
%%
while normVal>tol
    xold=x;
    
    for i=1:n
        sigma=0;
        
        for j=1:n
            
            if j~=i
                sigma=sigma+A(i,j)*xold(j);
            end
            
        end
        
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    itr=itr+1;
    normVal=abs(xold-x)
end
%%
fprintf('Solution of the system is : \n%f\n%f\n%f in %d iterations',x,itr);