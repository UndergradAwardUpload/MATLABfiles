function [whichMethod] = tester(starttr,tr,tcompr)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    syms tR
    %0 means use method two
    %1 means use method one
    
    %Known Value Set 
    at = 0-tr+tcompr-starttr; 
    startACoor = ((at+0)/2) - (((starttr^2)-(tr^2))/(2*(at-0)));
    
    %Unknown Value Set 
    td = tr + tR - tcompr; 
    taHeight = (1/td)*((4*(td^2)*(tR^2))-((td^2)-(tr^2)+ ...
               (tR^2))^2)^(1/2) == (2*tr); 
    value = vpasolve(taHeight,tR,[-Inf Inf]);   
    th2 = tcompr-tr; 
   
    if startACoor > 0 
        whichMethod = 0;
    elseif value > 0 
        testVolume = ((4/3)*pi*(value^3))-((((pi*(tr^2))/3)*((3*tr)-tr))+...
                                      (((pi*(th2^2))/3)*((3*th2)-th2)));                      
        if testVolume <= ((4/3)*pi*(starttr^3))
            whichMethod = 0;
        elseif testVolume > ((4/3)*pi*(starttr^3))
            whichMethod = 1; 
        end 
    else 
        whichMethod = 1; 
    end 
    
end

