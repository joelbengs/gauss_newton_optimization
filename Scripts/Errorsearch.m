

%% error search
%fprintf('\nTo view maxabs and Full printout\n\n');
fprintf('\nMethod: Gauss-Newton with Armijo linesearch\n');
[t,y] = data1;
tol = 1e-6;
x0 = [1000;1000];
gaussnewton_V2(@phi1,t,y,x0,tol,1,1,1);

%% 1000,1000
[t,y] = data1;
tol = 1e-2;
A =[
1000,1000];
    for k = 1:size(A,1)
        x = [A(k,1);A(k,2)];
        gaussnewton_V2(@phi1,t,y,x,tol,1,1,1);
    end
fprintf('\nEnd of printout\n\n');   