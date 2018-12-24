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
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% E %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('karlMarx.tif');
showImage(imA);
GI = addGaussianNoise(imA,10);
showImage(GI);
disp('Figure 1, Original image');
disp('Figure 2, Gaussian Noised Image');
figure
x = 0.5:0.1:1.5;
y=x;
for i=1:length(x)
    y(i) = calcPSNR(cleanImageMean(GI,[5 5],x(i)),imA);
end
plot(x,y);
xlabel('mask STD');
ylabel('PSNR');
title('PSNR  as a function of maskSTD');
disp('in the following figure, you can see the PSNR values between original and main-denoised image as a function of the size of median neighborhood – maskRadius');
disp('As we can see, the PSNR increases when the standard deviation increases');
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% F %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('Alan_Turing.tif');
showImage(imA);
imArray = zeros([size(imA),10]);
for i=1:size(imArray,3)
    imArray(:,:,i) = addGaussianNoise(imA,8);
end
meanFilt = cleanImageMean_multi(imArray);
medianFilt = cleanImageMedian_multi(imArray);
figure(1);
showImage(meanFilt);
title('image cleaned with mean');
figure(2);
showImage(medianFilt);
disp('In figure 1 we see the Original image');
disp('Figure 2 has is the mean result of the image array');
disp('Figure 2 has is the median result of the image array');
title('image cleaned with median');
fprintf("PSNR between mean and original:   %.3f\n",calcPSNR(meanFilt,imA));
fprintf("PSNR between median and original: %.3f\n",calcPSNR(medianFilt,imA)); 
disp('We can see the PSNR between the MEAN image and the original is the highest therfore:');
disp('cleaning by MEAN is recommended for Gaussian Noise');
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% G %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('Alan_Turing.tif');
showImage(imA);



