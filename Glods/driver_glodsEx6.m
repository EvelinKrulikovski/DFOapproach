% driver_glods.m script file
%
% Purpose:
%
% File driver_glods applies the GLODS algorithm to solve the bound
% constrained optimization problem:
%
%                      min (x_2 - x_1^2)^2 
%
%                      s.t.  -2 <= x_1 <= 0
%                             0 <= x_2 <= 1
%
% The optimizer uses the default options specified in the file 
% parameters_glods.m. An output report is produced, both at the screen 
% and in the text file glods_report.txt (stored at the directory glods_0.2).
%
% GLODS Version 0.2.
%
% Copyright (C) 2015 A. L. Custódio and J. F. A. Madeira.
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
format compact;

x0 = [3.0;  3.0;  2.0;  2.0;  4.0;  2.0;  1.6;  1.5;  1; 1; 1]; % Not really needed if parameter list = 3

low = 0.5*ones(11,1);
up = 5*ones(11,1);


[glods_profile,Plist,flist,alfa,radius,func_eval] = glods('func_f6',[],x0,low,up);




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


% Free: x1=(1,1), x2=(4,4), x3=(5,5), x4=(12,12), x5(13,13)
% A(1,1)=Plist(1,2); A(4,4)=Plist(2,2); A(5,5)=Plist(3,2); A(12,12)=Plist(4,2); A(13,13)=Plist(5,2);
A(1,1)=Plist(1,1); A(4,4)=Plist(2,1); A(5,5)=Plist(3,1); A(12,12)=Plist(4,1); A(13,13)=Plist(5,1);


% x6=(1,2), x7=(1,5),
%A(1,2)=Plist(6,2); A(1,3)=Plist(6,2); A(1,5)=Plist(7,2);
A(1,2)=Plist(6,1); A(1,3)=Plist(6,1); A(1,5)=Plist(7,1);

% A is symmetric then
%A(2,1)=Plist(6,2); A(3,1)=Plist(6,2); A(5,1)=Plist(7,2);
A(2,1)=Plist(6,1); A(3,1)=Plist(6,1); A(5,1)=Plist(7,1);

% x8= (4,10), x9= (5,12), x10=(5,13), x11=(1,4)
%A(4,10)=Plist(8,2); A(4,11)=Plist(8,2); A(5,12)=Plist(9,2); A(5,13)=Plist(10,2); A(1,4)=Plist(11,2);
A(4,10)=Plist(8,1); A(4,11)=Plist(8,1); A(5,12)=Plist(9,1); A(5,13)=Plist(10,1); A(1,4)=Plist(11,1);

% A is symmetric then
%A(10,4)=Plist(8,2); A(11,4)=Plist(8,2); A(12,5)=Plist(9,2); A(13,5)=Plist(10,2); A(4,1)=Plist(11,2);
A(10,4)=Plist(8,1); A(11,4)=Plist(8,1); A(12,5)=Plist(9,1); A(13,5)=Plist(10,1); A(4,1)=Plist(11,1);
 
format short
A
eig(A)

