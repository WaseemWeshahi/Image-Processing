function cleanIm = cleanImageMean (im, maskRadius, maskSTD)
% Denoises image using mean filtering.
% INPUT:    im - a grayscale image array in the range [0..255]. 
%           maskRadius – a 1x2 vector [numRows,numCols]. Defines neighborhood size
%           maskSTD  - the std of the Gaussian mask.
% OUTPUT:   cleanIm - grayscale image in the range [0..255] same size as im.
%           that is cleaned via mean filter
% METHOD:   Convolve image with Gaussian mask of size 2*maskRadius +1.
%
% Written By:
% Waseem Weshahi    I.D: 206943391
% Bayan Farhan      I.D: 208300145

% Defining the Gaussian mask at the size of maskRadius*2+1
mask = zeros(maskRadius*2+1);
[m,n] = size(mask);
[h1, h2] = meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
hg = exp(- (h1.^2+h2.^2) / (2*maskSTD^2));
mask = hg ./ sum(hg(:));

cleanIm = conv2(im,mask,'same');

cleanIm = round(cleanIm);
cleanIm(cleanIm>255)=255;
cleanIm(cleanIm<0)=0;