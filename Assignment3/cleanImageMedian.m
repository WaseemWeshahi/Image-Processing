function cleanIm = cleanImageMedian (im, maskRadius)
% Denoises image using median filtering.
% INPUT:    im - a grayscale image array in the range [0..255]. 
%           maskRadius – a 1x2 vector [numRows,numCols]. Defines neighborhood size
% OUTPUT:   cleanIm - grayscale image in the range [0..255] same size as im.
%           that is cleaned via median filter
% METHOD:   Apply median filtering with neighborhood defined by maskRadius.
%
% Written By:
% Waseem Weshahi    I.D: 206943391
% Bayan Farhan      I.D: 208300145

% Zero padding
cleanIm=im;
[m,n] = size(im);
 im = [[zeros(maskRadius(1),n);im] zeros(m+maskRadius(1),maskRadius(2))]; % Padding at the top and the right 
 im = [ zeros(m+2*maskRadius(1),maskRadius(2)) [im;zeros(maskRadius(1),n+maskRadius(2))] ]; % Padding at the bottom and 
 
 % Taking the median of the neighbours of each pixel
 for i = maskRadius(1)+1: m+maskRadius(1)
     for j = maskRadius(2)+1: n+maskRadius(2)
         cleanIm(i-maskRadius(1),j-maskRadius(2)) = median(im(i-maskRadius(1):i+maskRadius(1),j-maskRadius(2):j+maskRadius(2)),'all');
     end
 end
 
cleanIm = round(cleanIm);
cleanIm(cleanIm>255)=255;
cleanIm(cleanIm<0)=0;
end