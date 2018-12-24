function cleanIm = cleanImageMedian (im, maskRadius)
% Zero padding
cleanIm=im;
[m,n] = size(im);
 im = [[zeros(maskRadius(1),n);im] zeros(m+maskRadius(1),maskRadius(2))]; % Padding at the top and the right 
 im = [ zeros(m+2*maskRadius(1),maskRadius(2)) [im;zeros(maskRadius(1),n+maskRadius(2))] ]; % Padding at the bottom and 
 for i = maskRadius(1)+1: m+maskRadius(1)
     for j = maskRadius(2)+1: n+maskRadius(2)
         cleanIm(i-maskRadius(1),j-maskRadius(2)) = median(im(i-maskRadius(1):i+maskRadius(1),j-maskRadius(2):j+maskRadius(2)),'all');
     end
 end
% im(1:maskRadius(1),1:(maskRadius(2)*2+n)) = []; % Remove upper pad
% im(maskRadius(2)+m:end,end)= []; % remove bottom pad
% im(maskRadius(1):maskRadius(1)+m,1:maskRadius(2)) = []; % remove left padding
% im(maskRadius(1):maskRadius(2)+m,maskRadius(2)+n:end) = []; % remove right padding
% cleanIm = im(maskRadius(1)+1:(maskRadius(1)+m),maskRadius(2)+1:(maskRadius(2)+n));
cleanIm = round(cleanIm);
cleanIm(cleanIm>255)=255;
cleanIm(cleanIm<0)=0;
end