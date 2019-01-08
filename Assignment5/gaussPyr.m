function    G = gaussPyr(img,levels)
% This routine creates a Gaussian pyramid. 
% INPUT:    img = a grayscale image (values in [0,255]) 
%           levels = the number of levels created in the Gaussian Pyramid (minimum value = 1). 
% OUTPUT:   G = the Gaussian pyramid. G is a 1D array of matrices implemented using matlab's cell.
% METHOD:   Starts with img and creates level after level.
%
% Written By:
% Waseem Weshahi & Bayan Farhan

    G = cell(1,levels);
    G{1}=img;
    for i=2:levels
        G{i} = downSample(G{i-1});
    end
end

    
