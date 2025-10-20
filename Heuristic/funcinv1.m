function f=funcinv1(x)
format long

n= 7;
A=[x(1) x(2) x(3) 0; x(2) pi x(4) x(5); x(3) x(4) x(6) 0; 0 x(5) 0 x(7)];
indexnz = [3 4 7];
v= [1.0,2.0,3.0,4.0]';

s =norm(v-eig(A));
%f = -log(abs(x(3)))-log(abs(x(4)))-log(abs(x(7)))+ max(abs(v))*s; 
 f = sum(-log(abs(x(indexnz)))) + 2*max(abs(v))*s; 
% f =  s; 

end