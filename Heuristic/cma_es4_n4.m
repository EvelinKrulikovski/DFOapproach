function [fval,eigenvalue,exitflag,output,minNZ,bestever,sumNZ,s]=cma_es4_n4

%
% Purpose: 
%         Runs CMA-ES for experiment 4, with a four-dimensional matrix 
%
% Output:
%       fval       - minimum function value 
%       eigenvalue - obtained eigenvalues
%       exitflag   - stop criterion reached
%       output     - structure with various histories and solutions
%       minNZ      - smallest variable in I_nz in absolute value (min(|NZ|)
%       bestever   - structure containing overall best solution
%       sumNZ      - sum in absolute value of the variables in I_nz
%                    (sum|NZ|)
%       s          - comparison between the given eigenvalues and the ones
%                    obtained by the heuristic
%                    (||vec(\Lambda(X)-\Lambda||_2)
%

format long

n=7;
j=5;
k=10^5;
indexnz = [5 6 7];
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
    cmaes('funcinv4_n4', initial_point,[],opts);

disp([])
disp(['Best solution found: ', num2str(x')])
disp([' with fitness value: ', num2str(fval), '  and feval  ', num2str(counteval)])


% position is zero
A(1,3)=0;A(1,4)=0;
A(2,4)=0;
A(3,1)=0;
A(4,1)=0;A(4,2)=0;
% Nz variables: x5 = (1,2), x6 = (2,3), x7= (3,4).
A(1,2)=x(5); A(2,3)=x(6); A(3,4)=x(7);
% A is symmetric then
A(2,1)=x(5); A(3,2)=x(6); A(4,3)=x(7);
% Free: x1=(1,1), x2=(2,2), x3=(3,3), x4=(4,4)
A(1,1)=x(1); A(2,2)=x(2); A(3,3)=x(3); A(4,4)=x(4);

%format short
A;
eigenvalue=sort(eig(A),4,"ascend");
minNZ=min(abs(x(indexnz)));
sumNZ=sum(abs(x(indexnz)))*2;

v = [0.3820,1.3820, 2.6180, 3.6180]';
s =norm(v-eigenvalue);

end




