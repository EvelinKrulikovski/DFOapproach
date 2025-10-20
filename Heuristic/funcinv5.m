function f=funcinv5(x)
format long

n= 3;
A=zeros(7,7);
%Diagonal elements
A(1,1)=1.0; A(2,2)=1.0; A(3,3)=x(2);A(5,5)=-x(2);A(6,6)=-1.0; A(7,7)=-1.0;
%Upper triangular
A(1,3)=x(1); A(2,3)=x(1); A(3,4)=x(3); A(4,5)=x(3);A(5,6)=x(1);A(5,7)=x(1);
%Simetry
A(3,1)=x(1); A(3,2)=x(1); A(4,3)=x(3); A(5,4)=x(3);A(6,5)=x(1);A(7,5)=x(1);

indexnz = [1 2 3];
v= [-2.0,-1.0,-1.0,0.0,1.0,1.0,2.0]';

s =norm(v-eig(A));
%f = -log(abs(x(1)))-log(abs(x(2)))-log(abs(x(3)))+ 2*max(abs(v))*s; 

f = sum(-log(abs(x(indexnz)))) + 2*max(abs(v))*s; 
%f = s; 


end