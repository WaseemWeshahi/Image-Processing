textureRGB = im2double(imread('candy.jpg'))*255;
synth = textureSynthesisRGB(textureRGB,4,4,false);
