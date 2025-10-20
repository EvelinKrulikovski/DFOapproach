function [f] = func_f5(x)
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
% n=3;  matrix 7x7 with eigenvalues -2, -1, -1, 0, 1, 1, 2
% vector x has 3 variables
% nz: x1=(1,3), x2=(3,3), x3=(3,4)
n=size(x);

% position is zero
  A(1,1)=1;        A(1,2)=0;    A(1,4)=0; A(1,5)=0;  A(1,6)=0;A(1,7)=0;
  A(2,1)=0; A(2,2)=1;           A(2,4)=0; A(2,5)=0;  A(2,6)=0;A(2,7)=0;
                                          A(3,5)=0;  A(3,6)=0;A(3,7)=0;
  A(4,1)=0; A(4,2)=0;                                A(4,6)=0;A(4,7)=0;
  A(5,1)=0; A(5,2)=0; A(5,3)=0;
  A(6,1)=0; A(6,2)=0; A(6,3)=0; A(6,4)=0;            A(6,6)=-1; A(6,7)=0;
  A(7,1)=0; A(7,2)=0; A(7,3)=0; A(7,4)=0;            A(7,6)=0;  A(7,7)=-1;




% nz: x1=(1,3), x2=(3,3), x3=(3,4)
A(1,3)=x(1); A(3,3)=x(2); A(3,4)=x(3);
A(2,3)=x(1); A(5,5)=-x(2); A(4,5)=x(3);
A(5,6)=x(1);
A(5,7)=x(1);
% A is symmetric then
A(3,1)=x(1); A(4,3)=x(3);
A(3,2)=x(1); A(5,4)=x(3);
A(6,5)=x(1);
A(7,5)=x(1);

v = [-2;-1;-1;0;1;1;2];

s =norm(v-eig(A));
 
 f = -log(abs(x(1))) -log(abs(x(2))) -log(abs(x(3))) + 2*max(abs(v))*s;
% f=s;
%
%
% -----------------------------------------------------------------------------
%  End of block to be user modified.
% -----------------------------------------------------------------------------
%
% End of func_f.