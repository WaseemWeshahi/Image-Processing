function    L = laplacPyr(img,levels)
% This routine creates a Laplacian pyramid.
% INPUT:    img = a grayscale image (values in [0,255]) 
%           levels = the number of levels created in the Laplacian Pyramid (minimum value = 1). 
% OUTPUT:   L = the Laplacian pyramid. L is a 1D array of matrices implemented using matlab's cell.
% METHOD:   Starts with img and creates level after level using gaussPyr and upSample. 
%
% Written By:
% Waseem Weshahi & Bayan Farhan

L = cell(1,levels);
G = gaussPyr(img,levels+1);
L{levels} = G{levels};
for i = levels-1:-1:1
    L{i} = G{i} - upSample(G{i+1});
end

end