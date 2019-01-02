function cleanMission()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% CUPS %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('This image is noised by ringing, and we have learned in class that');
    disp('the "ringing" part of the image is placed in a ring around the center point');
    disp('And if we look the FFT of the image, notice a weird white square ring');
    disp('around the ceneter');
    disp('so our intuitions tell us that the ringing comes from that area,');
    disp('so we simply ommit this part of the FFT by getting the coordiantes');
    disp('and multiplying the FFT with a mask that multiplies the ring with 0.');
    disp('in the resulting image, though we have got rid of the ringing,');
    disp('we were cursed with the Gibbs artifact, which we found no solution for it');
    disp('figure 1 : Original noisy image');
    disp('figure 2 : FFT of the image (notice the square ring around the center')
    disp('figure 3 : the mask we multipled the image''s FFT with ');
    disp('figure 4 : the Resulted image');
    imA = readImage('mission.tif');
    showImage(imA);
    showFFT(imA);
    F = fft2(imA);
    
    % Creating the "black ring" mask and smoothly spreading it
    mask = ones(size(imA));
    mask = 255*mask;
    mid = size(imA)/2;
    mask(mid(1)-25:mid(1)+25,mid(2)-25:mid(2)+25) = 0;
    mask(mid(1)-15:mid(1)+15,mid(2)-15:mid(2)+15)=255;
    mask = cleanImageMean(mask,[5 5],100);
    mask = ifftshift(mask);
    mask(mid(1)-5:mid(1)+5,:)=255;
    mask(:,mid(2)-5:mid(2)+5)=255;
    showImage(fftshift(mask));
    
    f = ifft2(F.*(mask/255),'symmetric');
    showImage(f);
end