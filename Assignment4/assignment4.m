%{
imA = readImage('blocks.tif');

showImage(imA);

imB=cleanImageMedian(imA,[2 0]);
putImage(imB);




%}

%%%%%%%%%%%%%%%%%%%%%
%{
imA = readImage('oldWoman');
showImage(imA);
[width,height] = size(imA);
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

%{
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
clean = [fu;f];
showImage(clean);
%[x,y]=ginput(2);
%}

%%%%%%%%%%%%%%%%%%%%%%%
%{
imA = readImage('stroller.tif');
showImage(imA);
imO = readImage('stroller2.tif');

F=fft2(imA);
H=circle(size(imA),20);
H = ifftshift(H);
f = ifft2(F.*(H/255),'symmetric');
%showImage(f+128);
showImage(imA +f);
Psnr1 = calcPSNR((imA+f),imO);
%title('HPF+orginal');
imB = imA+f;
F=fft2(imB);
H=circle(size(imB),7);
H = ifftshift(H);
f = ifft2(F.*(H/255),'symmetric');
%showImage(f+128);
showImage(imA +f);
Psnr2 = calcPSNR((imA+f),imO);
%title('HPF(HPF+orginal)+orginal');
showImage(imB +f);
Psnr3 = calcPSNR((imB+f),imO);
%title('HPF(HPF+orginal)+(HPF+original');
imC = sharpen(imA,2,2,5);
Psnr4 = calcPSNR(imC,imO);

showImage(imC);
showImage(imO);



%}
%%%%%%%%%%%%%%%%%%%%%%
% STROLLER using FFT
%{
im = readImage('stroller');
showImage(im);
showFFT(im);
G=fft2(im);
%%% make the gaussia kernel
mask = getGaussianKernel([4 4],10);
h = zeros(size(G));
h(1:size(mask,1),1:size(mask,2))=mask;
showFFT(h);
H = fft2(h);
Hstr = conj(H);
lambda= 0.000001;
FU = (G.*Hstr)./(H.*Hstr+lambda);
f = ifft2(FU,'symmetric');
showImage(f);
%}
%%%%%%%%%%%%%%%%%%%%%5
%{
imA = readImage('face.tif');
showImage(imA);
imB=cleanImageMedian(imA,[1 1]);
%showImage(imB);
imB=cleanImageMedian(imB,[1 0]);
%showImage(imB);
imB=cleanImageMedian(imB,[1 0]);
%showImage(imB);
imC = sharpen(imB,2,2,2);
showImage(imC);


%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
imA = readImage('mission.tif');
showFFT(imA);
F = fft2(imA);
mask = ones(size(imA));
mask = 255*mask;
mid = size(imA)/2;
mask(mid(1)-25:mid(1)+25,mid(2)-25:mid(2)+25) = 0;
mask(mid(1)-15:mid(1)+15,mid(2)-15:mid(2)+15)=255;
mask = cleanImageMean(mask,[5 5],100);
% mask = band(size(imA),25,10);
mask = ifftshift(mask);
mask(mid(1)-5:mid(1)+5,:)=255;
mask(:,mid(2)-5:mid(2)+5)=255;
f = ifft2(F.*(mask/255),'symmetric');
showImage(f);
%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




