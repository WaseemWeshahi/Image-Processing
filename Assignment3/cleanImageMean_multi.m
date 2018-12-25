 function    cleanIm = cleanImageMean_multi (imArray)
% Denoises a series of images using mean filtering across corresponding pixels.
% INPUT:    imArray - a 3D array in the range [0..255]. Every frame imArray(:,:,i) is an image.   
% OUTPUT:   cleanIm - grayscale image in the range [0..255] same size as a frame in imArray.
% METHOD:   Assume imArray is a sequence of the same image but noised. Apply mean filtering
%           across corresponding pixels of the sequence, to create a single denoised image.
%
% Written By:
% Waseem Weshahi    I.D: 206943391
% Bayan Farhan      I.D: 208300145
cleanIm = mean(imArray,3);
cleanIm = round(cleanIm);

