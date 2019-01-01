function cleanCups()
    imB = readImage('cups.tif');
    showImage(imB);showImage(imB);

    D=log(1+abs(fft2(imB)));
    D =fftshift(D);
    imagesc(D);
    %showImage(imB);
    [width,height]=size(imB);
    M = zeros(width,height);
    M(8,20)=0.5;
    %M(1,height)=-0.2;
    M(6,1)=0.5;

    showImage(M);
    M = fft2(M);
    D=log(1+abs(M));
    D =fftshift(D);
    imagesc(D);
    h = find(abs(M)<0.02);
    M(h)=1;
    bim = abs(ifft2(fft2(imB)./M));
    showImage(bim);
end