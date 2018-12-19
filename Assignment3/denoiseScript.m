% The Script
imA = readImage('horseBoy.tif');
showImage(imA);
[width,height]=size(imA);
% imB=addSPnoise(imA,0.1);
imB = addSPnoise(imA,0.2);
showImage(imB);
clean = cleanImageMedian(imB,[2 2]);
showImage(clean);

