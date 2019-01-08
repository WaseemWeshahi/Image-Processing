function img = collapseLapPyr(L)
% This routine reconstructs the original image from its Laplacian Pyramid.
% INPUT:      L = the Laplacian pyramid. L is a 1D array of matrices implemented using matlab's cell.
% OUTPUT:   img = a grayscale image (values in [0,255]).
% METHOD:  Works level by level from top of pyramid. Uses function upSample.
%
% Written By:
% Waseem Weshahi & Bayan Farhan

levels = length(L);
prev = L{levels};
for i=levels-1:-1:1
    prev = L{i}+upSample(prev);
end
img = prev;
end