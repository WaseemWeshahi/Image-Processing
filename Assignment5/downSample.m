function    DS = downSample(I)
g = [0.05 0.25 0.4 0.25 0.05];
mask = g'*g;
blurred = conv2(I,mask,'same');
DS = blurred(1:3:end,1:3:end);
putImage(DS);