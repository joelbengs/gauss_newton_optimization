%% phi2, data1, different manual points, with linesearch, tol: 1e^-6
fprintf('\nPhi2, Data1\n\n');  
[t,y] = data1;
tol = 1e-6;
A =[   
10.81,2.48,1,1;
10.81,2.48,5,5;
10.81,2.48,-5,5;
10.81,2.48,5,-5;
10.81,2.48,10,10;
10.81,2.48,1000,1000];
    for k = 1:size(A,1)
        x = [A(k,1);A(k,2);A(k,3);A(k,4)];
        gaussnewton_V2(@phi2,t,y,x,tol,1,0,1);
    end
fprintf('\nEnd of printout\n\n');

%% phi2, data2, different manual points, with linesearch, tol: 1e^-6
fprintf('\nPhi2, Data2 (can take a while to process)\n\n');  
[t,y] = data2;
tol = 1e-6;
A =[    
12.98,1.79,1,1;
12.98,1.79,5,5;
12.98,1.79,-5,5;
12.98,1.79,5,-5;
12.98,1.79,10,10;
12.98,1.79,1000,1000];
    for k = 1:size(A,1)
        x = [A(k,1);A(k,2);A(k,3);A(k,4)];
        gaussnewton_V2(@phi2,t,y,x,tol,1,0,1);
    end
fprintf('\nEnd of printout\n\n');    

