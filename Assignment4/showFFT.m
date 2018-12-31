function showFFT(im)
F=fft2(im);
D=log(1+abs(F));
D =fftshift(D);
showImage(D);
imagesc(D);
end