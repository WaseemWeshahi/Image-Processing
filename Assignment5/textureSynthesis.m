function    newtexture = textureSynthesis(texture,numLevels,numRepeats,show)
% This routine synthesizes a new image with texture statistics similar to the given texture.
% 
% INPUT:      texture = a grayscale image (values in [0,255]) containing a texture. 
%             numLevels = the number of levels created in the Laplacian Pyramids 
%                         used in the process (minimum value = 1).
%             numRepeats = the number of iterations to perform during synthesis. 
%             show  =  an OPTIONAL binary argument. If TRUE (~0) then function displays the result
%                      for each iteration. Between displays user must press space bar. 
%                      If FALSE (0) or is not given then does not display anything. 
% OUTPUT:   newtexture = a grayscale image (values in [0,255]) of size same as input image texture.
% METHOD:  Follows the Heeger and Bergen method: 
%             1. Create random image of required size
%             2. Build Laplacian pyramid for input texture and for random image.
%             3. Shape histogram of each level of random image to equal corresponding level of texture pyramid.
%             4. Collapse pyramid of random image producing synthetic texture.
%             5. Correct synthetic texture (collapsed image) to range.
%             6. Repeat from step 2.
%
% Written By:
% Waseem Weshahi & Bayan Farhan

if nargin<4
    show=false;
end

randomized = rand(size(texture));
randomized = round(randomized*255);
Lt = laplacPyr(texture,numLevels);    %Laplacian of input texture
Lr = laplacPyr(randomized,numLevels); %Laplacian for randomized texture

% applying the Heeger and Bergen method "numRepeats" times
for j=1:numRepeats
    % Histogram shaping each level of Laplacian Pyramid from random image to texture image
    % and saving it back in Lr
    for i = 1:numLevels
        %%%TODO: IMPLEMENT OUR OWN imhistmatch
        Lr{i} = imhistmatch(round(Lr{i}+128)/255,round(Lt{i}+128)/255)*255-128; % POSSIBLE BUG: consider switching arguments
    end
    newtexture = collapseLapPyr(Lr);
    if(show)
        showImage(newtexture);
        disp('press space to continue iterating');
        pause;
    end

end

end