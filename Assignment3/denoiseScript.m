% The Script
disp('%%%%%%%%%%%%%%%%%%%%% A %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('communistLeaders.tif');
showImage(imA);
SP = addSPnoise(imA,0.05);
showImage(SP);
mean = cleanImageMean(SP,[4,4],2);
med = cleanImageMedian(SP,[2,2]);
showImage(mean);
showImage(med);
disp('Figure 1: The original Image.');
disp('Figure 2: the image under salt and pepper effect (P=0.05))');
disp('Figure 3: the Image "cleaned" by averaging with a maskRadius of 4 and STD=2');
disp('Figure 4: the Image "cleaned" by taking the median, maskRadius of 4');
dif = calcPSNR(SP,imA);
fprintf('PSNR diff between Original and noised image: %.4f\n',dif);
dif = calcPSNR(mean,imA);
fprintf('PSNR diff between Original and mean-cleaned image: %.4f\n',dif);
dif = calcPSNR(med,imA);
fprintf('PSNR diff between Original and median-cleaned image: %.4f\n',dif);
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% B %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('karlMarx.tif');
showImage(imA);
SP = addGaussianNoise(imA,4);
showImage(SP);
mean = cleanImageMean(SP,[5,5],0.8);
med = cleanImageMedian(SP,[5,5]);
showImage(mean);
showImage(med);
disp('Figure 1: The original Image.');
disp('Figure 2: the image under Gaussian noise (std=5))');
disp('Figure 3: the Image "cleaned" by averaging with a maskRadius of 4 and STD=2');
disp('Figure 4: the Image "cleaned" by taking the median, maskRadius of 4');
dif = calcPSNR(SP,imA);
fprintf('PSNR diff between Original and noised image: %.4f\n',dif);
dif = calcPSNR(mean,imA);
fprintf('PSNR diff between Original and mean-cleaned image: %.4f\n',dif);
dif = calcPSNR(med,imA);
fprintf('PSNR diff between Original and median-cleaned image: %.4f\n',dif);
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% C %%%%%%%%%%%%%%%%%%%%%');
disp('In our eyes, the Salt&Pepper noise is best cleaned by median filter');
disp('While the gaussian noise is best cleaned by averaging kernels (in this example,a gaussian filter)');
disp('Those answers are backed up by both visual arguments (they look better these ways) and in numerical objective arguments (the PSNR is greater in each case)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% D %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('karlMarx.tif');
showImage(imA);
SP = addSPnoise(imA,0.2);
showImage(SP);
figure
x = 1:5;
y=x;
for i=1:length(x)
    y(i) = calcPSNR(cleanImageMedian(SP,[x(i),x(i)]),imA);
end
plot(x,y);
xlabel('maskRadius');
ylabel('PSNR');
title('PSNR  as a function of maskRadius');
disp('in the following figure, you can see the PSNR values between original and median-denoised image as a function of the size of median neighborhood – maskRadius');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% E %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('karlMarx.tif');
showImage(imA);
GI = addGaussianNoise(imA,5);
showImage(GI);
figure
x = 1:10;
y=x;
for i=1:length(x)
    y(i) = calcPSNR(cleanImageMean(GI,[x(i),x(i)],0.8),imA);
end
plot(x,y);
xlabel('maskRadius');
ylabel('PSNR');
title('PSNR  as a function of maskRadius');
disp('in the following figure, you can see the PSNR values between original and main-denoised image as a function of the size of median neighborhood – maskRadius');
disp('As we can see, the PSNR increases, since the mean square differnce between the image and its average is minimal therefor the PSNR increases alongside the maskRadius');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% F %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('Alan_Turing.tif');
showImage(imA);
imArray = zeros([size(imA),10]);
for i=1:size(imArray,3)
    imArray(:,:,i) = addGaussianNoise(imA,4);
end
meanFilt = cleanImageMean_multi(imArray);
medianFilt = cleanImageMedian_multi(imArray);
figure(1);
showImage(meanFilt);
title('image cleaned with mean');
figure(2);
showImage(medianFilt);
title('image cleaned with median');




