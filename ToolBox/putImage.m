function putImage(img)
% 
% putImage(img)
%
% Displays a grayscale image in a resizable
% window with x&y axes. Used to view small images.
% img - is a grayscale image with values [0..255]
%
%
% Written by Hagit Hel-Or  I.D. xxxxxxxx
% Last Modified 5/3/97
%

if nargin <1
    error('USAGE: putImage(img)');
end;

img = img + 1;
figNum = figure;
image(img); 
colormap(gray(256));

