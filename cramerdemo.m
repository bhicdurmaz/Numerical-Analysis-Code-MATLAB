%% Computational cost for Cramer's rule


%% Introduction
% There are plenty of direct and iterative methods to solve a linear 
% algebraic system of equations. Using Cramer's rule, one can easily obtain
% the solution for small systems by hand. However, with the growth of the 
% unknowns, the method becomes computationally very expensive.
% Moreover, calculating a determinant by its definition may result in
% overflow or underflow if someone wanted to apply it on a computer.
% That is why Cramer's algorithm is not applied in computations.


%% Algorithm
% Let us regard a determinant of order $n$. When we expand it, we use $n$
% number of multiplications and $n-1$ additions (or subtractions) in
% forming the $n$ number of minors of order $n-1$. The sequence can be
% continued until we reach the determinant of a 2-by-2 matrix which
% consists of 2 multiplications and 1 subtraction, by definition. This kind
% of method suggests the set-up of a recursion. Now, let $r_n$ and $s_n$
% denote the multiplicative and additive cost (number of multiplicative and
% additive operations, respectively) of calculating the determinant of an 
% $n$ -by- $n$ matrix. Then we can formulate
% 
% $$r_n = n r_{n-1} + n, \quad n>2$$
% 
% and
% 
% $$s_n = n s_{n-1} + n-1, \quad n>2,$$
% 
% which are linear, inhomogeneous, variable coefficient one-term recursions.
% As we mentioned, $r_2 = 2$ and $s_2 = 1$. If we omitted the additive $n$
% and $n-1$ terms in the above two recursions, we would get the recursive
% creation of the factorial. Therefore, the computational cost of
% calculating a determinant is at least $\mathcal{O}(n!)$. According to 
% Cramer's rule (see <http://mathworld.wolfram.com/CramersRule.html>), we 
% need to calculate the value of $n+1$ determinants and additionally carry
% out $n$ divisions. So the final number of multiplicative ($M$) and additive
% ($A$) operations needed to determine the solution of a linear system is
% 
% $$ M = (n+1)r_n + n \quad\mathrm{and}\quad A = (n+1)s_n. $$ 
%
% According to Maple 16, there is an explicit solution for it, namely
% 
% $$ M = -\Gamma(n+2) + n^2e\Gamma(n,1) + ne\Gamma(n,1) + n \quad\mathrm{and}\quad A = \Gamma(n+2)-n-1, $$
% 
% where $e$ is the base of the natural logarithm, $\Gamma(k)$ is the
% (complete), $\Gamma(k,m)$ is the incomplete gamma function.
% (see <http://mathworld.wolfram.com/IncompleteGammaFunction.html>)
% The incomplete gamma function is defined a bit differently in MATLAB. By
% definition, the connection among the lower and upper incomplete gamma
% function and the complete gamma function is
% 
% $$ \Gamma(a,x) + \gamma(a,x) = \Gamma(a). $$
% 
% The built-in MATLAB function $\texttt{gammainc}$ calculates
% 
% $$ P(a,x) = \frac{\gamma(a,x)}{\Gamma(a)}, $$
% 
% therefore the upper incomplete gamma function we obtained for the exact
% solution of the recursions with Maple can be expressed with the built-in
% MATLAB functions $\texttt{gamma}$ and $\texttt{gammainc}$ as
% 
% $$ \Gamma(a,x) = \Gamma(a)[1-P(a,x)]. $$
% 
% Substituting this formula to the exact solutions for $M$ and $A$, after
% rearranging we obtain
% 
% $$ M = -\Gamma(n+2) + n + (n+1)ne\Gamma(n)[1-P(n,1)] \quad\mathrm{and}\quad A = \Gamma(n+2)-n-1. $$


%% Examples
% Since core MATLAB has the incomplete gamma function built in, we 
% implemented both variants, i.e. the recursive and the explicit method. The
% user can choose which method to use. Our function, $\texttt{cost4cramer}$
% returns the number of multiplicative and additive operations for a 
% linear system of size $n$.
% 
% Now let's see an example for $n=3$. It is often calculated by hand in
% many applications (e.g. one degree of freedom motion in 3D).
[M A] = cost4cramer(3) % could have been [M A] = cost4cramer(3,'recursive')
%%
% Since we called $\texttt{cost4cramer}$ with one input argument, it
% calculates the operation cost using a for-loop. What is the case for $n=5$?
[M A] = cost4cramer(5,'explicit')
%%
% This time the operation count is determined by the explicit formula
% including gamma functions. It is evident that it is very inconvenient to
% calculate all of it by hand. The next figure shows the factorial
% complexity of Cramer's rule for both multiplicative and additive
% operations.
n = 2:14;
M = zeros(size(n)); A = M;
for k = 2:14
    [M(k-1) A(k-1)] = cost4cramer(k);
end
[ax, Mline, Aline] = plotyy(n,M,n,A,'semilogy');
set(get(ax(1),'Ylabel'), 'FontSize',16, 'String','Multiplicative'); 
set(get(ax(2),'Ylabel'), 'FontSize',16, 'String','Additive');
set([Mline Aline], 'Marker','o');
xlabel('n','FontSize',16);

%%
% There is a minor difference in the computed results regarding the
% recursive and the explicit approach:
difference = n;
for k = 2:14
    M_rec = cost4cramer(k,'recursive');
    M_exp = cost4cramer(k,'explicit');
    difference(k-1) = abs(M_rec - M_exp);
end
plot(n,difference,'-o');
xlabel('n', 'FontSize',16);
ylabel('$|M_{\rm{recursive}}-M_{\rm{explicit}}|$', ...
    'FontSize',16, 'Interpreter','latex');


%% Conclusion
% An analytical and numerical study was carried out to investigate the
% operation count for Cramer's rule. As expected, it becomes prohibited
% even for small $n$. Moreover, its numerical applicability is worse than
% that of the other direct methods.