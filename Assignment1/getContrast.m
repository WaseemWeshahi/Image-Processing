function c = getContrast(h)
% a helping function that gets the contrast of a given a histogram
% INPUT: an image's histogram
% OUTPUT: The image's contrast (max-min)
%
% Written By:
% Waseem Weshahi I.D: 206943391
% Bayan Farhan   I.D: 208300145

% find the first and the last index (grey value) with a nnz entry
c = find(h>0,1,'last')-find(h>0,1,'first');