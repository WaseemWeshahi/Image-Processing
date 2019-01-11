textureRGB = im2double(imread('texture5bw.tif'))*255;
synth = textureSynthesis(textureRGB,5,20,false);
