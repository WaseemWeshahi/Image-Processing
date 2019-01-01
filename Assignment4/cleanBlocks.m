function cleanBlocks()
    imA = readImage('blocks.tif');

    showImage(imA);

    imB=cleanImageMedian(imA,[2 0]);
    putImage(imB);
end