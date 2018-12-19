% The Script
imA = readImage('lena.tif');
showImage(imA);
[width,height]=size(imA);
imB=addSPnoise(imA,0.5);
showImage(imB);



