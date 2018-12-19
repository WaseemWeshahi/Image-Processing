function cleanIm = cleanImageMedian (im, maskRadius)
% Zero padding
cleanIm=im;
[m,n] = size(im);
 im = [[zeros(maskRadius(1),n);im] zeros(m+maskRadius(1),maskRadius(2))]; % Padding at the top and the right 
 im = [ zeros(m+2*maskRadius(1),maskRadius(2)) [im;zeros(maskRadius(1),n+maskRadius(2))] ]; % Padding at the bottom and 
 for i = maskRadius(1)+1: m+maskRadius(1)
     for j = maskRadius(2)+1: n+maskRadius(2)
         cleanIm(i,j) = median(im(i-maskRadius(1):i+maskRadius(1),j-maskRadius(2):j+maskRadius(2)),'all');
     end
 end
 