function    DS = downSample(I)
% This routine creates a downsampled blurred version of an image. The routine is used to create 
% a Gaussian Pyramid image at a given level, from the image at the previous level..
% 
% INPUT:   I = a grayscale image (values in [0,255]) 
% OUTPUT:  DS = a grayscale image (values in [0,255])  with 1/2 the width and 1/2 the height of  I.
% METHOD:  The input image is blurred using a gaussian mask (use the one given in class) and 
%          then subsampled
%
% Written By:
% Waseem Weshahi & Bayan Farhan

g = [0.05 0.25 0.4 0.25 0.05];
mask = g'*g;

G = fft2(mask,size(I,1),size(I,2));
F = fft2(I);
blurred = F.*G;
% blurred = conv2(I,mask,'same','cyclic');
blurred = ifft2(blurred);
blurred = real(blurred);
DS = blurred(1:2:end,1:2:end);
end
