
function [xopt, k, message] = affsalg(xk,A,c,beta,ephsilon,k)
%% Inputs for the affine scaling algorithm %%
% A = m x n matrix
% b = m x 1 matrix
% c = n x 1 matrix
%% Initialization with some feasible value x0 > 0
% X0 : Initial value
% K  : Iteration number
% ephsilon : Optimality tolerance
% beta     : Step size

Xk    = diag(xk);
lenXk = size(Xk);
p    = pinv(A*(Xk^2)*A')*(A*(Xk^2)*c);
r    = c-(A'*p);
e    = ones(lenXk(1));

%%Optimality and unboundedness checks
opt = e'*Xk*r<ephsilon;
unbnd = (-(Xk^2)*r>=0);

if (opt==1)
    %disp(A*(Xk^2)*A');
    disp((A'*p));
    message = sprintf('Optimality reached at iteration no. %d',k);
    xopt=xk;
    k=k+1;
    return
end
if (unbnd==1)
    message = sprintf('Unbounded solution : -inf at iteration no. %d',k);
    xopt=xk;
    k=k+1;
    return
else
    message = sprintf('In progress');
end 

xk = xk - beta*(Xk^2*r)/norm(Xk*r);

[xopt, k, message] =  affsalg(xk,A,c,beta,ephsilon,k+1);

end
    