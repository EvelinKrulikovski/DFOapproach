function [fval, eigenvalue,exitflag,output,minNZ,sumNZ,s]=GEN3

%
% Purpose: 
%         Runs Genetics for experiment 3
%
% Output:
%       fval       - minimum function value 
%       eigenvalue - obtained eigenvalues
%       exitflag   - stop criterion reached
%       output     - a structure that contains output from each generation
%                    and other information about the performance of the 
%                    algorithm
%       minNZ      - smallest variable in I_nz in absolute value (min(|NZ|)
%       sumNZ      - sum in absolute value of the variables in I_nz
%                    (sum|NZ|)
%       s          - comparison between the given eigenvalues and the ones
%                    obtained by the heuristic
%                    (||vec(\Lambda(X)-\Lambda||_2)
%

format long

n=5;
j=5;
k=10^5;
indexnz = [1 2 3 4 5];
lb=-k*ones(n,1);
ub=k*ones(n,1);
lb(indexnz)=0.5; 
ub(indexnz)=j;

funcao = @(x)funcinv3(x);
% Define GA options
options = optimoptions('ga','Display','iter','PopulationSize',50,'MaxGenerations',1000);

% Run the Genetic Algorithm
[x,fval,exitflag,output] = ga(@(x) funcao(x), n, [], [], [], [], lb, ub, [], options);
disp(['Best solution found: ', num2str(x), ' with fitness value: ', num2str(fval)]);

% position is zero
A(1,1)=0;A(1,2)=0;         A(1,4)=0;A(1,5)=0;A(1,6)=0;A(1,7)=0;A(1,8)=0;A(1,9)=0;A(1,10)=0;
A(2,1)=0;A(2,2)=0;         A(2,4)=0;A(2,5)=0;A(2,6)=0;A(2,7)=0;A(2,8)=0;A(2,9)=0;A(2,10)=0;
                  A(3,3)=0;         A(3,5)=0;A(3,6)=0;A(3,7)=0;A(3,8)=0;A(3,9)=0;A(3,10)=0;
A(4,1)=0;A(4,2)=0;         A(4,4)=0;         A(4,6)=0;A(4,7)=0;         A(4,9)=0;A(4,10)=0;
A(5,1)=0;A(5,2)=0;A(5,3)=0;         A(5,5)=0;                  A(5,8)=0;A(5,9)=0;A(5,10)=0;
A(6,1)=0;A(6,2)=0;A(6,3)=0;A(6,4)=0;         A(6,6)=0;A(6,7)=0;A(6,8)=0;A(6,9)=0;A(6,10)=0;
A(7,1)=0;A(7,2)=0;A(7,3)=0;A(7,4)=0;         A(7,6)=0;A(7,7)=0;A(7,8)=0;A(7,9)=0;A(7,10)=0;
A(8,1)=0;A(8,2)=0;A(8,3)=0;         A(8,5)=0;A(8,6)=0;A(8,7)=0;A(8,8)=0;
A(9,1)=0;A(9,2)=0;A(9,3)=0;A(9,4)=0;A(9,5)=0;A(9,6)=0;A(9,7)=0;         A(9,9)=0;A(9,10)=0;
A(10,1)=0;A(10,2)=0;A(10,3)=0;A(10,4)=0;A(10,5)=0;A(10,6)=0;A(10,7)=0;         A(10,9)=0;A(10,10)=0;


%sqrt(2) in the (2,3), (4,5), (4,8) position.
A(2,3)=sqrt(2); A(4,5)=sqrt(2); A(4,8)=sqrt(2);
%A is symmetric then sqrt(2) in the (3,2), (5,4) and (8,4) position
A(3,2)=sqrt(2); A(5,4)=sqrt(2); A(8,4)=sqrt(2);

% 1 in the (3,4) position.
A(3,4)=1;
%A is symmetric then 1 in the (4,3) position
A(4,3)=1;

% Nz variables: x1 = (1,3), x2 = (5,6), x3= (5,7), x4= (8,9), x5= (8,10).
A(1,3)=x(1); A(5,6)=x(2); A(5,7)=x(3); A(8,9)=x(4); A(8,10)=x(5);
% A is symmetric then
A(3,1)=x(1); A(6,5)=x(2); A(7,5)=x(3); A(9,8)=x(4); A(10,8)=x(5);
%format short
%A
eigenvalue=sort(eig(A),10,"ascend");
minNZ=min(abs(x(indexnz)));
sumNZ=sum(abs(x(indexnz)))*2;

v = [-3, -2, -2, 0, 0, 0, 0, 2, 2, 3]';
s =norm(v-eigenvalue);
end




