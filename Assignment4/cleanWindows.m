function cleanWindows()
    im = readImage('windows');
    showImage(im);
    clean = bilat(im,4,5,20);
    showImage(clean);

end