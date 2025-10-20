function [fval,eigenvalue,exitflag,output,minNZ,bestever,sumNZ,s]=cma_es2

%
% Purpose: 
%         Runs CMA-ES for experiment 2
%
% Output:
%       fval       - minimum function value 
%       eigenvalue - obtained eigenvalues
%       exitflag   - stop criterion reached
%       output     - structure with various histories and solutions
%       minNZ      - smallest variable in I_nz (min(|NZ|)
%       bestever   - structure containing overall best solution
%       sumNZ      - sum in absolute value of the variables in I_nz
%                    (sum|NZ|)
%       s          - comparison between the given eigenvalues and the ones
%                    obtained by the heuristic
%                    (||vec(\Lambda(X)-\Lambda||_2)
%


format long

n=11;
j=5;
k=10^5;
indexnz = [8 9 10 11];
lb=-k*ones(n,1);
ub=k*ones(n,1);
lb(indexnz)=0.5; 
ub(indexnz)=j;

initial_point=0.5+rand(n,1);

% Define CMA-ES options
opts.LBounds=lb;
opts.UBounds=ub;

% Run the CMA-ES Algorithm
[x, fval, counteval, exitflag, output, bestever] = ...
    cmaes('funcinv2', initial_point,[],opts);

disp([])
disp(['Best solution found: ', num2str(x')])
disp([' with fitness value: ', num2str(fval), '  and feval  ', num2str(counteval)])

%format short

% position is zero
A(1,3)=0;A(1,4)=0;A(1,5)=0;A(1,6)=0;A(1,7)=0;
A(2,4)=0;A(2,5)=0;A(2,6)=0;
A(3,5)=0;A(3,7)=0;
A(4,6)=0;A(4,7)=0;
A(5,6)=0;A(5,7)=0;
A(6,7)=0;
% A is symmetric then
A(3,1)=0;A(4,1)=0;A(5,1)=0;A(6,1)=0;A(7,1)=0;
A(4,2)=0;A(5,2)=0;A(6,2)=0;
A(5,3)=0;A(7,3)=0;
A(6,4)=0;A(7,4)=0;
A(6,5)=0;A(7,5)=0;
A(7,6)=0;

%-3 in the (2,7) and (3,6) position.
A(2,7)=-3; A(7,2)=-3;
%A is symmetric then -3 in the (7,2) and (6,3) position
A(3,6)=-3; A(6,3)=-3;

% Nz variables: x8 = (1,2), x9 = (2,3), x10= (3,4), x11= (4,5).
A(1,2)=x(8); A(2,3)=x(9); A(3,4)=x(10); A(4,5)=x(11);
% A is symmetric then
A(2,1)=x(8); A(3,2)=x(9); A(4,3)=x(10); A(5,4)=x(11);

% Free: x1=(1,1), x2=(2,2), x3=(3,3), x4=(4,4), x5=(5,5), x6=(6,6), x7=(7,7)
A(1,1)=x(1); A(2,2)=x(2); A(3,3)=x(3); A(4,4)=x(4); A(5,5)=x(5); A(6,6)=x(6); A(7,7)=x(7);

%A
eigenvalue=sort(eig(A),7,"ascend");
minNZ=min(abs(x(indexnz)));
sumNZ=sum(abs(x(indexnz)))*2;

v = [0, 0.3672,1.0571,2.3745,  4.4681, 7.0357, 8.6973 ]';
s =norm(v-eigenvalue);

end




