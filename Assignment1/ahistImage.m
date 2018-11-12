function   ah = ahistImage(im)
% returns the accumlated histogram of the im
% INPUT: an image in .tiff format.
% OUTPUT: the ACCUMULATED histogram
%
% Written By:
% Waseem Weshahi I.D: 206943391
% Bayan Farhan   I.D: 208300145

ah = nhistImage(im); %getting the normalized histogram
for i = 2:256
    ah(i) = ah(i-1) + ah(i); %each entry is the recursive sum of all
                             %previous entries
end
