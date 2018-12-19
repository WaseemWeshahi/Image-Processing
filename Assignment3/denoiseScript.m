% The Script
imA = readImage('horseBoy.tif');
showImage(imA);
[width,height]=size(imA);
% imB=addSPnoise(imA,0.1);
imB = addGaussianNoise(imA,4);
showImage(imB);
clean = cleanImageMean(imB,[2 2],4);
showImage(clean);

