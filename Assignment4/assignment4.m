

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




%%%%%%%%%%%%%%%%%%%%%
%{
imA = readImage('oldWoman');
showImage(imA);
 
F=fft2(imA);
%D=log(1+abs(F));
%D =fftshift(D);
%imagesc(D);
% [x,y]=ginput(4)

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



%%%%%%%%%%%%%%%%%%%%
%{
%trying to solve cups
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
imB = readImage('house.tif');

showImage(imB);showImage(imB);
F=fft2(imB);
D=log(1+abs(F));
D =fftshift(D);
imagesc(D);

[width,height]=size(imB);
H=zeros(width,height);
H(width,20)=0.5;
H(8,1)=0.5;
H=fft2(H);
h = find(abs(H)<0.001);
H(h)=1;


showImage(abs(ifft2(F./H)));
%[x,y]=ginput(2);


showImage(imB);showImage(imB);
F=fft2(imB);
D=log(1+abs(F));
D =fftshift(D);
imagesc(D);

[width,height]=size(imB);
H=zeros(width,height);
H(width,20)=0.5;
H(8,1)=0.5;
H=fft2(H);
h = find(abs(H)<0.001);
H(h)=1;


showImage(abs(ifft2(F./H)));
%[x,y]=ginput(2);


%}
