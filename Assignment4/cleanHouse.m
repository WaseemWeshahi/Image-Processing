function cleanHouse()
    im = readImage('house.tif');
    imU = im; % Upper image
    imB = im;
    imU(128:256,:)=[];
    imB(1:127,:)=[];
    showImage(imU);
    showFFT(imU);
    G=fft2(imU);
    t = 10;
    mask = zeros(1,t);
    mask(1,:) = 1/t;
    h = zeros(size(G));
    h(1,1:t)=mask;
    showFFT(h);
    H = fft2(h);
    Hstr = conj(H);
    lambda= 0.00005;
    FU = (G.*Hstr)./(H.*Hstr+lambda);
    fu = ifft2(FU,'symmetric');
    showImage(fu);

    G = fft2(imB);
    mask = zeros(1,t);
    mask(1,:) = 1/t;
    h = zeros(size(G));
    h(1,1:t)=mask;
    showFFT(h);
    H = fft2(h);
    Hstr = conj(H);
    lambda= 0.000008;
    F = H;
    for u=1:size(imB,1)
    for v=1:size(imB,2)
        F(u,v) = (Hstr(u,v)*G(u,v))/ (Hstr(u,v)*H(u,v)+lambda*(u^2+v^2));
    end
    end

    D=log(1+abs(F));
    D =fftshift(D);
    imagesc(D);

    f = ifft2(F,'symmetric');
    clean = [fu;f];
    showImage(clean);
end