function    nim = mapImage (im,tm)
% this function returns the result of applying tone map tm to the image im
% INPUT: a a grey scale.tiff image (256x256) & a tone map (vector 1x256)
% OUTPUT: the modified image
%
% Written By:
% Waseem Weshahi I.D: 206943391
% Bayan Farhan   I.D: 208300145

% the tone map's values should not exceed 255 nor go below 0
if(sum(find(tm<0)) || sum(find(tm>255)))
    disp('ERROR: not a valid tone map')
    return;
end
%applying the mapping using the tone map

im(im==0)=1;
nim = tm(round(im));
end