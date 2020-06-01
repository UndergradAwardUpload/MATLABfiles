%Values for a starting pore Diameter of .25 nanometers; 
tfcompressionValueCount = .4; 
tfarrayCount = 1; 
tfporeDiameterArray = zeros(1,59); 
tfstrainArray = zeros(1,59); 

while tfcompressionValueCount <= 1.00 
    
    tfNewCircumfrence = totalCircIncrease(.5,.5,tfcompressionValueCount); 
    tfStrainValue = totalLogarithmicStrain(.5,.5,tfcompressionValueCount); 
    
    tfstrainArray(tfarrayCount) = tfStrainValue; 
    tfporeDiameterArray(tfarrayCount) = diameterIncrease(.25,tfNewCircumfrence,...
                                    tfStrainValue); 
    
    tfarrayCount = tfarrayCount+1; 
    tfcompressionValueCount = tfcompressionValueCount + .01; 

end 

tfStrainVector = tfstrainArray(:); 
tfPoreDiameterVector = tfporeDiameterArray(:); 
tfStrainDiameterData = [tfStrainVector tfPoreDiameterVector] %#ok<NOPTS>

%Values for a starting pore Diameter of .3 nanometers; 

thrcompressionValueCount = .4; 
thrarrayCount = 1; 
thrporeDiameterArray = zeros(1,59); 
thrstrainArray = zeros(1,59); 

while thrcompressionValueCount <= 1.00
    
    thrnewCircumfrence = totalCircIncrease(.5,.5,thrcompressionValueCount); 
    thrstrainValue = totalLogarithmicStrain(.5,.5,thrcompressionValueCount);
    
    thrstrainArray(thrarrayCount) = thrstrainValue; 
    thrporeDiameterArray(thrarrayCount) = diameterIncrease(.3,thrnewCircumfrence,...
                                    thrstrainValue); 
    
    thrarrayCount = thrarrayCount+1; 
    thrcompressionValueCount = thrcompressionValueCount + .01; 
    
end 
    
thrstrainVector = thrstrainArray(:); 
thrdiameterVector = thrporeDiameterArray(:); 
thrstrainDiameterData = [thrstrainVector thrdiameterVector] %#ok<NOPTS>

%Values for an Initial Pore Diameter of .35 nanometers

thrfcompressionValueCount = .4; 
thrfarrayCount = 1; 
thrfporeDiameterArray = zeros(1,59); 
thrfstrainArray = zeros(1,59); 

while thrfcompressionValueCount <= 1.00
    
    thrfnewCircumfrence = totalCircIncrease(.5,.5,thrfcompressionValueCount); 
    thrfstrainValue = totalLogarithmicStrain(.5,.5,thrfcompressionValueCount);
    
    thrfstrainArray(thrfarrayCount) = thrfstrainValue; 
    thrfporeDiameterArray(thrfarrayCount) = diameterIncrease(.35,thrfnewCircumfrence,...
                                    thrfstrainValue); 
    
    thrfarrayCount = thrfarrayCount+1; 
    thrfcompressionValueCount = thrfcompressionValueCount + .01; 
    
end 

thrfstrainVector = thrfstrainArray(:); 
thrfdiameterVector = thrfporeDiameterArray(:); 
thrfstrainDiameterData = [thrfstrainVector thrfdiameterVector] %#ok<NOPTS>

%Values for an Initial Pore Diameter of .40 nanometers 

fcompressionValueCount = .4; 
farrayCount = 1; 
fporeDiameterArray = zeros(1,59); 
fstrainArray = zeros(1,59); 

while fcompressionValueCount <= 1.00
    
    fnewCircumfrence = totalCircIncrease(.5,.5,fcompressionValueCount); 
    fstrainValue = totalLogarithmicStrain(.5,.5,fcompressionValueCount);
    
    fstrainArray(farrayCount) = fstrainValue; 
    fporeDiameterArray(farrayCount) = diameterIncrease(.4,fnewCircumfrence,...
                                    fstrainValue); 
                            
    farrayCount = farrayCount+1; 
    fcompressionValueCount = fcompressionValueCount + .01; 
    
end 

fstrainVector = fstrainArray(:); 
fdiameterVector = fporeDiameterArray(:); 
fstrainDiameterData = [fstrainVector fdiameterVector] %#ok<NOPTS>

plot(fstrainVector,tfPoreDiameterVector,'-',fstrainVector,...
    thrdiameterVector,'--b',fstrainVector,thrfdiameterVector,':r',...
    fstrainVector,fdiameterVector,'-.g');