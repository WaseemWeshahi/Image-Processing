% The Checking Script for the 3rd Assignment
% Written By:
% Waseem Weshahi    206943391
% Bayan Farhan      208300145
disp('%%%%%%%%%%%%%%%%%%%%% A %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('dali.tif');
showImage(imA);
SP = addSPnoise(imA,0.05);
showImage(SP);
mean = cleanImageMean(SP,[4,4],0.8);
med = cleanImageMedian(SP,[2,2]);
showImage(mean);
showImage(med);
disp('Figure 1: The original Image.');
disp('Figure 2: the image under salt and pepper effect (P=0.05))');
disp('Figure 3: the Image "cleaned" by averaging with a maskRadius of 4 and STD=0.8');
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
disp('Figure 2: the image under Gaussian noise (std=4))');
disp('Figure 3: the Image "cleaned" by averaging with a maskRadius of 5 and STD=0.8');
disp('Figure 4: the Image "cleaned" by taking the median, maskRadius of 5');
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
imA = readImage('dali.tif');
SP = addSPnoise(imA,0.2);
figure
x = 1:7;
y=x;
disp('Calculating the image array..');
for i=1:length(x)
    y(i) = calcPSNR(cleanImageMedian(SP,[x(i),x(i)]),imA);
end
showImage(imA);
showImage(SP);
disp('figure 1 has the original image');
disp('figure 2 shows the S&P noised image');
figure;
plot(x,y);
xlabel('maskRadius');
ylabel('PSNR');
title('PSNR  as a function of maskRadius');
disp('in the following graph, you can see the PSNR values between original and median-denoised image as a function of the size of median neighborhood � maskRadius');
disp('as we can see, the broader the mask, the less resemblence the denoised image has with the original');
disp('and that is becuase when we broader the mask, the salt and pepper points get calculated in the');
disp('calculations of a more and more pixel, increasing the error'); 
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
disp('in the following figure, you can see the PSNR values between original and main-denoised image as a function of the size of median neighborhood � maskRadius');
disp('As we can see, the PSNR increases when the standard deviation increases, but in a "logarithmic" fashion');
disp('the reason being that the mean of the gaussian noise is 0 therfore');
disp('the higher the STD in the cleaning filter the more weight we give to the neighbouring pixels therfore the mean of the error gets closer to 0 and they cancel out each other');
disp('and we end up with a color that is close to the correct one');
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% F %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('horseBoy.tif');
showImage(imA);
imArray = zeros([size(imA),20]);
for i=1:size(imArray,3)
    imArray(:,:,i) = addGaussianNoise(imA,5);
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
disp('Figure 3 has is the median result of the image array');
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
imA = readImage('horseBoy.tif');
showImage(imA);
imArray = zeros([size(imA),20]);
for i=1:size(imArray,3)
    imArray(:,:,i) = addSPnoise(imA,0.4);
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
disp('Figure 3 has is the median result of the image array');
title('image cleaned with median');
fprintf("PSNR between mean and original:   %.3f\n",calcPSNR(meanFilt,imA));
fprintf("PSNR between median and original: %.3f\n",calcPSNR(medianFilt,imA)); 
disp('We can see the PSNR between the MEDIAN image and the original is the highest therfore:');
disp('cleaning by MEDIAN is recommended for S&P Noise');
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% H %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('dali.tif');
imageArray = imA;
y = zeros(1,30);
x = 1:30;
for i=1:30
    imageArray(:,:,i) = addSPnoise(imA,0.3);
    filtered = cleanImageMedian_multi(imageArray);
    y(i) = calcPSNR(imA,filtered);
end
figure;
plot(x,y);
title('The PSNR value as a function of number of frames to take the MEDIAN from in S&P noise');
ylabel('PSNR value');
xlabel('number of frames used');
disp('As we can see from the graph, the more frames we take into consideration, the higher the PSNT Therfore');
disp('the closer we are to the original Image');
disp('and thats becuase the error is disturbuted randomly across all frames therefore the error pixels get brought to closer to the correct color');
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% I %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('dali.tif');
imageArray = imA;
y = zeros(1,30);
x = 1:30;
for i=1:30
    imageArray(:,:,i) = addGaussianNoise(imA,8);
    filtered = cleanImageMean_multi(imageArray);
    y(i) = calcPSNR(imA,filtered);
end
figure;
plot(x,y);
title('The PSNR value as a function of number of frames to take the MEAN from in Gaussian noise');
ylabel('PSNR value');
xlabel('number of frames used');
disp('As we can see from the graph, the more frames we take into consideration, the higher the PSNT Therfore');
disp('the closer we are to the original Image');
disp('and thats becuase the error is disturbuted randomly across all frames therefore the error pixels get brought closer to the correct color');
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% J %%%%%%%%%%%%%%%%%%%%%');
disp('"sharpen" sharpens the edges of the Image.');
disp('Therfore, if we sharpen a S&P noised image, we sharpen the "salts and peppers" and make them more obvious');
disp('and we end up with a result like the one shown in this graph');
SP = readImage('Alan_turing.tif');
SP = addSPnoise(SP,0.2);
showImage(SP);
showImage(sharpen(SP,[5 5],8,4));
disp('Press any key to finish...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% FINITO %%%%%%%%%%%%%%%%%%%%%');
disp('That is it for the checking script,');
disp('Thank you for your time,');
disp('Wasee Weshahi & Bayan Farahan');
