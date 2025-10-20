function [fval, eigenvalue,exitflag,output,minNZ,sumNZ,s]=PS1

%
% Purpose: 
%         Runs Particle Swarm for experiment 1
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

n=7;
j=5;
k=10^5;
indexnz = [3 4 7];
lb=-k*ones(n,1);
ub=k*ones(n,1);
lb(indexnz)=0.5; 
ub(indexnz)=j;

nParticles=50;

funcao = @(x)funcinv1(x);
% Define GA options
options = optimoptions('particleswarm','SwarmSize',nParticles,'MaxIterations',1000);

% Run the Particle Swarm Algorithm
[x,fval,exitflag,output] = particleswarm(@(x) funcao(x), n, lb, ub, options)
disp(['Best solution found: ', num2str(x), ' with fitness value: ', num2str(fval)]);

A=[x(1) x(2) x(3) 0; x(2) 3.1416 x(4) x(5); x(3) x(4) x(6) 0; 0 x(5) 0 x(7)];
eigenvalue=sort(eig(A),4,"ascend");
%
minNZ=min(abs(x(indexnz)));
sumNZ=abs(x(7))+2*(abs(x(3))+abs(x(4)));

v= [1.0,2.0,3.0,4.0]';
s =norm(v-eigenvalue);
end




