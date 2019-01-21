% [A,B] = imread('texture3bw.tif')*255;
%textureRGB = ind2rgb(A,B);
%textureRGB = 255*textureRGB;   
textureRGB = im2double(imread('texture7bw.tif'))*255;
textureRGB=round(textureRGB);
synth = textureSynthesis(textureRGB,6,5,false);
figure
imshow(textureRGB/255);
title('Original');
figure
imshow(synth/255);
title('Synthetic');

