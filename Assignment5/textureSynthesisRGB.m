function    newtexture = textureSynthesisRGB(textureRGB,numLevels,numRepeats,show)
% This routine synthesizes a new RGB image with texture statistics similar to the given texture.
% 
% INPUT:    textureRGB = an RGB image (size MxMx3) (values in [0,255]) 
%                        containing a color texture. 
%           numLevels = the number of levels created in the Laplacian Pyramids 
%                       used in the process (minimum value = 1).
%           numRepeats = the number of iterations to perform during synthesis. 
%           show  =  an OPTIONAL binary argument. If TRUE (~0) then function displays the result
%                    for each iteration. Between displays user must press space bar. 
%                    If FALSE (0) or is not given then does not display anything.  
% 
% OUTPUT:   newtextureRGB = an RGB image (size MxMx3) (values in [0,255]) of size same as input image textureRGB.
% 
% METHOD:   Input image is split into 3 grayscale images: R,G,B  one for each color channel.
%           For each channel use  textureSynthesis function to create a new single channel texture.
%           combine resulting 3 textures into a single new RGB image.
%
% Written By:
% Waseem Weshahi & Bayan Farhan

if nargin<4
    show=false;
end
newtexture = zeros(size(textureRGB)); % setting the size
for j=1:numRepeats
    for i=1:3
        newtexture(:,:,i) = textureSynthesis(textureRGB(:,:,i),numLevels,numRepeats,0);
    end
    if(show)
        imshow(newtexture/255);
        disp('press space to continue iterating');
        pause;  
    end
end
end
