 function    cleanIm = cleanImageMean_multi (imArray)
cleanIm = mean(imArray,3);
cleanIm = round(cleanIm);

