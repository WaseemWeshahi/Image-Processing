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
    disp('In our eyes,The sharpen seemed to work better.But PSNR suggests the 1-1 actually is the better one');
    
    

    disp('figure(1) - Original Noisy image');
    disp('figure(2) - Cleaned Image');  
    imA = readImage('stroller.tif');
    showImage(imA);
    imO = readImage('stroller2.tif');

    F=fft2(imA);
    H=circle(size(imA),20);
    H = ifftshift(H);
    f = ifft2(F.*(H/255),'symmetric');
    %showImage(f+128);
    showImage(imA +f);
    Psnr1 = calcPSNR((imA+f),imO);
    %title('HPF+orginal');
    imB = imA+f;
    F=fft2(imB);
    H=circle(size(imB),7);
    H = ifftshift(H);
    f = ifft2(F.*(H/255),'symmetric');
    %showImage(f+128);
    showImage(imA +f);
    Psnr2 = calcPSNR((imA+f),imO);
    %title('HPF(HPF+orginal)+orginal');
    showImage(imB +f);
    Psnr3 = calcPSNR((imB+f),imO);
    %title('HPF(HPF+orginal)+(HPF+original');
    imC = sharpen(imA,2,2,5);
    Psnr4 = calcPSNR(imC,imO);

    showImage(imC);
    showImage(imO);
end
