function [poreDiameter] = diameterIncrease(startD,finalCirc,strain) 

        
        %Preliminary Calculations
        EZStartArea = (4*pi*((.5)^2))*1000000;
        sTotalPoreArea = .10*(EZStartArea); 
        sPoreRadius = startD/2; 
        sPoreArea = pi*((sPoreRadius)^2); 
        numPores = sTotalPoreArea/sPoreArea; 
        
        %Final Calculations 
        newPorosity = .2447*log(strain)+.8423; 
        finalRadius = finalCirc/(2*pi); 
        newArea = (4*pi*((finalRadius)^2))*1000000; 
        fTotalPoreArea = newPorosity*newArea; 
        fPoreArea = fTotalPoreArea/numPores; 
        fPoreRadius = (fPoreArea/pi)^(1/2);
        poreDiameter = fPoreRadius*2; 
    
end

