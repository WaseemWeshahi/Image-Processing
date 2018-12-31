%{
imA = readImage('blocks.tif');

showImage(imA);

imB = maxIm(minIm(minIm(maxIm(imA,[01,1]),[1,1]),[1,1]),[1,1]);
%showImage(imB);

F=fft2(imB);
%D=log(1+abs(f));
%D =fftshift(D);
%imagesc(D);
H=circle(size(imB),20);
%H=~H;
%showImage(H);
H = ifftshift(H);
f = ifft2(F.*(H/255),'symmetric');
%putImage(f+128);
showImage(imB);
showImage(f+imB);

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

f=abs(ifft2(F));
showImage(f);
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

im = readImage('house.tif');
imU = im; % Upper image
imB = im;
imU(128:256,:)=[];
imB(1:127,:)=[];
showImage(imU);
showFFT(imU);
G=fft2(imU);
[n,m] = size(G);
% mask =ones(n,m);
% mask(:,1:r)=1;
% mask(:,m-r:m)=0;
% mask(r:n-r,r:m-r)=0;
% showImage(fftshift(mask)*255);
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
showImage(f);
clean = [fu;f];
%[x,y]=ginput(2);



%%%%%%%%%%%%%%%%%%%%%%%
%{
imA = readImage('stroller.tif');
showImage(imA);

F=fft2(imA);
H=circle(size(imA),20);
H = ifftshift(H);
f = ifft2(F.*(H/255),'symmetric');
%showImage(f+128);
showImage(imA +f);

imA = imA+f;
F=fft2(imA);
H=circle(size(imA),7);
H = ifftshift(H);
f = ifft2(F.*(H/255),'symmetric');
%showImage(f+128);
showImage(imA +f);
%}
%{
im = readImage('windows.tif');
showFFT(im);
%}
