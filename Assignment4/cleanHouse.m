function cleanHouse()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% HOUSE %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('if we look closely at figure 1, we see that the bottom part of the');
    disp('image is noised by gaussian noise, and that the entire image (including');
    disp('the bottom part) is noised with horoziontal motion blur');
    disp('therfore we have split the restoration into two parts');
    disp('in the UPPER part we applied INVERSE FILTIRING since we know that');
    disp('the kernel is one of motion blur, so we only needed to guess the ');
    disp('t (length of motion blurs kernel) and lambda (prior terms constant');
    disp('and for the BOTTOM part we used WEINERR FILTIRING since both a convulotion');
    disp('AND gaussian noise were applied');
    disp('so after guessing the parameters with trial and error we have reached the following');
    disp('result shown in figure 2.');
    disp('figure(1) - Original Noisy image');
    disp('figure(2) - Cleaned Image');
    %% Splitting the Image
    im = readImage('house.tif');
    imU = im; % Upper image
    imB = im;
    imU(128:256,:)=[];
    imB(1:127,:)=[];
    %% cleaning the Upper part (Inverse Filtering)
    G=fft2(imU);
    t = 10; % the motion blur's kernel, 10 worked well
    mask = zeros(1,t);
    mask(1,:) = 1/t;
    h = zeros(size(G));
    h(1,1:t)=mask;
    H = fft2(h); % H is the FFT of the motion blur's mask
    Hstr = conj(H);
    lambda= 0.00005; % 0.00005 seemed to work well
    % After setting the parameters, we apply the inverse filtering
    FU = (G.*Hstr)./(H.*Hstr+lambda);
    fu = ifft2(FU,'symmetric');
    %% cleaning the Bottom part (Weinerr Filtering)
    F = weiner(imB,mask,0.000008); % 0.000008 seemed to work well
    f = ifft2(F,'symmetric');
    %% concatenating the two parts and showing them to the screen
    clean = [fu;f];
    showImage(im);
    showImage(clean);
end