
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


F=abs(ifft2(f.*H));
showImage(imB);
showImage((F+imB));
%}


%%%%%%%%%%%%%%%%%%%%%

imA = readImage('oldWoman');
showImage(imA);
 
F=fft2(imA);
D=log(1+abs(F));
D =fftshift(D);
imagesc(D);
mask = circle(size(imA),34);
% [x,y]=ginput(4)

% using the above 4 lines of code, we have managed to discover the exact
% indecies in f we need to put to zero

% for i=1:width
%     for j=1:height
%         if(j==32 ||j==31 || j==30 )&&(  i==21)
%             f(i,j)=0;
%         end 
%         if(j==32 ||j==31 || j==30 )&&(  i== width-10 || i==width-9 ||  i==width-8)
%             f(i,j)=0;
%         end 
%         if(j==height-32 || j==height-30 || j== height-29 || j==height-31 )&&(  i== 10 || i==9 ||  i==8)
%             f(i,j)=0;
%         end
%         if(j==height-32 || j==height-30 || j== height-29 || j==height-31 )&&(  i==width-19 || i==width-18 || i==width-20)
%             f(i,j)=0;
%         end
%     end
% end
showImage(mask);
mask = ifftshift(mask);

F = F.* (mask/255);
f=abs(ifft2(F));
putImage(imA);
putImage(f);
%%%%%%%%%%%%%%%%%%%%
%trying to solve cups
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


