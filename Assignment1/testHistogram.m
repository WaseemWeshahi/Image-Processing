%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demo script for Assignment #1 in Image Processing
% Made By:
% Waseem Weshahi 206943391
% &
% Bayan Farhan   208300145
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('hello world!!');
disp('This Demo Script will walk you through various the functions we have written.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a
% First we show the randomly permutated Lena Image which we created
% and how it has the same histogram of the original Lena's picture

im = readImage('lena.tif');
rim = readImage('randomLena.tif');
showImage(im);
showImage(rim);
h1 = nhistImage(im);
h2 = nhistImage(rim);
disp('a)here, we can see a picture of lena, and a (permutated) picture of the same image, which looks noisy');
disp('but in fact, those two pictures have the same histogram, for their histogram differnece is a 0 vector:');
fprintf("sum(h1-h2) = %.2f\n",sum(h1-h2));
disp('press any key to continue');
pause;
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b
% Here we try to understand how blurring impacts both contrast and entropy
% of the image by plotting a graph between them
disp('b)Please wait a moment while we calculate histograms of blurred images');
disp('it may take a few seconds..');

%calculating 100 histograms for 100 levels of blurrness
histograms = zeros(1,256,100);
for blurLevel = 1:100
    % we blur the image with different levels
    % then round to nearst grey scale value to get a valid grey scale image
    blurred = blurImage(im,blurLevel);
    blurred = round(blurred);
    histograms(:,:,blurLevel) = nhistImage(blurred);
end
disp('finished.');

entropies = 1:100;
contrasts = 1:100;
for blurLevel = 1:100
    %calculating etropies for each histogram
    [~,~,entropies(blurLevel)] = calcHistStat(histograms(:,:,blurLevel));
    %contrast is defined as the differnce in the max and min grey scale
    %values that are not 0
    contrasts(blurLevel) = getContrast(histograms(:,:,blurLevel));
end
axis = 1:100;

figure(1)
plot(axis,entropies);
ylabel('Image entropy');
xlabel('blurring level');
title('Entropy as a function of blurring level');

figure(2)
plot(axis,contrasts);
ylabel('Image contrast');
xlabel('blurring level');
title('Contrasts as a function of blurring level');

disp('In figures 1 & 2, we have two graphs, Image contrast and Image entropy as a function of blurring level');
disp('Notice how both entropy & contrast decrease as images get more blurry');
disp('**NOTE: CONTRAST IN THIS ASSIGNMENT IS DEFINED AS MAX-MIN GREY VALUE IN THE IMAGE**');
disp('press any key to continue');
pause;
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%c
% Here we maximize contrast whilst maintaining the same mean value of the
% original image
im = readImage('dark.tif');
h1 = nhistImage(im);
tm = zeros(1,256);
axis = 0:255;
% calculating the max and min grey values of the image
max =  find(h1>0,1,'last');
min =  find(h1>0,1,'first');
% Image's mean
[m1,~,~] = calcHistStat(h1); 
k1 = (255-m1)/(max-m1); 
k2 = ( 0 - m1) / (min - m1);
k = mink([k1;k2],1);
% this tone map increases contrast by K whilst perserving the same mean val
tm = k*(axis-m1)+m1;
tm = fix(tm);
% clipping
tm(tm<0) = 0; 
tm(tm>255) = 255;
maxContrast = mapImage(im,tm); % applying the contrast maxing tone map
showImage(im);

showImage(maxContrast);
disp('c) in figure 1 we see the dark image of the child, while in figure 2 we have increased the contrast whilst maintaining the mean');
disp('*notice how the image got sharper');
figure(3);
plot(axis,tm);
title('Contrast maximizing tone map');
xlabel('old grey scale values');
ylabel('new grey scale values');
disp('the tone map used in this image is plotted in figure 3');
[m1,~,e1] = calcHistStat(h1);
c1 = getContrast(h1);
h2 = nhistImage(maxContrast);
[m2,~,e2] = calcHistStat(h2);
c2 = getContrast(h2);
disp('In original picture, mean,contrast,entropy = ');
disp([m1,c1,e1]);
disp('In the high contrast Image, mean, contrast,entropy = ');
disp([m2,c2,e2]);
disp('notice how contrast has increased, mean stayed the same (roughly speaking) and entropy has decreased ever so slightly');
disp('press any key to continue');
pause;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%d
% This part shows the negated version of the image
im = readImage('lena.tif');
axis = 0:255;
% the tone map which negates the picture
tm = 255 - axis;
neg = mapImage(im,tm);
showImage(im);
showImage(neg);
figure(3);
plot(axis,tm);
title('Negating tone map');
xlabel('old grey scale values');
ylabel('new grey scale values');
disp('d) what you see in figure 1 is the original image, and in figure 2 we have the negative of that image');
disp('the tone map we used is plotted in figure 3');
disp('press any key to continue');
pause;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%e
% In this chunk we perform Thresholding on the image
% T is the threshold value
T=122; 
im = readImage('object.tif');
% defining the threshold tone map
tm(1:T-1)=255;
tm(T:256)=0;
% applying the thrshold tone map
nim = mapImage(im,tm);
showImage(im);
showImage(nim);
figure(3);
plot(axis,tm);
title('Thresholding tone map (w/ T=122)');
xlabel('old grey scale values');
ylabel('new grey scale values');
disp('e) in figure 1 you can see the original image, and in figure 2 we have the Thresholded version of it (with threshold value of 122');
disp('notice how the object became prominent since its pixels values are lower than the background`s values');
disp('therefor the object was (mostly) mapped to 255 - white and the background was (mostly) mapped to 0 - black');
disp('the tone map we used is plotted in figure 3');
disp('press any key to continue');
pause;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%f
% Here we perform histogram equalization on two different images that have
% no connnection between them
mt = readImage('mountainScene');
lk = readImage('lakeScene');
nim = imHistShape(mt,lk);
h1 = nhistImage(mt);
h2 = nhistImage(lk);
h3 = nhistImage(nim);
showImage(mt);
showImage(lk);
showImage(nim);
figure(4);
bar(h1);
title('first image`s histogram');
figure(5);
bar(h2);
title('second image`s histogram');
figure(6);
bar(h3);
title('first image after histogram equalization`s histogram');
[m1,v1,e1] = calcHistStat(h1);
[m2,v2,e2] = calcHistStat(h2);
[m3,v3,e3] = calcHistStat(h3);
c1 = getContrast(h1);
c2 = getContrast(h2);
c3 = getContrast(h3);
disp('f) in figure 1, we see the first image, figure 2 has the second image and figure 3 has the first image after the Histogram equalization with the second image');
disp('figures 3 to 6 show the histograms of the mentioned images');
disp('notice how the white clouds from the first picture became one with the dark sky in the second picture,');
disp('also notice how histogram stats became more similar: ');
fprintf('mean, contrast, entropy of the first Image: %.3f %.3f %d\n',m1,c1,e1);
fprintf('mean, contrast, entropy of the second Image: %.3f %.3f %d\n',m2,c2,e2);
fprintf('mean, contrast, entropy of the EQUALIZED first Image: %.3f %.3f %d\n',m3,c3,e3);
disp('press any key to continue');
pause;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%g
% Here we perform histogram equalization to the 'darkImage' 
im = readImage('darkImage.tif');
desired = readImage('stroller.tif');
nim = imHistShape(im,desired);
h1 = nhistImage(im);
h2 = nhistImage(desired);
h3 = nhistImage(nim);
showImage(im);
showImage(desired);
showImage(nim);
figure(4);
bar(h1);
title('dark image`s histogram');
figure(5);
bar(h2);
title('desired image`s histogram');
figure(6);
bar(h3);
title('result of histogram equalization on the dark image to the desired');
disp('g) in figure 1, we see the dark image, figure 2 has the "desired" image and figure 3 has the first image after the Histogram equalization with the second image');
disp('figures 3 to 6 show the histograms of the mentioned images');
pause;
disp('press any key to continue');
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('********************************************************************');
disp('that is it for this assignment, Thank you for your time :)');
disp('Regards,');
disp('Waseem Weshahi 206943391');
disp('& ');
disp('Bayan Farhan   208300145');
