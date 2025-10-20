function [f] = func_4a(x)
%
% Purpose:
%
%    Function func_f is an user provided function which
%    computes the value of the objective function at a
%    point provided by the optimizer.
%
% Input:  
%
%         x (Point given by the optimizer.)
%
% Output: 
%
%         f (Function value at the given point.)        
%
% GLODS Version 0.1
%
% Copyright (C) 2013 A. L. Custódio and J. F. A. Madeira.
%
% This library is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public
% License as published by the Free Software Foundation; either
% version 3.0 of the License, or (at your option) any later version.
%
% This library is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
% Lesser General Public License for more details.
%
% You should have received a copy of the GNU Lesser General Public
% License along with this library; if not, write to the Free Software
% Foundation, Inc.,51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
%
%
% -----------------------------------------------------------------------------
%  Block to be user modified.
% -----------------------------------------------------------------------------
%
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

for i=1:4
v(i) = 2 - 2*cos(i*pi/(4 + 1));
end

v = [0.3820, 1.3820, 2.6180, 3.6180]';

s =norm(v-eig(A));
 
%
tau= max(abs(v));

 f = - log(abs(x(5))) - log(abs(x(6))) - log(abs(x(7)))  + tau*s;
% f=s;
%
