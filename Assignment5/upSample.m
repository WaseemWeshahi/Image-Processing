function    US = upSample(I)
    F = fft2(I);
    newF = fftshift(F);    
    %% Padding the image with zeros
    [m,n] = size(newF);
    maskRadius = [m/2,n/2];
    newF = [[zeros(maskRadius(1),n);newF] zeros(m+maskRadius(1),maskRadius(2))]; % Padding at the top and the right 
    newF = [ zeros(m+2*maskRadius(1),maskRadius(2)) [newF;zeros(maskRadius(1),n+maskRadius(2))] ]; % Padding at the bottom and 
    %%
    newF = ifftshift(newF);
    US = ifft2(newF,'symmetric');
    US = US*4; % Renormalizing
end