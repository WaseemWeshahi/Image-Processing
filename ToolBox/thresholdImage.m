function newImg = thresholdImage(img,threshVal)
% 
%  newImg = thresholdImage(img,threshVal)
%
% Thresholds a grayscale image according to a given threshold value.
% Pixels smaller than threshold are set to 0.
% Pixels greater or equal to threshold are set to 255.
%
% img - is a grayscale image with values [0..255]
% threshVal - is a grayscale value in  [0..255]
% newImg - is a grayscale img with enteries 0 and 255
%          according to thresVal.
%
% Written by Hagit Hel-Or  I.D. xxxxxxxx
% Last Modified 5/3/97
%

if nargin <2
    error('USAGE: newImg = thresholdImage(img,threshVal)');
end;

% create new image and default all it's entries to 255
newImg = ones(size(img)).*255;

% find index of img whose enteries are less than threshold
index = find(img < threshVal);

% set these enteris in newImg to be zero
newImg(index) = zeros(size(index));

