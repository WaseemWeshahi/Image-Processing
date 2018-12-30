%{
imA = readImage('blocks.tif');
showImage(imA);

imB = maxIm(minIm(minIm(maxIm(imA,[01,1]),[1,1]),[1,1]),[1,1]);
showImage(imB);

f=fft2(imB);
D=log(1+abs(f));
D =fftshift(D);
imagesc(D);
[x,y]=ginput(1);

%D0 = abs(f(round(x),round(y)));
H=zeros(width,height);
%h = find(abs(f)>D0);
%H(h)=1;
D0 = sqrt((x-1)*(x-1)+(y-1)*(y-1));
for i=1:width
    for j=1:height
        if sqrt((i-1)*(i-1) +(j-1)*(j-1))>D0
            H(i,j)=1;
        end
    end
end
showImage((imA));
D=log(1+abs(H));
D =fftshift(D);
imagesc(D);
F=abs(ifft2(f.*H));
showImage(F);
showImage((F+imB));
%}
%{
imA = readImage('lena.tif');
showImage(imA);
f=fft2(imA);
D=log(1+abs(f));
D =fftshift(D);
imagesc(D);
[x,y]=ginput(1);

%D0 = abs(f(round(x),round(y)));
H=zeros(width,height);
%h = find(abs(f)>D0);
%H(h)=1;
D0 = sqrt((x-1)*(x-1)+(y-1)*(y-1));
for i=1:width
    for j=1:height
        if sqrt((i-1)*(i-1) +(j-1)*(j-1))>D0
            H(i,j)=1;
        end
    end
end
showImage((imA));
D=log(1+abs(H));
D =fftshift(D);
imagesc(D);
F=abs(ifft2(f.*H));
showImage(F);
showImage((F+imA));
%}
%%%%%%%%%%%%%%%%%%%%%
%{
imA = readImage('oldWoman');
showImage(imA);
 
F=fft2(imA);
D=log(1+abs(F));
D =fftshift(D);
imagesc(D);
mask = circle(size(imA),30);

%  [x,y]=ginput(4)

% using the above 4 lines of code, we have managed to discover the exact
% indecies in f we need to put to zero

for i=1:width
    for j=1:height
        if(j==32 ||j==31 || j==30 )&&(  i==21)
            F(i,j)=0;
        end 
        if(j==32 ||j==31 || j==30 )&&(  i== width-10 || i==width-9 ||  i==width-8)
            F(i,j)=0;
        end 
        if(j==height-32 || j==height-30 || j== height-29 || j==height-31 )&&(  i== 10 || i==9 ||  i==8)
            F(i,j)=0;
        end
        if(j==height-32 || j==height-30 || j== height-29 || j==height-31 )&&(  i==width-19 || i==width-18 || i==width-20)
            F(i,j)=0;
        end
    end
end
f=ifft2(F,'symmetric');
putImage(imA);

putImage(f);
%}
%%%%%%%%%%%%%%%%%%%%
% trying to solve cups
% imA = readImage('lena.tif');
% showImage(imA);
% F = fft2(imA);
% D = log(1+abs(F));
% D = fftshift(D);
% imagesc(D);
% H = circle(size(imA),30);
% H = ~H;
% showImage(H*255);
% H = ifftshift(H);
% f = ifft2(F.*H,'symmetric');
% putImage(f+128);
% 


%%%%%%%%%%%%%%%%%%%%

%trying to solve cups
%{
imB = readImage('cups.tif');
showImage(imB);showImage(imB);

D=log(1+abs(fft2(imB)));
D =fftshift(D);
imagesc(D);
%showImage(imB);
[width,height]=size(imB);
M = zeros(width,height);
M(8,20)=0.5;
%M(1,height)=-0.2;
M(6,1)=0.5;

showImage(M);
M = fft2(M);
D=log(1+abs(M));
D =fftshift(D);
imagesc(D);
h = find(abs(M)<0.02);
M(h)=1;
bim = abs(ifft2(fft2(imB)./M));
showImage(bim);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imB = readImage('house.tif');
t = 5;
showImage(imB);showImage(imB);
showFFT(imB);
G=fft2(imB);
[n,m] = size(imB);
% mask =ones(n,m);
% mask(:,1:r)=1;
% mask(:,m-r:m)=0;
% mask(r:n-r,r:m-r)=0;
% showImage(fftshift(mask)*255);
h = zeros(n,m);
h(n/2,m/2 - t:m/2 + t)=1;
 h = h/ length(find(h==1));
showFFT(h);
H = fft2(h);
Hstr = conj(H);
lambda = 2;
u = 128;
v = u;
F = (Hstr.*G) ./ (Hstr.*H+lambda*(u^2+v^2));
D=log(1+abs(F));
D =fftshift(D);
imagesc(D);
f = ifft2(F,'symmetric');
showImage(f);

%[x,y]=ginput(2);



