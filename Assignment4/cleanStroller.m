function cleanStroller()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% STROLLER %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('BAYAN INSERT DESCRIPTION HERE');
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

%The following section is just there so that i dont delete what i've wasted
%my time on:(
%%%%%%%%%%%%%%%%%%%%%%
% STROLLER using FFT
%{
im = readImage('stroller');
showImage(im);
showFFT(im);
G=fft2(im);
%%% make the gaussia kernel
mask = getGaussianKernel([4 4],10);
h = zeros(size(G));
h(1:size(mask,1),1:size(mask,2))=mask;
showFFT(h);
H = fft2(h);
Hstr = conj(H);
lambda= 0.000001;
FU = (G.*Hstr)./(H.*Hstr+lambda);
f = ifft2(FU,'symmetric');
showImage(f);
%}