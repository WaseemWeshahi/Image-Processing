function    nim = imHistShape (im1,im2)
% this applies histogram equalization on im1 to im2 adn returns the result
% INPUT: two grey scale images (matrices)
% OUTPUT: an image that is same size as im1 and its histogram is similar to
% im2's 
%
% Written By:
% Waseem Weshahi I.D: 206943391
% Bayan Farhan   I.D: 208300145

h1 = nhistImage(im1);
h2 = nhistImage(im2);
% finding the right tone map to perform the histogram equaliaztion
tm = histShape(h1,h2);


nim = mapImage(im1,tm);
end