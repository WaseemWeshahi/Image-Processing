function noisyIm = addMotionBlur(im,t)
mask = zeros(1,t);
mask(1:t) =  1/t;
noisyIm = conv2(im,mask,'same');




