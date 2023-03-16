%%Test of ArmijoLinesearch 1
a=2; 
F=@(lambda) (1-10^a*lambda)^2;
lambda_out = Armijolinesearch(F,1);
lambda_out


%% Test of ArmijoLinesearch 2
%should give lambda =1/a
a=10; 
F=@(lambda) (a*lambda-1)^2;
lambda_out = Armijolinesearch(F,0.5);
lambda_out

%% Test of ArmijoLinesearch 3
F = @(lambda) (1e58*lambda-1)^2
lamda_out = Armijolinesearch(F,1);
lambda_out