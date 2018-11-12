function eNum = euler(img,threshVal)
% 
%  eNum = euler(img,threshVal)
%
% Thresholds a grayscale image according to a given threshold value
% and calculates the euler number of the image.
% Euler number equals the number of connected components minus
% the number of holes. 
% Foreground is assumed to be 255, background to be 0.
% 
% Algorithm: Scans the binary image and count the number of
% positive and negative corners. 
% Positive corners are found by searching for the pattern:  
%                  0 0 
%                  0 1
% Negative  corners are found by searching for the pattern:  
%                  0 1 
%                  1 1
%
% img - is a grayscale image with values [0..255]
% threshVal - is a grayscale value in  [0..255]
% eNum - is the Euler number of the binary image.
%
% Functions called:  thresholdImage
%
% Written by Hagit Hel-Or  I.D. xxxxxxxx
% Last Modified 5/3/97
%

if nargin <2
    error('USAGE:  eNum = euler(img,threshVal)');
end;

% create a binary image 
binaryImg = thresholdImage(img,threshVal);

% create positive and negative corner patterns
posC = [0 0 ; 0 255];
negC = [0 255 ; 255 255];

% scan the binary image and count number of pos and neg corners
posCcount = 0;
negCcount = 0;
for(r = 1:size(binaryImg,1)-1)
    for(c = 1:size(binaryImg,2)-1)
        if (binaryImg(r:r+1,c:c+1) == posC)   
            posCcount = posCcount + 1;
        end;
        if (binaryImg(r:r+1,c:c+1) == negC) 
            negCcount = negCcount + 1;
        end;
    end;
end;

% calculate the Euler number
eNum = posCcount - negCcount;

       

