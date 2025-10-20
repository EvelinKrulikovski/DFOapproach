function [fval, eigenvalue,exitflag,output,minNZ,sumNZ,s]=PS4_n7

%
% Purpose: 
%         Runs Particle Swarm for experiment 4, with seven-dimensional
%         matrix
%
% Output:
%       fval       - minimum function value 
%       eigenvalue - obtained eigenvalues
%       exitflag   - stop criterion reached
%       output     - a structure that contains information about the 
%                    optimization process
%       minNZ      - smallest variable in I_nz in absolute value (min(|NZ|)
%       sumNZ      - sum in absolute value of the variables in I_nz
%                    (sum|NZ|)
%       s          - comparison between the given eigenvalues and the ones
%                    obtained by the heuristic
%                    (||vec(\Lambda(X)-\Lambda||_2)
%

format long

n=13;
j=5;
k=10^5;
indexnz = [8 9 10 11 12 13];
lb=-k*ones(n,1);
ub=k*ones(n,1);
lb(indexnz)=0.5; 
ub(indexnz)=j;

nParticles=50;

funcao = @(x)funcinv4_n7(x);
% Define GA options
options = optimoptions('particleswarm','SwarmSize',nParticles,'MaxIterations',1000);

% Run the Particle Swarm Algorithm
[x,fval,exitflag,output] = particleswarm(@(x) funcao(x), n, lb, ub, options)
disp(['Best solution found: ', num2str(x), ' with fitness value: ', num2str(fval)]);

% position is zero
                  A(1,3)=0;A(1,4)=0;A(1,5)=0;A(1,6)=0;A(1,7)=0;
                           A(2,4)=0;A(2,5)=0;A(2,6)=0;A(2,7)=0;
A(3,1)=0;                           A(3,5)=0;A(3,6)=0;A(3,7)=0;
A(4,1)=0;A(4,2)=0;                           A(4,6)=0;A(4,7)=0;
A(5,1)=0;A(5,2)=0;A(5,3)=0;                           A(5,7)=0;
A(6,1)=0;A(6,2)=0;A(6,3)=0;A(6,4)=0;
A(7,1)=0;A(7,2)=0;A(7,3)=0;A(7,4)=0;A(7,5)=0;
% Nz variables: x8 = (1,2), x9 = (2,3), x10= (3,4), x11= (4,5), x12= (5,6), x13= (6,7).
A(1,2)=x(8); A(2,3)=x(9); A(3,4)=x(10); A(4,5)=x(11); A(5,6)=x(12); A(6,7)=x(13);
% A is symmetric then
A(2,1)=x(8); A(3,2)=x(9); A(4,3)=x(10); A(5,4)=x(11); A(6,5)=x(12); A(7,6)=x(13);
% Free: x1=(1,1), x2=(2,2), x3=(3,3), x4=(4,4), x5=(5,5), x6=(6,6), x7=(7,7)
A(1,1)=x(1); A(2,2)=x(2); A(3,3)=x(3); A(4,4)=x(4); A(5,5)=x(5); A(6,6)=x(6); A(7,7)=x(7);


%format short
%A
eigenvalue=sort(eig(A),7,"ascend");
minNZ=min(abs(x(indexnz)));
sumNZ=sum(abs(x(indexnz)))*2;

v = [0.1522,0.5858,1.2346,2,2.7654,3.4142,3.8478]';
s = norm(v-eigenvalue);
end




