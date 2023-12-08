function x = myregulafalsihw(f,x0,x1,n)
    
    xarr=[]; %array of x for plotting
    fxarr=[]; %array of y for plotting
    iarr=[]; %array of i for plotting
    
    x_gercek=0.5;
    
    x=x0;
    for i = 1:n % Do n times
        x_1 = x;
		x = x1 - ((f(x1)*(x1 -x0))/(f(x1) -f(x0))); % secant formula.
        %-------------------------------------------------
        xarr=[xarr x];  %for plotting
        fxarr=[fxarr f(x)];  %for plotting
        iarr=[iarr i];  %for plotting
        %-------------------------------------------------
        
        SonIterasyonHatasi=abs(x-x_1);
        KalintiHatasi=abs(f(x));
        MutlakHata=abs(x_gercek-x);
        %-------------------------------------------------
        
        %-------------------------------------------------
        disp(sprintf("x%i:%.6f",i,x) ...
            +sprintf(", Iter H:%.6f",SonIterasyonHatasi ) ...
            +sprintf(", Kalinti H:%.6f",KalintiHatasi ) ...
            +sprintf(", Mutlak H:%.6f",MutlakHata ) ...
            )
        %-------------------------------------------------
        if f(x)==0.0
            break
        else
            % decide which half to keep , so that the signs at the ends differ
            if f(x0) * f(x) < 0
                x1=x;
            else
                x0=x;
            end
        end
    end
    % Plot x and fx according to i
    %hold on
    
    
