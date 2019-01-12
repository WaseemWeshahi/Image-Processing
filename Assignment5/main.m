textureRGB = im2double(imread('texture5bw.tif'))*255;
synth = textureSynthesis(textureRGB,4,5,false );
