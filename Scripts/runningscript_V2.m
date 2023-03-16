%% phi1, data1, different manual points, with linesearch, tol: 1e^-2
[t,y] = data1;
tol = 1e-2;
A =[
0,0;    
1,1;
5,5;
-5,5;
5,-5;
10,10;
50,50;
91,91;
92,92;
1004,1000];
    for k = 1:size(A,1)
        x = [A(k,1);A(k,2)];
        gaussnewton_V2(@phi1,t,y,x,tol,1,0,1);
    end
fprintf('\nEnd of printout\n\n');    
%% phi1, data1, different manual points, with linesearch, tol: 1e^-6
[t,y] = data1;
tol = 1e-6;
A =[    
0,0;    
1,1;
5,5;
-5,5;
5,-5;
10,10;
50,50;
91,91;
92,92;
1000,1000];
    for k = 1:size(A,1)
        x = [A(k,1);A(k,2)];
        gaussnewton_V2(@phi1,t,y,x,tol,1,0,1);
    end
fprintf('\nEnd of printout\n\n');