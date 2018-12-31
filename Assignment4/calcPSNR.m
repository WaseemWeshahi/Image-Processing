function  PSNRval= calcPSNR (noisyIm,im)
% This function calculates the Peak-Signal_to-Noise-Ratio (PSNR) of a noisy image compared to the original image.
% INPUT:    noisyIm - grayscale image (array of values in [0..255])
%           im - grayscale image (array of values in [0..255]) same size as noisyIm.
% OUTPUT:   PSNRval – a Real value expressing the PSNR of noisyIm.
% METHOD:   Peak-Signal-to-Noise-Ratio evaluates the difference between 2 images.
%           Calculate Peak-Signal-to-Noise-Ratio using the PSNR definition here:                
%           http://www.mathworks.com/help/vision/ref/psnr.html   

sub = im-noisyIm;
sub = sub.^2;%sub now is equal to the squared diffrence between each pixels
[width,height]=size(im); 
NM = width*height;
MSE=0;
for i=1:width
    for j=1:height
        MSE = MSE + sub(i,j);
    end
end
%MSE now has the sum of the squared diffrence 
MSE = MSE / NM;%we divide by the diminsions of the images

secondArg = 1/MSE;%in the orginal equation, we divide R^2 by MSE, but since R here is 1,we divide by 1

PSNRval = 10*log10(secondArg);

