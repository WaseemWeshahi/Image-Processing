function    noisyIm = addSPnoise(im, p)
noisyIm=im; % copying im into noisyIm to save the pixels that wont be changed
temp = rand(size(im)); % creating a matrix,as same size like im, with randm values between 0 and 1
black=find(temp<p/2);% saving the elements that have value less than p/2 in order to:
noisyIm(black)=0;% use them to change the equivilant pixels at noisyIm color to black
white=find(temp>=p/2 & temp <p);% saving the elements that have value less than p and greater than p/2 in order to:
noisyIm(white)=255;% use them to change the equivilant pixels at noisyIm color to white

