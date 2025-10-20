function [f]=funcinv4_n4(x)
format long
% n=4+3; is the matrix is matrix pattern with dimension 4x4.
% Laplacian matrices that have an impact in chemical graph theory.
% vector x has 7 variables, 4 free and 3 nz.
% Free: x1=(1,1), x2=(2,2), x3=(3,3), x4=(4,4).
% Nz variables: x5 = (1,2), x6 = (2,3), x7= (3,4).
n=size(x);

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

% for i=1:4
% v(i) = 2 - 2*cos(i*pi/(4 + 1));
% end

v = [0.3820,1.3820, 2.6180, 3.6180]';

s =norm(v-eig(A));

%
% we need a penalty term for the eigenvalues.

 f = - log(abs(x(5))) - log(abs(x(6))) - log(abs(x(7)))  + 2*max(abs(v))*s;
% f = s;
end
