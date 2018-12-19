function    noisyIm = addGaussianNoise(im, s)
noisyIm = im + s*randn(size(im));