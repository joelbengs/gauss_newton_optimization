function g = grad(f,x)
% g = grad(f,x)
%
% Calculates the gradient (column) vector of the function f at x.

lx = length(x);
g = zeros(lx,1);
for i = 1:lx
   xplus = x;
   xminus = x;
   xplus(i) = x(i) + 1.e-8;
   xminus(i) = x(i) - 1.e-8;
   g(i,1) = ( f(xplus) - f(xminus) )/2.e-8;
end
