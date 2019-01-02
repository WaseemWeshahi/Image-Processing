function cleanBlocks()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% BLOCKS %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('As we can observe, the noise in this image are lines');
    disp('but if we look closely we see that those lines are somewhat horizontal');
    disp('and not vertical, therfore applying a "squared" kernel median wont');
    disp('give us the desired results horiziontally, thats why we apply: ');
    disp('VERTICAL MEDIAN aka median cleaning with a mask that goes horziontally');
    disp('figure(1) - Original Noisy image');
    disp('figure(2) - Cleaned Image (median with maskRadius = [2 0])');
    imA = readImage('blocks.tif');
    showImage(imA);
    imB=cleanImageMedian(imA,[2 0]);
    showImage(imB);
end