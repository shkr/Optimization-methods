clear all
set(0,'RecursionLimit',700)

%% problem data:

%% Test Data (1) %%
A = [1 2 1 1 0; 3 1 -1 0 1; 0 1 1 1 0];
b = [5 8 3]';
c = [4 2 1 1 -3]';
xk = [1 1 1 1 5]';

k=0;
epsilon = 1e-5;
beta    = 0.5;
%% Solution (1) %%
% xopt = 0.0209
%       1.9791
%       0.9789
%       0.0420
%       6.9370
% ans = -15.7483


%% Optimization routine
str = sprintf('This optimization using epsilon = %d and beta = %d',epsilon,beta);
disp(str);
path=xk;
[xopt,k,message,path] = affsalg(xk,A,c,beta,epsilon,k+1,path);    

disp(message);
disp(xopt);
disp('Current function value:');
disp(c'*xopt);