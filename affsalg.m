
function [xopt, k, message, path] = affsalg2(x0,A,c,beta,ephsilon,k,path)

%% Inputs for the affine scaling algorithm 
% A = m x n matrix
% b = m x 1 matrix
% c = n x 1 matrix
%% Initialization with some feasible value x0 > 0
% X0 : Initial value
% K  : Iteration number
% ephsilon : Optimality tolerance
% beta     : Step size

xk   = x0';
Xk   = diag(xk);
p    = inv(A*(Xk^2)*A')*(A*(Xk^2)*c);
r    = c-(A'*p);

lenXk = size(Xk);
e    = ones(lenXk(1),1);



while ( (e'*Xk*r>ephsilon) || (min(r)<0)) %%Optimality 
    k=k+1;
    if -(Xk^2)*r>=0                       %%unboundedness checks
         message = sprintf('Unbounded solution : -inf at iteration no. %d',k);
         xopt=xk;
         return
    end
    
    message = sprintf('In progress');
    xk = xk - ((beta*(Xk^2*r))/max(Xk*r));

    
    path=[path xk];
    Xk    = diag(xk);
    p    = inv(A*(Xk^2)*A')*(A*(Xk^2)*c);
    r    = c-(A'*p);
   
end


message = sprintf('Optimality reached at iteration no. %d',k);
xopt=xk;
return

end 




    