function cleanIm = cleanImageMedian (im, maskRadius)
% Zero padding
[m,n] = size(im);
 im = [[zeros(maskRadius(1),n);im] zeros(m+maskRadius(1),maskRadius(2))]; % Padding at the top and the right 
 im = [ zeros(m+2*maskRadius(1),maskRadius(2)) [im;zeros(maskRadius(1),n+maskRadius(2))] ]; % Padding at the bottom and 
 
 