function [f] = func_f6(x)
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

% positions are zero
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


v = [1;2;2;2;3;3;3;4;4;5;5;6;7];

s =norm(v-eig(A));
 
 f = -log(abs(x(1))) -log(abs(x(2))) -log(abs(x(3))) -log(abs(x(4))) -log(abs(x(5))) -log(abs(x(6))) -log(abs(x(7))) -log(abs(x(8))) -log(abs(x(9))) -log(abs(x(10)))  -log(abs(x(11))) + 2*max(abs(v))*s;
%
%
% -----------------------------------------------------------------------------
%  End of block to be user modified.
% -----------------------------------------------------------------------------
%
% End of func_f.