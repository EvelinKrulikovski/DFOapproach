function [fval,eigenvalue,exitflag,output,minNZ,sumNZ,s]=GEN6

%
% Purpose: 
%         Runs Genetics for experiment 6
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

n=11;
j=5;
indexnz=[1 2 3 4 5 6 7 8 9 10 11];
lb=0.5*ones(n,1);
ub=j*ones(n,1);

funcao = @(x)funcinv6(x);
% Define GA options
options = optimoptions('ga','Display','iter','PopulationSize',50,'MaxGenerations',1000);

% Run the Genetic Algorithm
[x,fval,exitflag,output] = ga(@(x) funcao(x), n, [], [], [], [], lb, ub, [], options);
disp(['Best solution found: ', num2str(x), ' with fitness value: ', num2str(fval)]);

% position is zero
                                                     A(1,6)=0;A(1,7)=0;  A(1,8)=0; A(1,9)=0;A(1,10)=0;A(1,11)=0;A(1,12)=0;A(1,13)=0;
                      A(2,3)=0; A(2,4)=0; A(2,5)=0;                      A(2,8)=0; A(2,9)=0;A(2,10)=0;A(2,11)=0;A(2,12)=0;A(2,13)=0;
           A(3,2)=0;            A(3,4)=0; A(3,5)=0;  A(3,6)=0;A(3,7)=0;                     A(3,10)=0;A(3,11)=0;A(3,12)=0;A(3,13)=0;
           A(4,2)=0;  A(4,3)=0;           A(4,5)=0;  A(4,6)=0;A(4,7)=0;  A(4,8)=0; A(4,9)=0;                    A(4,12)=0;A(4,13)=0;
           A(5,2)=0;  A(5,3)=0; A(5,4)=0;            A(5,6)=0;A(5,7)=0;  A(5,8)=0; A(5,9)=0;A(5,10)=0;A(5,11)=0;
  A(6,1)=0;           A(6,3)=0; A(6,4)=0;A(6,5)=0;            A(6,7)=0;  A(6,8)=0; A(6,9)=0;A(6,10)=0;A(6,11)=0;A(6,12)=0;A(6,13)=0;
  A(7,1)=0;           A(7,3)=0; A(7,4)=0; A(7,5)=0; A(7,6)=0;            A(7,8)=0; A(7,9)=0;A(7,10)=0;A(7,11)=0;A(7,12)=0;A(7,13)=0;
  A(8,1)=0;A(8,2)=0;            A(8,4)=0; A(8,5)=0;  A(8,6)=0;A(8,7)=0;           A(8,9)=0;A(8,10)=0;A(8,11)=0;A(8,12)=0;A(8,13)=0;
  A(9,1)=0;A(9,2)=0;            A(9,4)=0; A(9,5)=0;  A(9,6)=0; A(9,7)=0;A(9,8)=0;           A(9,10)=0;A(9,11)=0;A(9,12)=0;A(9,13)=0;
  A(10,1)=0;A(10,2)=0;A(10,3)=0;          A(10,5)=0;A(10,6)=0;A(10,7)=0; A(10,8)=0;A(10,9)=0;          A(10,11)=0;A(10,12)=0;A(10,13)=0;
  A(11,1)=0;A(11,2)=0;A(11,3)=0;          A(11,5)=0;A(11,6)=0;A(11,7)=0; A(11,8)=0;A(11,9)=0;A(11,10)=0;           A(11,12)=0;A(11,13)=0;
  A(12,1)=0;A(12,2)=0;A(12,3)=0;A(12,4)=0;          A(12,6)=0;A(12,7)=0; A(12,8)=0;A(12,9)=0;A(12,10)=0;A(12,11)=0;           A(12,13)=0;
  A(13,1)=0;A(13,2)=0;A(13,3)=0;A(13,4)=0;          A(13,6)=0;A(13,7)=0; A(13,8)=0;A(13,9)=0;A(13,10)=0;A(13,11)=0;A(13,12)=0;

% Fixed values
A(2,2)=4;
A(3,3)=4;
A(6,6)=3;
A(7,7)=3;
A(8,8)=3;
A(9,9)=3;
A(10,10)=4;
A(11,11)=4;
A(6,2)=1;
A(2,6)=1;
A(7,2)=1;
A(2,7)=1;
A(8,3)=1;
A(3,8)=1;
A(9,3)=1;
A(3,9)=1;

A(1,1)=x(1); A(4,4)=x(2); A(5,5)=x(3); A(12,12)=x(4); A(13,13)=x(5);

A(1,2)=x(6); A(1,3)=x(6); A(1,5)=x(7);
% A is symmetric then
A(2,1)=x(6); A(3,1)=x(6); A(5,1)=x(7);

A(4,10)=x(8); A(4,11)=x(8); A(5,12)=x(9); A(5,13)=x(10); A(1,4)=x(11);
% A is symmetric then
A(10,4)=x(8); A(11,4)=x(8); A(12,5)=x(9); A(13,5)=x(10); A(4,1)=x(11);


%format short
%A
eigenvalue=sort(eig(A),13,"ascend");
minNZ=min(abs(x(indexnz)));
% x(1) a x(5) - a,b,c,d,e; x(6)=f, x(7)=h, x(8)=i; x(9)=j; x(10)=k;
% x(11)=g.
sumNZ=sum(abs(x(indexnz)))+sum(abs([x(7) x(9) x(10) x(11)])) +...
      +sum(abs([x(6) x(8)]))*3;

v = [1;2;2;2;3;3;3;4;4;5;5;6;7];
s =norm(v-eigenvalue);

end




