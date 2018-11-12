function writeImage(img,fileName);
% 
% writeImage(img,fileName);
%
% Writes a grayscale image (stored in a matrix) onto a file.
% Stores the image in TIF format.
% img - is a grayscale image with values [0..255]
% fileName is a string
%
%
% Written by Hagit Hel-Or  I.D. xxxxxxxx
% Last Modified 14/12/98
%
 
if nargin <2
    error('USAGE: writeImage(img,fileName)');
end;
img = uint8(img); % imwrite expects uint8
imwrite(img,fileName,'tif');

