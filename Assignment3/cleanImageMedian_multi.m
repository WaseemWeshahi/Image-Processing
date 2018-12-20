function  cleanIm = cleanImageMedian_multi (imArray)
cleanIm = median(imArray,3);
cleanIm = round(cleanIm);