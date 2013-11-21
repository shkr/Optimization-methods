function [dx,dp,ds]=delta(A,b,c,x,p,s)
% Finds a affine scaling search direction for LP 
% Input:
%   A,b,c   data for LP problem max c'x s.t. Ax=b, x>=0
%   x,p,s   current (int) feasible primal-dual pair, x>0, s>0

[m,n]=size(A);
M=[ 
   zeros(n)      A'         -eye(n)
     A           zeros(m)   zeros(m,n)
   diag(s)       zeros(n,m)   diag(x) 
                       ];
                   
if min(x) < 0 || min(s) < 0,
     disp('WARNING : x,p are not interior point')
end
%RHS=[-(A'*y-s-c) ; -(A*x-b);-x.*s];
RHS=[zeros(n,1) ; zeros(m,1);-x.*s];
sol=M\RHS;
dx=sol(1:n);dp=sol(n+1:n+m);ds=sol(n+m+1:end);