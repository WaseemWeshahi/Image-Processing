% The Script
imA = readImage('horseBoy.tif');
showImage(imA);
[width,height]=size(imA);
% imB=addSPnoise(imA,0.1);
imB = addGaussianNoise(imA,10);
showImage(imB);


