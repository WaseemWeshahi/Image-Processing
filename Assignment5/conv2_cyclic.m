function c = conv2_cyclic(a,b)
% convolve a and b using cyclic padding. 
% return imag c same size as a
% assume b <= a
aa = [ a a a ; a a a ; a a a];
c = conv2(aa,b,'same');
c = c(size(a,1)+1:2*size(a,1),size(a,2)+1:2*size(a,2));