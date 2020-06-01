function [finalCircumfrence] = totalCircIncrease(startcr,lilr,compression)

%{
This function calculates the total expanded circumfrence of the deformed
elastic sphere. It factors in both the expanded radius from the unaxial
deformation, and the direct circumfrence increase from the compression. 
%} 

    syms angleOne angleTwo 
    ctesterValue = tester(startcr,lilr,compression); 
    
    %Prerequisite Calculations
    bigRadius = radFromDef(startcr,lilr,compression);
    baseCircumfrence = 2*pi*bigRadius; 
    distance = lilr + (bigRadius - compression);  
    cordLength = (1/distance)*((4*(distance^2)*(bigRadius^2))-...
                 ((distance^2)-(lilr^2)+(bigRadius^2))^2)^(1/2);
             
    if ctesterValue == 1
    
        %Calculations for the circumfrence section to be added
        zH = ((lilr^2) - (((1/2)*cordLength)^2))^(1/2); 
        craterHeight1 = lilr - zH;
        areainCollid = (lilr^2)*(acos((lilr-craterHeight1)/lilr))...
                       - (lilr-craterHeight1)*((2*lilr*craterHeight1)...
                       - (craterHeight1)^2)^(1/2);
        
        angleinCollid = ((lilr^2)/2)*(((pi/180)*angleOne)-sind(angleOne))...
                        == areainCollid;
        angleinCollidSolved = vpasolve(angleinCollid,angleOne,[0 360]); 
        toBeAdded = ((2*pi*lilr)*angleinCollidSolved)/(360);
        
        %Calculations for the circumfrence section to be removed
        
        craterHeight2 = compression-craterHeight1; 
        areainEZ = ((bigRadius^2)*(acos((bigRadius-craterHeight2)...
                   /bigRadius)))-(bigRadius-craterHeight2)*...
                   ((2*bigRadius*craterHeight2)-((craterHeight2)^2))^(1/2);
        angleinEZ = ((bigRadius^2)/2)*(((pi/180)*angleTwo)-sind(angleTwo))...
                    == areainEZ; 
        angleinEZSolved = vpasolve(angleinEZ,angleTwo,[0,360]); 
        toBeRemoved = ((2*pi*bigRadius)*angleinEZSolved)/(360);
        
        %Final New Circumfrence 
        finalCircumfrence = (baseCircumfrence-toBeRemoved) + toBeAdded; 
        
    else 
        
        %To be added in a case Two Scenario 
        zH = ((lilr^2) - (((1/2)*cordLength)^2))^(1/2); 
        craterHeight1 = lilr - zH;
        areainCollid = (lilr^2)*(acos((lilr-craterHeight1)/lilr))...
                       - (lilr-craterHeight1)*((2*lilr*craterHeight1)...
                       - (craterHeight1)^2)^(1/2);
        
        angleinCollid = ((lilr^2)/2)*(((pi/180)*angleOne)-sind(angleOne))...
                        == areainCollid;
        angleinCollidSolved = vpasolve(angleinCollid,angleOne,[0 360]); 
        arcLength = ((2*pi*lilr)*angleinCollidSolved)/(360);
        toBeAdded = (2*pi*lilr)-arcLength; 
        
        %To be removed in a Case Two Scenario
        craterHeight2 = bigRadius-(distance+zH);
        areainEZ = ((bigRadius^2)*(acos((bigRadius-craterHeight2)...
                   /bigRadius)))-(bigRadius-craterHeight2)*...
                   ((2*bigRadius*craterHeight2)-((craterHeight2)^2))^(1/2);
        angleinEZ = ((bigRadius^2)/2)*(((pi/180)*angleTwo)-sind(angleTwo))...
                    == areainEZ; 
        angleinEZSolved = vpasolve(angleinEZ,angleTwo,[0,360]); 
        toBeRemoved = ((2*pi*bigRadius)*angleinEZSolved)/(360);
        
        %Final Circumfrence
        finalCircumfrence = (baseCircumfrence-toBeRemoved) + toBeAdded;
    end 
           
end

