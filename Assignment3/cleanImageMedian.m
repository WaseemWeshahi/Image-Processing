function cleanIm = cleanImageMedian (im, maskRadius)
% Zero padding
[m,n] = size(im);
 im = [[zeros(1,n);im] zeros(m+1,1)]; % Padding at the top and the right 
 im = [ zeros(m+2,1) [im;zeros(1,n+1)] ]; % Padding at the bottom and 