function cleanStroller()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% STROLLER %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('The stroller image was blurred.');
    disp('so we thought that all we need to do is to shrpen it.');
    disp('we have tried several ways of sharpening the image:');
    disp('1)by using high pass filter:');
    disp('  1-1) HPF+orginal.');
    disp('  1-2) HPF(HPF+orginal)+orginal.');
    disp('  1-3) HPF(HPF+orginal)+(HPF+original.');
    disp('2) or we could simply use sharpen function we have written in HW3');
    disp('In our eyes,The sharpen seemed to work better.But PSNR suggests the 1-1 actually is the better one!');
    disp('so we have decided to show you both of the resullts');
    
    

    disp('figure(1) - Original Noisy image');
    disp('figure(2) - Cleaned Image by HPF');
    disp('figure(3) - Cleaned Image by shrapen function from hw3');  

    imA = readImage('stroller.tif');
    showImage(imA);
    imO = readImage('stroller2.tif');
imC = sharpen(imA,2,2,5);
    Psnr4 = calcPSNR(imC,imO);
   disp(Psnr4);

    showImage(imC);
    F=fft2(imA);
    H=circle(size(imA),50);
    H = ifftshift(H);
    f = ifft2(F.*(H/255),'symmetric');
    showImage(imA +f);
    Psnr1 = calcPSNR((imA+f),imO);
    disp(Psnr1);
   
    
    imA = imA+f;
F=fft2(imA);
H=circle(size(imA),20);
H = ifftshift(H);
f = ifft2(F.*(H/255),'symmetric');
showImage(imA +f);
Psnr3 = calcPSNR((imA+f),imO);
   disp(Psnr3);
   
    imA = imA+f;
F=fft2(imA);
H=circle(size(imA),30);
H = ifftshift(H);
f = ifft2(F.*(H/255),'symmetric');
showImage(imA +f);
Psnr5 = calcPSNR((imA+f),imO);
   disp(Psnr5);
   imA = imA+f;
F=fft2(imA);
H=circle(size(imA),40);
H = ifftshift(H);
f = ifft2(F.*(H/255),'symmetric');
showImage(imA +f);
Psnr5 = calcPSNR((imA+f),imO);
   disp(Psnr5);
   showImage(imO);
end
