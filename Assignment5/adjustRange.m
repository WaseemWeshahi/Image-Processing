function [nim,maxi,mini] = adjustRange(im,percent)
% this function makes sure that the image's values are between 0 and 255

if nargin<2
   percent = 0.08; 
end
[m,n] = size(im);
nelements = round(percent*m*n);
[~, maxind] = maxk(im(:),nelements); %getting the highest and lowest "percent"
[~, minind] = mink(im(:), nelements);
im = round(im);
nim = im;
im([maxind;minind])=[];
maxi=max(im,[],'all');
mini=min(im,[],'all');
nim = (nim-min(im,[],'all'))*255/(max(im,[],'all')-min(im,[],'all'));
nim(maxind)=255;
nim(minind)=0;
nim = round(nim);


end