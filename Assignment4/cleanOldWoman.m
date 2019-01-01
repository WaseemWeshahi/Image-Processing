function cleanOldWoman()
    imA = readImage('oldWoman');
    showImage(imA);
    [width,height] = size(imA);
    F=fft2(imA);
    D=log(1+abs(F));
    D =fftshift(D);
    imagesc(D);

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
end