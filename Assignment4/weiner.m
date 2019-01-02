function F = weiner(im,mask,lambda)
%   This function applies weiner filter on the image
% INPUT:    im - the image to be filtered
%           mask - the mask that is believed to have been applied
%           lambda - the weiner constant
% OUTPUT:   F - the FFT of the cleaned image
%
% Created By:
% Waseem Weshahi & Bayan Farhan.
    G = fft2(im);
    h = zeros(size(G)); % setting the FFT of the mask to be the same size as G's
    h(1:size(mask,1),1:size(mask,2))=mask;
    H = fft2(h);
    Hstr = conj(H);    
    F = H; % Simply setting its size..
    % Those Loops apply Weinerr filter for each cell
    for u=1:size(im,1)
        for v=1:size(im,2)
            F(u,v) = (Hstr(u,v)*G(u,v))/ (Hstr(u,v)*H(u,v)+lambda*(u^2+v^2));
        end
    end

end