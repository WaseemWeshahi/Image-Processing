function    noisyIm = addSPnoise(im, p)
noisyIm=im;
temp = rand(size(im));
zero=find(temp<p/2);
noisyIm(zero)=0;
one=find(temp>=p/2 & temp <p);
noisyIm(one)=255;

