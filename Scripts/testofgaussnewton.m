%% test of gaussnewton_V2
[t,y] = data1;
x0 = [1;2;3;4];
gaussnewton_V2(@phi2,t,y,x0,1e-4,1,1,1);

%% test from it6 of gaussnewton_V2
[t,y] = data1;
x0 = [2.781;1.383;3.216;3.013];
gaussnewton_V2(@phi2,t,y,x0,1e-4,1,1,1);

%% test 2 of gaussnewton_V2
%Övningsupgift 3.21.
%Funktion y = Ce^-kt där t är inputs och y är outputs. C benäms x1 och k benäms x2.
[t] =[0;1;2];
[y] =[4;3;2];
x0 = [4;log(4/3)];
gaussnewton_V2(@phi1,t,y,x0,1e-4,1,1,1);

%% test 3 of gaussnewton_V2
[t,y] = data2;
x0 = [1;2;3;4];
gaussnewton_V2(@phi2,t,y,x0,1e-4,1,1,1);

%% test 4 og gaussnewton_V2
[t,y] = data3;
x0 = [2;1];
gaussnewton_V2(@phi1,t,y,x0,1e-4,1,1,1);
