function [lambda] = linesearch(F)
%We use golden section for the linesearch

%Find interval (by "armijos method"):
%a=0; 
%b=§

%F = @(lambda) f(x+lambda*d);

a=0;
b=100; 
N=0;

tol=0.0001; %Chosen as in the instructions
k = 0;
alfa = double((sqrt(5)-1)/2); %Golden ratio 
p1 = a + (1-alfa)*(b-a);
p2 = a + alfa*(b-a);

F_p1 = F(p1);
F_p2 = F(p2);

strings = ["iteration", "p1", "p2", "F(p1)", "F(p2)"];
fprintf('%12s %12s %12s %12s %12s\n',strings); 

while (abs(b-a)>tol) 
   fprintf('%12d %12.2f %12.2f %12.2f %12.2f\n',N,p1,p2,F(p1),F(p2));
    
   if F_p1 >= F_p2 %left
        b = p1;
        p1 = p2;
        p2 = a + alfa * (b-a);
        F_p1 = F(p1);
        F_p2 = F(p2);
        N = N+1;
   else             %right
        a = p2;
        p2 = p1;
        p1 = a + alfa * (b-a);
        F_p1 = F(p1);
        F_p2 = F(p2);
        N = N+1;
   end
end

%Välj en godtycklig punkt i intervallet 
lambda = (p1+p2)/2;

if isnan(F(lambda)) || F(lambda)>F(0) %Skriva ut om den inte klarade 
    error('Bad job of the line search!')
end
end

