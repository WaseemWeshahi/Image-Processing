% The Script
imA = readImage('lena.tif');
showImage(imA);
[width,height]=size(imA);
%imB=addSPnoise(imA,0.1);
%showImage(imB);
%imB=cleanImageMedian(imB,[5 5]);
%showImage(imB);
%imB=addMotionBlur(imA,10);
%showImage(imB);
imB = addGaussianNoise(imA,50);
showImage(imB);

imB = cleanImageMean(imA,[2 2],4);
showImage(imB);
clean = sharpen(imB,[2 2],1,6);
showImage(clean);

