function    US = upSample(I)
% This routine is used to create a Laplacian Pyramid image at a given level.
% INPUT:   I = a grayscale image (values in [0,255]) 
% OUTPUT:  US = a grayscale image (values in [0,255])  double the width and height of I.
% METHOD:  The input image is stretched in width and height
%          by padding the FFT2 of the image with zeros and then IFFT2. 
%
% Written By:
% Waseem Weshahi & Bayan Farhan

F = fft2(I);
newF = fftshift(F);    
% Padding the image with zeros
[m,n] = size(newF);

bigF = zeros(2 * size(I));

bigF(m/2+1:m+m/2, n/2+1:n+n/2) = newF*4;
bigF = fftshift(bigF);
US = ifft2(bigF,'symmetric');

return;

maskRadius = [m/2,n/2];
newF = [[zeros(maskRadius(1),n);newF] zeros(m+maskRadius(1),maskRadius(2))]; % Padding at the top and the right 
newF = [ zeros(m+2*maskRadius(1),maskRadius(2)) [newF;zeros(maskRadius(1),n+maskRadius(2))] ]; % Padding at the bottom and 

newF = ifftshift(newF);
US = ifft2(newF,'symmetric');
US = US*4; % Renormalizing
end