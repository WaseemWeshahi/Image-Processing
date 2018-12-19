% The Script
imA = readImage('horseBoy.tif');
showImage(imA);
[width,height]=size(imA);
% imB=addSPnoise(imA,0.1);
imB = addMotionBlur(imA,15);
showImage(imB);


