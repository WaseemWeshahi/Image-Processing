function im = jpgToTif(filename)
% INPUT: filename without the .jpg
% OUTPUT: the same image but in .tif format
RGB = imread(filename,'jpg');
im = mean(RGB,3);
im = round(im);
writeImage(im,"C:\Users\waemw\Desktop\Ed\2018 - 2019 Senior year\Aleph\GitHub\Image-Processing\Assignment3\" + filename + ".tif");