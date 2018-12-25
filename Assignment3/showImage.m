function showImage(img)
% 
% showImage(img)
%
% Displays a grayscale image at it's true size
% (1 screen pixel per image pixel).
% img - is a grayscale image with values [0..255]
%
%
% Written by Hagit Hel-Or  I.D. xxxxxxxx
% Last Modified 5/3/97
%

if nargin <1
    error('USAGE: showImage(img)');
end;

img = img + 1;
figNum = figure;
image(img); 

colormap(gray(256));

% resize window so we have enough room for image.
[row,col] = size(img);
rect = get(figNum,'Position');
set(figNum, 'Position', [rect(1), rect(2), col, row]);
set(figNum, 'Resize','off');

% resize axes of the image so it fits the axes perfectly.
ha = gca;
set(ha, 'Units', 'pixels');
axis off;
set(ha, 'Position', [1, 1, col, row]);

% remove menu bar
set(figNum,'MenuBar','none');

