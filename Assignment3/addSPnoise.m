function    noisyIm = addSPnoise(im, p)
% Adds Salt & Pepper noise to image.
% INPUT:    im - a grayscale image array in the range [0..255]. 
%           p - proportion of pixels that will be noisy
% OUTPUT:   NoisyIm - grayscale image in the range [0..255] same size as im
%           that is noised with S&P noise
% METHOD:   p/2 proportion of the pixels are randomly chosen as 0 and p/2 as 255. 
%
% Written By:
% Waseem Weshahi    I.D: 206943391
% Bayan Farhan      I.D: 208300145

noisyIm=im; % copying im into noisyIm to save the pixels that wont be changed
temp = rand(size(im)); % creating a matrix,as same size like im, with randm values between 0 and 1
black=temp<p/2;% saving the elements that have value less than p/2 in order to:
noisyIm(black)=0;% use them to change the equivilant pixels at noisyIm color to black
white=temp>=p/2 & temp <p;% saving the elements that have value less than p and greater than p/2 in order to:
noisyIm(white)=255;% use them to change the equivilant pixels at noisyIm color to white

