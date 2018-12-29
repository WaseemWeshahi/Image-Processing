
%{
imA = readImage('blocks.tif');
showImage(imA);

imB = maxIm(minIm(minIm(maxIm(imA,[01,1]),[1,1]),[1,1]),[1,1]);
showImage(imB);

%f=fft2(imB);
%D=log(1+abs(f));
%D =fftshift(D);
%imagesc(D);



%}
%%%%%%%%%%%%%%%%%%%%%
%{
imA = readImage('oldWoman');
showImage(imA);
 
f=fft2(imA);
D=log(1+abs(f));
D =fftshift(D);
imagesc(D);

dc = f(1,1);
h = find(abs(f)>=350317);
f(h)=0;
f(1,1)=dc;
F=abs(ifft2(f));
putImage(imA);
putImage(F);

%}
%%%%%%%%%%%%%%%%%%%%
%{
imA = readImage('lena.tif');
showImage(imA);
[width,height]=size(imA);
M = zeros(width,height);
M(1,1)=0.5;
M(8,13)=0.5;
M = fft2(M);
bim=abs(ifft2(fft2(imA).*M));
showImage(bim);
h = find(abs(M)<0.01);
M(h)=1;
bim = abs(ifft2(fft2(bim)./M));
showImage(bim);

imB = readImage('cups.tif');
showImage(imB);
[width,height]=size(imB);
M = zeros(width,height);
M(10,11)=1.5;
M(width,1)=-0.5;
%M(5,8)=-0.3;

M = fft2(M);
%bim=abs(ifft2(fft2(imB).*M));
%showImage(bim);
h = find(abs(M)<0.011);
M(h)=1;
bim = abs(ifft2(fft2(imB)./M));
showImage(bim);

bim = abs(ifft2(fft2(bim)./M));

showImage(bim);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%trying to implement high pass
%{
imA = readImage('lena.tif');
[width,height]=size(imA);


imA = cleanImageMedian(imA,[3,3]);



f=fft2(imA);
D=log(1+abs(f));
D =fftshift(D);
imagesc(D);
[x,y]=ginput(1);

D0 = abs(f(round(x),round(y)));
H =f;
h = find(abs(f)>D0);
H(h)=1;

h = find(abs(f)<=D0);
H(h)=0;
F=abs(ifft2(f.*H));
showImage((F+imA));
%}


