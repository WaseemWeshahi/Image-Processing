function cleanFace()
imA = readImage('face.tif');
showImage(imA);
imB=cleanImageMedian(imA,[1 1]);
%showImage(imB);
imB=cleanImageMedian(imB,[1 0]);
%showImage(imB);
imB=cleanImageMedian(imB,[1 0]);
%showImage(imB);
imC = sharpen(imB,2,2,2);
showImage(imC);
end

%% Note: 
% we need to show that cropping the faces and median-ing them is not good