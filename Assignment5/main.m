textureRGB = im2double(imread('candy.jpg'))*255;
synth = textureSynthesisRGB(textureRGB,4,22,false);
synth=synth-139;
synth(synth>255)=255;
