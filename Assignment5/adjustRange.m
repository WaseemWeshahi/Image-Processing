function nim = adjustRange(im,percent)
% this function makes sure that the image's values are between 0 and 255

if nargin<2
   percent = 0; 
end
[m,n] = size(im);
nelements = round(percent*m*n);
[~, maxind] = maxk(im(:),nelements); %getting the highest and lowest "percent"
[~, minind] = mink(im(:), nelements);
im = round(im);
nim = im;
% im([maxind;minind])=[];
mini=min(im,[],'all');
maxi=max(nim,[],'all');
nim = (nim-mini)*255/(maxi-mini);
%%%%%%%%%%%%%
% mini=min(im,[],'all');
% 
% nim = (nim-mini);
% maxi=max(nim,[],'all');
% 
% nim=nim*255/(maxi);
%%%%%%%%%%%%%
nim(maxind)=255;
nim(minind)=0;
nim = floor(nim);

end