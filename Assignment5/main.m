textureRGB = im2double(imread('candy.jpg'))*255;
synth = textureSynthesisRGB(textureRGB,5,5,false);
