function [fval,eigenvalue,exitflag,output,minNZ,bestever,sumNZ,s]=cma_es5
format long

%
% Purpose: 
%         Runs CMA-ES for experiment 5 
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

n=3;
j=5;
lb=0.5*ones(n,1);
ub=j*ones(n,1);

initial_point=0.5+rand(n,1);

% Define CMA-ES options
opts.LBounds=lb;
opts.UBounds=ub;

% Run the CMA-ES Algorithm
[x, fval, counteval, exitflag, output, bestever] = ...
    cmaes('funcinv5', initial_point,[],opts);

disp([])
disp(['Best solution found: ', num2str(x')])
disp([' with fitness value: ', num2str(fval), '  and feval  ', num2str(counteval)])

format short

A=zeros(7,7);
%Diagonal elements
A(1,1)=1; A(2,2)=1; A(3,3)=x(2);A(5,5)=-x(2);A(6,6)=-1.0; A(7,7)=-1.0;
%Upper triangular
A(1,3)=x(1); A(2,3)=x(1); A(3,4)=x(3); A(4,5)=x(3);A(5,6)=x(1);A(5,7)=x(1);
%Simetry
A(3,1)=x(1); A(3,2)=x(1); A(4,3)=x(3); A(5,4)=x(3);A(6,5)=x(1);A(7,5)=x(1);

%format short
%A
eigenvalue=sort(eig(A),7,"ascend");
minNZ=min(abs([x(1) x(2) x(3)]));
sumNZ=sum(abs([x(1) x(2) x(3)]))*2+sum(abs([x(1) x(3)]))*2+sum(abs(x(1)))*4;

v= [-2.0,-1.0,-1.0,0.0,1.0,1.0,2.0]';
s =norm(v-eigenvalue);

end




