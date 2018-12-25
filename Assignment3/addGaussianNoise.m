function    noisyIm = addGaussianNoise(im, s)
% Adds Gaussian noise to image
% INPUT:    im - a grayscale image array in the range [0..255]. 
%           s  - the std to be used for Gaussian distribution of noise
% OUTPUT:   NoisyIm - grayscale image in the range [0..255] same size as im
%           that is noised with gaussian noise
% METHOD:   For every pixel add a random value which is chosen from a Gaussian distribution
%
% Written By:
% Waseem Weshahi    I.D: 206943391
% Bayan Farhan      I.D: 208300145

noisyIm = im + (s^2)*randn(size(im));

% value limits validated
noisyIm = round(noisyIm);
noisyIm(noisyIm>255)=255;
noisyIm(noisyIm<0)=0;
