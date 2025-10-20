function [fval,eigenvalue,exitflag,output,minNZ,bestever,sumNZ,s]=cma_es1


%
% Purpose: 
%         Runs CMA-ES for experiment 1
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
indexnz = [3 4 7]; 
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
    cmaes('funcinv1', initial_point,[],opts);

disp([])
disp(['Best solution found: ', num2str(x')])
disp(['with fitness value: ', num2str(fval), '  and feval  ', num2str(counteval)])

%format short

A=[x(1) x(2) x(3) 0; x(2) 3.1416 x(4) x(5); x(3) x(4) x(6) 0; 0 x(5) 0 x(7)];
eigenvalue=sort(eig(A),4,"ascend");
minNZ=min(abs(x(indexnz)));
sumNZ=abs(x(7))+2*(abs(x(3))+abs(x(4)));

v= [1.0,2.0,3.0,4.0]';
s =norm(v-eigenvalue);

 end




