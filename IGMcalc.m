
IGMCompressionCount = .0001; 
IGMArrayCount = 1; 
IGMCompressionArray = zeros(1,98); 
IGMCountArray = zeros(1,98); 

while IGMCompressionCount < .0099
    
    IGMCompressionArray(IGMArrayCount) = ...
                                       totalLogarithmicStrain(.5,.005,...
                                       IGMCompressionCount); 
    IGMCountArray(IGMArrayCount) = IGMCompressionCount; 
    IGMCompressionCount = IGMCompressionCount + .0001; 
    IGMArrayCount = IGMArrayCount + 1; 
    
end 

IGMCountVector = IGMCountArray(:);
IGMCompressionVector = IGMCompressionArray(:);
IGMStrainFromData = [IGMCountVector IGMCompressionVector] 

plot(IGMCountVector,IGMCompressionVector); 
