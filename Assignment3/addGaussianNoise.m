function    noisyIm = addGaussianNoise(im, s)
noisyIm = im + (s^2)*randn(size(im));
noisyIm = round(noisyIm);
noisyIm(noisyIm>255)=255;
noisyIm(noisyIm<0)=0;
