function showFFT(im)
F=fft2(im);
D=log(1+abs(F));
D =fftshift(D);
imagesc(D);
end