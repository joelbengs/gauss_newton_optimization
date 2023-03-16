function [x1,no_iter] = gaussnewton_V2(phi,t,y,x0,tol,linesearch,printout,resultprintout)
no_iter = 0;
r = @(x) phi(x,t)-y;        %residuals
f = @(x) r(x)'*r(x);        %squared residuals
stopcriterion = 0;
startS = sum(f(x0));        %initial residual sum
startpoint = x0;

if printout
    startprintout;
end

while ~stopcriterion

    %Calculates the Jacobian using the external function grad.
    m = length(t);
    n = length(x0);
    J = zeros(m,n);
    for i= 1:m
        J(i,:)= grad(@(x)phi(x,t(i)),x0)';
    end
    
    %Calculates the new direction
    dk=-J\r(x0);

    %Linesearch
    if linesearch
        [lambda,LS_iter] = Armijo(f,x0,dk,1);
        x1 = x0 + lambda * dk;
    %Or no linesearch
    else
        x1 = x0 + dk;
    end
    
    no_iter = no_iter + 1;
    dist = norm(x0-x1);
    S = sum(abs(f(x1)));
    maxabs = max(abs(r(x1)));
    
    if (isnan(dist))
        error('Step to an invalid point!(NaN)')
    end
    
    if printout
        dataprintout();
    end
    
    %stopcriterion check
    if (dist < tol)
        stopcriterion = 1;
        if resultprintout
            resprintout();
        end
    end
    x0 = x1;
end

function startprintout()
    strings = ["iter#", "x", "Step dist", "Sum(residuals)", "max(abs(r))", "Lambda(LS)", "#LS func evaluations"];
    fprintf('\n%12s %8s %12s %12s %12s %12s %12s\n\n',strings);
    fprintf('%12s %8.2f %12s %12.6f %12.6s %12s %12.2s\n',"start",x0(1),"-",sum(f(x0)),max(abs(r(x0))),"-","-");
    for k = 2:length(x0)
        fprintf('%12s %8.2f %12s %12s %12s %12s %12s\n',"",x0(k),"","","","","");
    end
end

function dataprintout()
    fprintf('%12d %8.2f %12.6f %12.6f %12.6f %12.4f %12.2f\n',no_iter,x1(1),dist,S, maxabs, lambda, LS_iter);
    for j = 2:length(x1)
        fprintf('%12s %8.2f %12s %12.2s %12s %12.2s %12s\n',"",x1(j),"","","","","");
    end
end

function resprintout()
        if linesearch
            LS = "Yes";
        else 
            LS = "No";
        end
        
        if abs(S) < abs(startS) && ~isnan(dist)
            status = "convergence";
        else
            status = "Non-convergence";
        end
        
        strings = ["Start", "End", "Status" "StartValue", "EndValue", "Iterations", "Linesearch", "Tolerance"];
        fprintf('\n%12s %12s %12s %16s %16s %12s %12s %12s\n',strings);
        fprintf('%12.2f %12.2f %12s %16.2f %16.2f %12.0f %12s %12.0s\n', startpoint(1), x1(1),status,startS,S,no_iter,LS, tol);
        for j = 2:length(x1)
            fprintf('%12.2f %12.2f %12s %16s %16s %12s %10s %12s\n',startpoint(j),x1(j),"","","","","","");
        end
    end
end