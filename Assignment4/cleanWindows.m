function cleanWindows()
    disp('%%%%%%%%%%%%%%%%%%%%%%%%% WINDOWS %%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('In this image (figure 1), we see that the image is noised by Gaussian Filter');
    disp('But, the image has many edges (e.g: wndows,wall edges,wall textures etc..');
    disp('Therfore we can not just apply Mean filter for this kernel does not take edges into consideration');
    disp('meaning that we have to use:');
    disp('BILATERAL FILTIRING');
    disp('and the result is as shown in figure 2');
    disp('*Parameters:');
    disp('maskRadius : [4 4]');
    disp('sigma_d = 30');
    disp('sigma_r = 20');
    im = readImage('windows');
    showImage(im);
    clean = bilat(im,4,30,20);
    showImage(clean);
end