% driver_glods.m script file
%
% Purpose:
%
% File driver_glods applies the GLODS algorithm to solve the bound
% constrained optimization problem:
%
%                      min f(x) 
%
%                      s.t.  low <= x <= up
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
%  Exp 3 from Book of Johnson and Saiago, 2018
%
format long;

x0=[2; 2; 2; 2; 2];  % Not really needed if parameter list = 3

low=[1 1 1 1 1]';
up= [5 5 5 5 5]';

[glods_profile,Plist,flist,alfa,radius,func_eval] = glods('func_f3',[],x0,low,up);
                                                                                                        

% position is zero
A(1,1)=0;A(1,2)=0;         A(1,4)=0;A(1,5)=0;A(1,6)=0;A(1,7)=0;A(1,8)=0;A(1,9)=0;A(1,10)=0;
A(2,1)=0;A(2,2)=0;         A(2,4)=0;A(2,5)=0;A(2,6)=0;A(2,7)=0;A(2,8)=0;A(2,9)=0;A(2,10)=0;
                  A(3,3)=0;         A(3,5)=0;A(3,6)=0;A(3,7)=0;A(3,8)=0;A(3,9)=0;A(3,10)=0;
A(4,1)=0;A(4,2)=0;         A(4,4)=0;         A(4,6)=0;A(4,7)=0;         A(4,9)=0;A(4,10)=0;
A(5,1)=0;A(5,2)=0;A(5,3)=0;         A(5,5)=0;                  A(5,8)=0;A(5,9)=0;A(5,10)=0;
A(6,1)=0;A(6,2)=0;A(6,3)=0;A(6,4)=0;         A(6,6)=0;A(6,7)=0;A(6,8)=0;A(6,9)=0;A(6,10)=0;
A(7,1)=0;A(7,2)=0;A(7,3)=0;A(7,4)=0;         A(7,6)=0;A(7,7)=0;A(7,8)=0;A(7,9)=0;A(7,10)=0;
A(8,1)=0;A(8,2)=0;A(8,3)=0;         A(8,5)=0;A(8,6)=0;A(8,7)=0;A(8,8)=0;
A(9,1)=0;A(9,2)=0;A(9,3)=0;A(9,4)=0;A(9,5)=0;A(9,6)=0;A(9,7)=0;         A(9,9)=0;A(9,10)=0;
A(10,1)=0;A(10,2)=0;A(10,3)=0;A(10,4)=0;A(10,5)=0;A(10,6)=0;A(10,7)=0;         A(10,9)=0;A(10,10)=0;


%sqrt(2) in the (2,3), (4,5), (4,8) position.
A(2,3)=sqrt(2); A(4,5)=sqrt(2); A(4,8)=sqrt(2);
%A is symmetric then sqrt(2) in the (3,2), (5,4) and (8,4) position
A(3,2)=sqrt(2); A(5,4)=sqrt(2); A(8,4)=sqrt(2);

% 1 in the (3,4) position.
A(3,4)=1;
%A is symmetric then 1 in the (4,3) position
A(4,3)=1;

%% Nz variables: x1 = (1,3), x2 = (5,6), x3= (5,7), x4= (8,9), x5= (8,10).
A(1,3)=Plist(1,1); A(5,6)=Plist(2,1); A(5,7)=Plist(3,1); A(8,9)=Plist(4,1); A(8,10)=Plist(5,1);
%% A is symmetric then
A(3,1)=Plist(1,1); A(6,5)=Plist(2,1); A(7,5)=Plist(3,1); A(9,8)=Plist(4,1); A(10,8)=Plist(5,1);


format long
A
eig(A)

