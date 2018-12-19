function    noisyIm = addSPnoise(im, p)
noisyIm = im;

[width,height]=size(im);% the size of the matrix

amount = width*height*p;%the amount of pixles that needs to be changed
amount=floor(amount);

rows = 1 + (width-1)*rand(amount);%rows is an array of size amount with random numbers between 1 and width
cols = 1+ (height-1)*rand(amount);%cols is an array of size amount with random numbers between 1 and height

loops = floor(amount/2);
%we loop over all the even indicies of rows and cols
for i = 1:loops
   
    noisyIm(round(rows(2*i)),round(cols(2*i)))=0;
end

loops = ceil(amount/2);
%we loop over all the odd indicies of rows and cols

for i = 1:loops
    
   noisyIm(round(rows(2*i-1)),round(cols(2*i-1)))=255;
end

