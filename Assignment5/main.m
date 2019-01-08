imA = readImage('lena.tif');
L = laplacPyr(imA,4);
im = collapseLapPyr(L);
showImage(im);