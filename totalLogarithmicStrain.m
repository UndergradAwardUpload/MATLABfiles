function [isometricStrain] = totalLogarithmicStrain(startiR,lilir,compr)

%{
 This function calculates the total isometric strain (represented
 logarithmically) present the EZ, based off certain collision parameters.
 
 Since the sphere is being stereographically projected onto a square plane
 to make it conform to the paper ("Finite Deformation of Porous
 Elastomers"), the areas of the starting and final EZ is translated into a
 square of equal area and its length is taken. This is ultimately
 inconsequential as the value you get taking the ln(newcirc/oldcirc) is
 equal to the value of ln(newlength/oldlength); 
%}

    %Starting Values 
    EZStartArea = pi*(startiR^2); 
    EZStartProjLength = (EZStartArea)^(1/2); 
    
    %Final Values 
    EZFinalCirc = totalCircIncrease(startiR,lilir,compr);
    EZFinalRadius = EZFinalCirc/(2*pi); 
    EZFinalArea = pi*(EZFinalRadius^2); 
    EZFinalProjLength = (EZFinalArea)^(1/2); 
    
    %Calculation
    isometricStrain = vpa(log(EZFinalProjLength/EZStartProjLength),6);
    
end

