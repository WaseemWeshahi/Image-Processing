function nh = nhistImage(im)
% INPUT: a grey scale image in .tiff format (265x265 matrix)
% OUTPUT: the normalized histogram of the image
%
% Written By:
% Waseem Weshahi I.D: 206943391
% Bayan Farhan   I.D: 208300145

%normalized histogram is the histogram divided by the number of pixels in
%image
nh = histImage(im);  
nh = nh / sum(nh); 
