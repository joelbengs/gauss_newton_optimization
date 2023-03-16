function [goodlambda, k] = Armijo(f,x0,dk,suggestion)
criteria = 1;
alpha = 2;
epsilon = 0.5;
goodlambda = 0;

if (transpose(grad(f,x0))*dk >= 0)
    error('Not a descent direction!');
end

F = @(lambda) f(x0 + lambda*dk);
T = @(lambda) F(0) + epsilon*lambda*transpose(grad(f,x0))*dk ;
k = 3; %number of function evaluations 

while criteria && k < 200 %termination after 200 evaluations, returning 0.
    if F(suggestion) < T(suggestion)
        goodlambda = suggestion;
        criteria = 0;
        k = k+1;
    else
        suggestion = suggestion/alpha;
        k = k+1;
    end
end

if isnan(F(suggestion)) || F(suggestion)>F(0)
    error('Bad job of the line search!');
end
end