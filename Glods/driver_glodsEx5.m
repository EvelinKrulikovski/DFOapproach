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
format long;

x0=[2 2 2]'; % Not really needed if parameter list = 3

low=[0.2 0.2 0.2]';
up= [4 4 4]'; 


[glods_profile,Plist,flist,alfa,radius,func_eval] = glods('func_f5',[],x0,low,up);


% position is zero
  A(1,1)=1;        A(1,2)=0;    A(1,4)=0; A(1,5)=0;  A(1,6)=0;A(1,7)=0;
  A(2,1)=0; A(2,2)=1;           A(2,4)=0; A(2,5)=0;  A(2,6)=0;A(2,7)=0;
                                          A(3,5)=0;  A(3,6)=0;A(3,7)=0;
  A(4,1)=0; A(4,2)=0;                                A(4,6)=0;A(4,7)=0;
  A(5,1)=0; A(5,2)=0; A(5,3)=0;
  A(6,1)=0; A(6,2)=0; A(6,3)=0; A(6,4)=0;            A(6,6)=-1; A(6,7)=0;
  A(7,1)=0; A(7,2)=0; A(7,3)=0; A(7,4)=0;            A(7,6)=0;  A(7,7)=-1;




% nz: x1=(1,3), x2=(3,3), x3=(3,4)
A(1,3)=Plist(1,1); A(3,3)=Plist(2,1); A(3,4)=Plist(3,1);
A(2,3)=Plist(1,1); A(5,5)=-Plist(2,1); A(4,5)=Plist(3,1);
A(5,6)=Plist(1,1);
A(5,7)=Plist(1,1);
% A is symmetric then
A(3,1)=Plist(1,1); A(4,3)=Plist(3,1);
A(3,2)=Plist(1,1); A(5,4)=Plist(3,1);
A(6,5)=Plist(1,1);
A(7,5)=Plist(1,1);

 
format short
A
eig(A)

