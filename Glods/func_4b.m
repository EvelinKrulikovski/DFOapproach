function [f] = func_4b(x)
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
% n=7+6; is the matrix is matrix pattern with dimension 7x7.
% Laplacian matrices that have an impact in chemical graph theory
% vector x has 13 variables, 7 free and 6 nz.
% Free: x1=(1,1), x2=(2,2), x3=(3,3), x4=(4,4), x5=(5,5), x6=(6,6), x7=(7,7)
% Nz variables: x8 = (1,2), x9 = (2,3), x10= (3,4), x11= (4,5), x12= (5,6), x13= (6,7).
n=size(x);


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

for i=1:7
v(i) = 2 - 2*cos(i*pi/(7 + 1));
end

v = [0.1522,0.5858,1.2346,2.0,2.7654,3.4142,3.8478]';


s =norm(v-eig(A));
 
%
tau= max(abs(v));

 f = - log(abs(x(8)))- log(abs(x(9))) - log(abs(x(10))) - log(abs(x(11))) - log(abs(x(12))) - log(abs(x(13))) + tau*s;
% f=s;
%
