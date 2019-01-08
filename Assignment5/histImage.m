function h = histImage(im)
% returns the histogram of the image
%INPUT: an image in .tiff format 
%OUTPUT: the histogram of the image (a 256 long vector)
%
% Written By:
% Waseem Weshahi I.D: 206943391
% Bayan Farhan   I.D: 208300145

%for each grey scale value, we count how many pixels have that grey scale
%value
h = 0:255;
for greyVal = 0:255
	h(greyVal+1) = length(find(im == greyVal));
end
