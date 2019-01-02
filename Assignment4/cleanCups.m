function cleanCups()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% CUPS %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('We can observe that this image was noised by echo.');
    disp('We thought about two possible ways to remove it:');
    disp('1) we could find the mask and divide the image by the mask (in the fourier domain)');
    disp('2) alternativly, we could apply fft2 to the image and notice a frequent noise,');
    disp('very similar to the noise we noticed in the old woman image.');
    disp('so we could apply fft2 to the fft image and find out the coordinates of the irrelevant pixels');
    disp('and just make them zero.');
    disp('we chose to apply the first method, which luckly worked so well so we were satisfied with the result');
    
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