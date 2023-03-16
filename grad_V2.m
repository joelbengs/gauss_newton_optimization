function g = grad(f,x,t)
% g = grad(f,x)
% Modification: t is an extra input vector, of the same size as f.
% Calculates the gradient (column) vector of the function f at x.

lx = length(x);
g = zeros(lx,1);
for i = 1:lx
   xplus = x;
   xminus = x;
   xplus(i) = x(i) + 1.e-8;
   xminus(i) = x(i) - 1.e-8;
   g(i,1) = ( f(xplus,t(i)) - f(xminus,t(i)) )/2.e-8; %Här anropas funktionen med bara ett input, alltså saknas t.
end
