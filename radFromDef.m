
function [expandedRadius] = radFromDef(startrr,statR,compR) 

%{
Overview - 
radFromDef calculates the increased radius of an incompressible elastic 
sphere that has undergone unixaxial compression. 
%}  
    syms RBig 
    tarVol = (4/3)*pi*(startrr^3); 
    testerValue = tester(startrr,statR,compR);
    
     dis = statR + (RBig - compR); 
     cordA = (1/dis)*((4*(dis^2)*(RBig^2))-((dis^2)-(statR^2)+ ...
             (RBig^2))^2)^(1/2); 
     zHeight = ((statR^2) - (((1/2)*cordA)^2))^(1/2); 
     capH1 = (statR - zHeight); 
   
    if testerValue == 1
        
        %Prerequisite Equations
        capH2 = (compR - capH1);
        capVolume1 = ((pi*(capH1)^2)/3)*((3*statR)-capH1);
        capVolume2 = ((pi*(capH2)^2)/3)*((3*RBig)-capH2); 
        totalCapVolume = (capVolume1 + capVolume2); 
    
        %Volume Expression 
        deformedVolume = ((4/3)*(pi)*(RBig^3)) - totalCapVolume == ...
                     tarVol; 
        expandedRadius = vpasolve(deformedVolume,RBig,[.5 Inf]); 
    else 
        capH2New = RBig - (dis+zHeight); 
        capVol1New = ((4/3)*pi*(statR^3))- ...
                     (((pi*(capH1)^2)/3)*((3*statR)-capH1));
        capVol2New = ((pi*(capH2New)^2)/3)*((3*RBig)-capH2New);
        newTotCapVol = (capVol1New + capVol2New); 
        deformedVolTwo = ((4/3)*(pi)*(RBig^3)) - newTotCapVol == ...
                         tarVol; 
        expandedRadius = vpasolve(deformedVolTwo,RBig,[.5 Inf]);
    end
    
end

