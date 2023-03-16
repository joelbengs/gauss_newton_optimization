%% phi1, data1, start: [10,2], with linesearch, tol 10^-6, to view maxabs
fprintf('\nto view maxabs\n');
[t,y] = data1;
tol = 1e-6;
x0 = [10;2];
[x,no_iter_success] = gaussnewton_V2(@phi1,t,y,x0,tol,1,1,1);

%% phi1, data2, start: [10,2], with linesearch, tol 10^-6, to view maxabs
fprintf('\nto view maxabs\n');
[t,y] = data2;
tol = 1e-6;
x0 = [10;2];
gaussnewton_V2(@phi1,t,y,x0,tol,1,1,1);

%% phi2, data1, start: [12.98,1.79,2,4], with linesearch, tol 10^-6, view maxabs
fprintf('\nto view maxabs\n');
[t,y] = data1;
tol = 1e-6;
x0 = [12.98;1.79;2.00;4.00];
gaussnewton_V2(@phi2,t,y,x0,tol,1,1,1);

%% phi2, data2, start: [12.98,1.79,2,4], with linesearch, tol 10^-6, to view maxabs and full printout
%fprintf('\nTo view maxabs and Full printout\n\n');
fprintf('\nStarting point:[12.98,1.79,2,4]\nTolerance: 10^-6\nMethod: Gauss-Newton with Armijo linesearch\n');
[t,y] = data2;
tol = 1e-6;
x0 = [12.98;1.79;2.00;4.00];
gaussnewton_V2(@phi2,t,y,x0,tol,1,1,1);

%% phi1, data1, start: [200,200], with linesearch, tol 10^-6, to view maxabs
fprintf('\nstart in 200,200 with phi1 data1\n');
[t,y] = data1;
tol = 1e-6;
x0 = [200;200];
gaussnewton_V2(@phi1,t,y,x0,tol,1,0,1);

fprintf('\nstart in 200,200 with phi1 data2\n');
[t,y] = data2;
tol = 1e-6;
x0 = [200;200];
gaussnewton_V2(@phi1,t,y,x0,tol,1,0,1);
