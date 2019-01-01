function cleanCups()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% CUPS %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('BAYAN INSERT DESCRIPTION HERE');
    disp('figure(1) - Original Noisy image');
    disp('figure(2) - Cleaned Image');  
    imB = readImage('cups.tif');
    showImage(imB);

    [width,height]=size(imB);
    M = zeros(width,height);
    M(8,20)=0.5;
    %M(1,height)=-0.2;
    M(6,1)=0.5;

    M = fft2(M);
    M(abs(M)<0.02)=1;
    bim = abs(ifft2(fft2(imB)./M));
    showImage(bim);
end