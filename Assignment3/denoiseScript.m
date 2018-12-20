% The Script
imA = readImage('Nietzsche.tif');
showImage(imA);
[width,height]=size(imA);
%imB=addSPnoise(imA,0.1);
%showImage(imB);
%imB=cleanImageMedian(imB,[5 5]);
%showImage(imB);
%imB=addMotionBlur(imA,10);
%showImage(imB);
N = 50;
imArray = zeros(width,height,N);
for i=1:N
    imArray(:,:,i) = addMotionBlur(imA,50);
    
end

imB = cleanImageMean_multi(imArray);
pause(3);
showImage(imB);


