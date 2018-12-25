function noisyIm = addMotionBlur(im,t)
%   Adds Motion Blur to image
% INPUT:    im - a grayscale image array in the range [0..255]. 
%           t  - length of blur filter.  (Equivalent to the length of time over which the
%                camera integrates the sensor input for a camera moving at 1 pixel per time unit).
% OUTPUT:   NoisyIm - grayscale image in the range [0..255] same size as im
%           that is noised with motion blur
% METHOD:   We simulate motion blur in the x direction by averaging over a 
%           neighborhood 1 X t  for each image pixel.
%
% Written By:
% Waseem Weshahi    I.D: 206943391
% Bayan Farhan      I.D: 208300145

mask = zeros(1,t);
mask(1:t) =  1/t;
noisyIm = conv2(im,mask,'same');




