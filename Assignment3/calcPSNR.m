function  PSNRval= calcPSNR (noisyIm,im)

%in this function we used the exact equation in this link(
% http://www.mathworks.com/help/vision/ref/psnr.html

sub = im-noisyIm;
sub = sub.^2;%sub now is equal to the squared diffrence between each pixels
[width,height]=size(im); 
NM = width*height;
MSE=0;
for i=1:width
    for j=1:height
        MSE = MSE + sub(i,j);
    end
end
%MSE now has the sum of the squared diffrence 
MSE = MSE / NM;%we divide by the diminsions of the images

secondArg = 1/MSE;%in the orginal equation, we divide R^2 by MSE, but since R here is 1,we divide by 1

PSNRval = 10*log10(secondArg);
disp(PSNRval);

