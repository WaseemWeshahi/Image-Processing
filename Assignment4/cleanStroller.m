function cleanStroller()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% STROLLER %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('The stroller image was blurred.');
    disp('so we thought that all we need to do is to shrpen it.');
    disp('we have tried two ways of sharpening the image:');
    disp('1)by using high pass filter:');
    disp('2) or we could simply use sharpen function we have written in HW3');
    disp('In this code, we are showing you the denoised image by using HPF and then bilateral filtering.');
    disp('so what we did is the following:');
    disp('We have performed HPF several times,each time we have added the result to the image,');
    disp(' and then applied the next HPF on the modified image.');
    disp('We have performed the HPF filtering four times.');
    disp('The result was very close to what should it be, but it was noised!');
    disp('So we used bilateral filtering to denoise it and the result was stunning!');
    disp('figure(1) - Original Noisy image');
    disp('figure(2) - The Cleaned Image by HPF (but noised)');
    disp('figure(3) - The final Image,cleaned by bilateral filtering ');

    
    imA = readImage('stroller.tif');
    showImage(imA);
   
    % applying HPF on imA
    
    F=fft2(imA);
    H=circle(size(imA),50);
    H = ifftshift(H);
    f = ifft2(F.*(H/255),'symmetric');
    
    % f now is the result of applying HPF on imA
    
    imA = imA+f;%we are sharpening imA by adding f to it => imA = imA+HPF(imA)
    
    % applying HPF on the modified imA
    
    F=fft2(imA);
    H=circle(size(imA),20);
    H = ifftshift(H);
    f = ifft2(F.*(H/255),'symmetric');
    
    % f now is the result of applying HPF on imA

    imA = imA+f;%we are sharpening imA by adding f to it => imA = imA+HPF(imA)= imA+HPF(imA)+HPF(imA+HPF(imA))
    
    F=fft2(imA);
    H=circle(size(imA),30);
    H = ifftshift(H);
    f = ifft2(F.*(H/255),'symmetric');
    
    % f now is the result of applying HPF on imA
    
    imA = imA+f;%we are sharpening imA by adding f to it => imA = imA+HPF(imA)= imA+HPF(imA)+HPF(imA+HPF(imA))+HPF(imA+HPF(imA)+HPF(imA+HPF(imA)))
    
    % doing one more HPF
    F=fft2(imA);
    H=circle(size(imA),40);
    H = ifftshift(H);
    f = ifft2(F.*(H/255),'symmetric');
    imG=imA+f;%imG = imA+f=imA+HPF(imA)+HPF(imA+HPF(imA))+HPF(imA+HPF(imA)+HPF(imA+HPF(imA)))+HPF(imA+HPF(imA)+HPF(imA+HPF(imA))+HPF(imA+HPF(imA)+HPF(imA+HPF(imA))))
    showImage(imG);
    clean=bilat(imG,4,9,9); %imG is a little bit noised from the whole filters we have done, so we denoise it using bilateral filtering
    showImage(clean);
   
    writeImage(clean,'cleanStroller');
   
end
