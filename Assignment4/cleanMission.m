function cleanMission()
    imA = readImage('mission.tif');
    showFFT(imA);
    F = fft2(imA);
    mask = ones(size(imA));
    mask = 255*mask;
    mid = size(imA)/2;
    mask(mid(1)-25:mid(1)+25,mid(2)-25:mid(2)+25) = 0;
    mask(mid(1)-15:mid(1)+15,mid(2)-15:mid(2)+15)=255;
    mask = cleanImageMean(mask,[5 5],100);
    % mask = band(size(imA),25,10);
    mask = ifftshift(mask);
    mask(mid(1)-5:mid(1)+5,:)=255;
    mask(:,mid(2)-5:mid(2)+5)=255;
    f = ifft2(F.*(mask/255),'symmetric');
    showImage(f);
end