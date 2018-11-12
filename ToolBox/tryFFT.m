% This script is an example of using fft.

% create an image which is all zeros except for a 
% central square of gray value 250.
im = zeros(128,128);
im(64-20:64+20,64-20:64+20) = 200.*ones(41,41);
showImage(im);

% create FFT of image and shift so that F(0,0) is at the center.
fim = fft2(im);
fim = fftshift(fim);

% display the power spectrum: 
% use log routine which returns the natural logarithm
pim = log(abs(fim) + 1);
% scale the values to fill the range [0..255]
pim = pim - min(min(pim));
pim = pim ./ max(max(pim));
pim = pim .* 255;
showImage(pim);


% as an example, reduce the lowest frequency ring to half its original
% value. Maintain value of the dc
savedDC = fim(65,65);
fim(64:66,64:66) = fim(64:66,64:66) ./2;
fim(65,65) = savedDC;


% Use inverse FFT to obtain filtered image.
nfim = fftshift(fim);
nim = ifft2(nfim);
% to obtain values in [0..255], make sure to elliminate imaginary
% residuals by using abs, then round to nearest integer.
nim = round(abs(nim));
showImage(nim);

