function [f] = func_f1(x)
  format long
%
% Purpose:
%
%    Function func_f is an user provided function which
%    computes the value of the objective function at a
%    point provided by the optimizer.
%
% Input:  
%
%         x (Point given by the optimizer or chosen by list =1)
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
% simple test problem (not a tree).
% Pi in the (2,2) position.
% matrix 4x4 with eigenvalues 1, 2, 3 e 4
% vector x has 7 variables, 4 free and 3 nz. 
% Free: x1=(1,1), x2=(1,2), x3=(2,4), x4=(3,3)
% Nz variables: x5 = (1,3), x6 = (2,3), x7= (4,4).

n=size(x);

A = [x(1) x(2)  x(5) 0;
     x(2) pi    x(6) x(3);
     x(5) x(6)  x(4) 0;
     0    x(3)  0   x(7)];

v = [1;2;3;4];

s =norm(v-eig(A));
 
% For the case below (n=7), we need a penalty term for the eigenvalues. 
%
 f = - log(abs(x(5))) - log(abs(x(6))) - log(abs(x(7))) + max(abs(v))*s;
% f = s;   % this option works but the Nz values in sum is closer to 0 
%
% -----------------------------------------------------------------------------
%  End of block to be user modified.
% -----------------------------------------------------------------------------
%
% End of func_f.