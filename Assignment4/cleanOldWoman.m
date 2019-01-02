function cleanOldWoman()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% OLD WOMAN %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('we can observe that in this image there is a frequent noise we ');
    disp('need to remove - which is so identical to the dog image we have seen');
    disp('in class. ');
    disp('Therefore we have transformed the image using fft2 to the fourier domain.');
    disp('We could observe four white points which seem a bit off to the image ');
    disp('- which is actually the FFT of the  frequency noise-.');
    disp('So all we had to do is to find out the coordiantes of these points, and make them zero');
    disp('we did that using the ginput matlab function. we made these point equal to zero in');
    disp('the Fourier domain, then we applied the inverse transform on the image');
    disp('and magically the noise was gone!');
    disp('figure 1 : The noisy image');
    disp('figure 2 : the FFT of the image, notice the four white dots around the origin');
    disp('figure 3 : the clean Image');
    
    imA = readImage('oldWoman');
    showImage(imA);
    showFFT(imA);
    [width,height] = size(imA);
    F=fft2(imA);
     
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