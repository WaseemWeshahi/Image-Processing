% The Script
disp('%%%%%%%%%%%%%%%%%%%%% A %%%%%%%%%%%%%%%%%%%%%');
imA = readImage('karlMarx.tif');
showImage(imA);
SP = addSPnoise(imA,0.05);
showImage(SP);
showImage(cleanImageMean(SP,[4,4],2));
showImage(cleanImageMedian(SP,[4,4]));
disp('Figure 1: The original Image.');
disp('Figure 2: the image under salt and pepper effect (P=0.1))');
disp('Figure 3: the Image "cleaned" by averaging with a maskRadius of 5');
disp('Figure 4: the Image "cleaned" by taking the median, maskRadius of 5');
disp('Press any key to continue...');
pause();
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%% B %%%%%%%%%%%%%%%%%%%%%');
