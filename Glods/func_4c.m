function [f] = func_4c(x)
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
% n=10+9; is the matrix is matrix pattern with dimension 10x10.
% Laplacian matrices that have an impact in chemical graph theory
% vector x has 19 variables, 10 free and 9 nz.
% Free: x1=(1,1), x2=(2,2), x3=(3,3), x4=(4,4), x5=(5,5), x6=(6,6), x7=(7,7), x8=(8,8), x9=(9,9), x10=(10,10)
% Nz variables: x11 = (1,2), x12 = (2,3), x13= (3,4), x14= (4,5), x15= (5,6), x16= (6,7), x17= (7,8), x18= (8,9), x19= (9,10).
n=size(x);

% position is zero
                  A(1,3)=0;A(1,4)=0;A(1,5)=0;A(1,6)=0;A(1,7)=0;A(1,8)=0;A(1,9)=0;A(1,10)=0;
                           A(2,4)=0;A(2,5)=0;A(2,6)=0;A(2,7)=0;A(2,8)=0;A(2,9)=0;A(2,10)=0;
A(3,1)=0;                           A(3,5)=0;A(3,6)=0;A(3,7)=0;A(3,8)=0;A(3,9)=0;A(3,10)=0;
A(4,1)=0;A(4,2)=0;                           A(4,6)=0;A(4,7)=0;A(4,8)=0;A(4,9)=0;A(4,10)=0;
A(5,1)=0;A(5,2)=0;A(5,3)=0;                           A(5,7)=0;A(5,8)=0;A(5,9)=0;A(5,10)=0;
A(6,1)=0;A(6,2)=0;A(6,3)=0;A(6,4)=0;                           A(6,8)=0;A(6,9)=0;A(6,10)=0;
A(7,1)=0;A(7,2)=0;A(7,3)=0;A(7,4)=0;A(7,5)=0;                           A(6,9)=0;A(6,10)=0;
A(8,1)=0;A(8,2)=0;A(8,3)=0;A(8,4)=0;A(8,5)=0;A(8,6)=0;                           A(8,10)=0;
A(9,1)=0;A(9,2)=0;A(9,3)=0;A(9,4)=0;A(9,5)=0;A(9,6)=0;A(9,7)=0;
A(10,1)=0;A(10,2)=0;A(10,3)=0;A(10,4)=0;A(10,5)=0;A(10,6)=0;A(10,7)=0;A(10,8)=0;


% Nz variables: x11 = (1,2), x12 = (2,3), x13= (3,4), x14= (4,5), x15= (5,6), x16= (6,7), x17= (7,8), x18= (8,9), x19= (9,10).
A(1,2)=x(11); A(2,3)=x(12); A(3,4)=x(13); A(4,5)=x(14); A(5,6)=x(15); A(6,7)=x(16); A(7,8)=x(17); A(8,9)=x(18); A(9,10)=x(19);
% A is symmetric then
A(2,1)=x(11); A(3,2)=x(12); A(4,3)=x(13); A(5,4)=x(14); A(6,5)=x(15); A(7,6)=x(16); A(8,7)=x(17); A(9,8)=x(18); A(10,9)=x(19);

% Free: x1=(1,1), x2=(2,2), x3=(3,3), x4=(4,4), x5=(5,5), x6=(6,6), x7=(7,7), x8=(8,8), x9=(9,9), x10=(10,10)
A(1,1)=x(1); A(2,2)=x(2); A(3,3)=x(3); A(4,4)=x(4); A(5,5)=x(5); A(6,6)=x(6); A(7,7)=x(7); A(8,8)=x(8); A(9,9)=x(9); A(10,10)=x(10);

%for i=1:10
%v(i) = 2 - 2*cos(i*pi/(10 + 1));
%end

v = [0.081014, 0.3175, 0.6903, 1.1692, 1.7154, 2.2846, 2.8308,3.3097, 3.6825, 3.9190]';

s =norm(v-eig(A));
 
%
tau= max(abs(v));

 f = - log(abs(x(11)))- log(abs(x(12))) - log(abs(x(13))) - log(abs(x(14))) - log(abs(x(15))) - log(abs(x(16)))- log(abs(x(17)))- log(abs(x(18)))- log(abs(x(19))) + 2*tau*s;
% f=s; 
%
