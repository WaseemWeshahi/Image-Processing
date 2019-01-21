function nim = adjustRange(im)
% this function makes sure that the image's values are between 0 and 255
mini=min(im,[],'all');
maxi=max(im,[],'all');
nim = (im-mini)*255/(maxi-mini);
nim = floor(nim);
end