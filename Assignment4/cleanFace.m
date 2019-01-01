function cleanFace()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% FACE %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('for this image, we have tried many approaches but only two seemed to work:');
    disp('the FIRST method: a simple median filter that runs through the image multiple times');
    disp('in different sizes, then we sharpen it.');
    disp('and for the SECOND method, we had:');
    disp('1) Ectrated the 3 faces to indivisual image each');
    disp('2) Applied multi-median filter thrpugh those 3 images');
    disp('3) Pasted the resulting face to the three places of the original faces');
    disp('Strangely enough the naive median filter has worked better..');
    disp('but we felt like we need to include this experimint');
    disp('figure 1 : the original noisy image');
    disp('figures 2-4: the three dirt faces as extracted from the Original Image');
    disp('figure 5 : the face resulted from taking the median of the 3 faces');
    disp('figure 6 : the image resulted from the SECOND method');
    disp('figure 7: the image Resulted from the FIRST method');
    %%
    imA = readImage('face.tif');
    face1 = readImage('faceUp.tif');
    face2 = readImage('faceRight.tif');
    face3 = readImage('faceDown.tif');
    showImage(imA);
    showImage(face1);
    showImage(face2);
    showImage(face3);
    cleanFace = readImage('cleanFace.tif');
    showImage(cleanFace);
    cleanResult = readImage('cc.tif');
    showImage(cleanResult);
    imB=cleanImageMedian(imA,[1 1]);
    imB=cleanImageMedian(imB,[1 0]);
    imB=cleanImageMedian(imB,[1 0]);
    imC = sharpen(imB,2,2,2);
    showImage(imC);
end

%% Note: 
% we need to show that cropping the faces and median-ing them is not good