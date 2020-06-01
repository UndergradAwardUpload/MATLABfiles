%Calculations for a colliding smoke particle 

smokeCompressionCount = .01; 
smokeArrayCount = 1; 
smokeCompressionArray = zeros(1,98); 
smokeCountArray = zeros(1,98); 

while smokeCompressionCount <= 1.00
    smokeCompressionArray(smokeArrayCount) = ...
                                           totalLogarithmicStrain(.5,.5,...
                                           smokeCompressionCount); 
                             
    smokeCountArray(smokeArrayCount) = smokeCompressionCount; 
    smokeCompressionCount = smokeCompressionCount + .01; 
    smokeArrayCount = smokeArrayCount+1; 
end 

smokeCountVector = smokeCountArray(:); 
smokeCompressionVector = smokeCompressionArray(:); 

sStrainData = [smokeCountVector smokeCompressionVector];



%Calculations for a colliding gaseous molecule 

gasCompressionCount = .00001; 
gasArrayCount = 1;
gasCompressionArray = zeros(1,98); 
gasCountArray = zeros(1,98); 

while gasCompressionCount <= .001
    
    gasCompressionArray(gasArrayCount) = ...
                                       totalLogarithmicStrain(.5,.0005,...
                                       gasCompressionCount); 
    gasCountArray(gasArrayCount) = gasCompressionCount; 
    gasCompressionCount = gasCompressionCount + .00001; 
    gasArrayCount = gasArrayCount + 1; 
    
end

gasCountVector = gasCountArray(:); 
gasCompressionVector = gasCompressionArray(:); 
gStrainData = [gasCountVector gasCompressionVector];

figure(1) 
plot(smokeCountVector,smokeCompressionVector)
figure(2)
plot(gasCountVector,gasCompressionVector)

SmokeParticleStrainData = sStrainData %#ok<NOPTS>
format shortEng
GasMoleculeStrainData = gStrainData  %#ok<NOPTS>
