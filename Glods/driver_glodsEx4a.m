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
%
format compact;

x0 = 2*rand(7,1);  % Not really needed if parameter list = 3

% vector x has 7 variables, 4 free and 3 nz.
% Nz variables: x5 = (1,2), x6 = (2,3), x7= (3,4).
low=[0.5 0.5 0.5 0.5 0.5 0.5 0.5]';
up= [5 5 5 5 5 5 5]';

[glods_profile,Plist,flist,alfa,radius,func_eval] = glods('func_4a',[],x0,low,up);
                                                                                                        
% position is zero
                  A(1,3)=0;A(1,4)=0;
                           A(2,4)=0;
A(3,1)=0;
A(4,1)=0;A(4,2)=0;

% Nz variables: x5 = (1,2), x6 = (2,3), x7= (3,4).
A(1,2)=Plist(5,1); A(2,3)=Plist(6,1); A(3,4)=Plist(7,1);
% A is symmetric then
A(2,1)=Plist(5,1); A(3,2)=Plist(6,1); A(4,3)=Plist(7,1);

% Free: x1=(1,1), x2=(2,2), x3=(3,3), x4=(4,4)
A(1,1)=Plist(1,1); A(2,2)=Plist(2,1); A(3,3)=Plist(3,1); A(4,4)=Plist(4,1);


format short
A
eig(A)

