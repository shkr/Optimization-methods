clear all


%% problem data:

%% Test Data (1) %%
% A = [1 2 1 1 0; 3 1 -1 0 1; 0 1 1 1 0];
% b = [5 8 3]';
% c = [4 2 1 1 -3]';
% xk = [1 1 1 1 5]';
% 
% k=0;
% epsilon = unifrnd(0,0.5);
% beta    = unifrnd(0,1);
%% Solution (1) %%
% xopt = 0.0209
%       1.9791
%       0.9789
%       0.0420
%       6.9370
% ans = -15.7483

%% Test Data (2) %%
% E=unifrnd(0,0.5);
% E=0.25;
% A = [ 1  0  0  1  0  0  0  0  0;
%      -1  0  0  0  1  0  0  0  0;
%       1  1  0  0  0  1  0  0  0;
%       E -1  0  0  0  0  1  0  0;
%       0  1  1  0  0  0  0  1  0;
%       0  E -1  0  0  0  0  0  1; ];
% 
% b = [1 -E 1 0 1 0]';
%   
% c = [0  0  -1  0  0  0  0  0  0]';
% 
% xk =[E  E^2 E^3 0 0 0 0 0 0]';
% 
% k=0;
% epsilon = unifrnd(0,0.5);
% beta    = unifrnd(0,1);

%% Solution (2) %%
% xopt =       0.2500
%              0.0625
%              0.0156
%              0
%              0
%              0
%              0
%              0
%              0
% ans = -0.0156
%% Test Data (3) %%
%E=unifrnd(0,0.5);
E=0.25;
M=1;%unifrnd(1,100);
A = [ 1  0  0  0  1  0  0  0  0  0  0  0;
     -1  0  0  0  0  1  0  0  0  0  0  0;
      1  1  0  0  0  0  1  0  0  0  0  0;
      E -1  0  0  0  0  0  1  0  0  0  0;
      0  1  1  0  0  0  0  0  1  0  0  0;
      0  E -1  0  0  0  0  0  0  1  0  0;
      0  0  1  1  0  0  0  0  0  0  1  0;
      0  0  E -1  0  0  0  0  0  0  0  1;];
b = [1 -E 1 0 1 0 1 0]';
   
c =  [0  0  0 -1  0  0  0  0  0  0  0  0]';
 
xk = [M*E  M*E^2 M*E^3 M*E^4 0 0 0 0 0 0 0 0]';

%xk = 0.5*ones(1,12)';
k=0;
epsilon = unifrnd(0,0.000005);
beta    = unifrnd(0,0.000001);

%% Solution (3) %%
% xopt =        0.2500
%                 0.0625
%                 0.0156
%                 0.0039
%                 0
%                 0
%                 0
%                 0
%                 0
%                 0
%                 0
%                 0

% ans = -0.0039

%% Optimization routine
str = sprintf('This optimization using epsilon = %d and beta = %d',epsilon,beta);
disp(str);

[xopt,k,message] = affsalg(xk,A,c,beta,epsilon,k+1);    

disp(message);
disp(xopt);
disp('Current function value:');
disp(c'*xopt);