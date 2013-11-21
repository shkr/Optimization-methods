clear all
verbose =0;

%% Problem (1)
% A = [1 2 1 1 0; 3 1 -1 0 1; 0 1 1 1 0];
% b = [5 8 3]';
% c = [4 2 1 1 -3]';
% x = [1 1 1 1 5]';
% s = [4 9 3 4 4]';
% p = [5 1 0]';

%% Problem (2)

% E=0.25;
% A = [ 1  0  0 -1  0  0  0  0  0;
%       1  0  0  0  1  0  0  0  0;
%       E  1  0  0  0  1  0  0  0;
%      -E  1  0  0  0  0 -1  0  0;
%       0  E  1  0  0  0  0  1  0;
%       0 -E  1  0  0  0  0  0 -1; ];
% b = [E  1  1  0  1  0]';
% c = [0  0  -1  0  0  0  0  0  0]';
% 
% x =[E  E^2 E^3 E-E (1-E) 1-(E^2)-(E^2) E^2-E^2 (1-E^3-E^3) E^3-E^3]';

%% Problem (3)

A = [1  1   1   0;
    -1  1   0   1;];
b = [2  1]';
c = [-1 -2]';
x = [0.1  0.1  1.8  1]';
s = [2 3 4 1]';
p = [-4 -1]';

iter=0;
ephsilon = 1e-4;
pathx=[];
paths=[];
pathp=[];

while sum(s'*x) > ephsilon
   iter=iter+1;
   %% Find affine scaling search direction
   [dx,dp,ds]=delta(A,b,c,x,p,s);
   
   %% Backtrack if necessary
   alpha=1;
   while min( min(x+alpha*dx),min(s+alpha*ds) ) <= 0,
      alpha = .5*alpha;
   end
   
   %% Update of solutions
   x = x+ (alpha*dx); s = s+ (alpha*ds); p = p+ (alpha*dp);
   
   dg = sum(x.*s);
   disp(['Duality gap  = ', num2str(dg),' at iter. no.',num2str(iter)])
   
   pathx = [pathx x(1:2)];
   paths = [paths s(1:2)];
   pathp = [pathp p(1:2)];
   
   %% display
   if verbose==1
       
       disp('The search direction for x and the new x are:')
       [dx x]
       disp('The search direction for s and the new s are:')
       [ds s]
       disp('The search direction for y and the new p are:')
       [dp p]
   end

end
disp('The optimal x and s are: ')
[x s]

%Solution path for affine scaling algorith in Bertsimas example 9.1
x1 =[0.1 0.144 0.198 0.262 0.364 0.530 0.546 0.499];
x2 =[0.1 0.188 0.359 0.667 1.068 1.339 1.439 1.491];

hold all;
h=area([0,0.5,2],[1,1.5,0]);
set(h(1),'FaceColor',[0,0.75,0.75]);
plot(pathx(1,:)',pathx(2,:)','y--o');
plot(x1,x2,'r--+');
plot([0,0.5],[1,1.5]);
plot([0.5,2],[1.5,0]);





