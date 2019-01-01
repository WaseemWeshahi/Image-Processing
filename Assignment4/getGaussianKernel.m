function mask = getGaussianKernel(size,maskSTD)
    m=size(1);
    n = size(2);
    [h1, h2] = meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
    hg = exp(- (h1.^2+h2.^2) / (2*maskSTD^2));
    mask = hg ./ sum(hg(:));
end