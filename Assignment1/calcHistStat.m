function   [m,v,e] = calcHistStat(h)
% returns some stats of the given histogram
% INPUT: a histogram (normalized or not)
% OUTPUT: mean, variance, and entropy of the pixels
%
% Written By:
% Waseem Weshahi I.D: 206943391
% Bayan Farhan   I.D: 208300145
greyValues = 0:255;
h = h / sum(h); %making sure the histogram is normalized
% calculating the stats using point wise operations vector
m = sum( h.*greyValues);
v = sum( (h.*greyValues).*greyValues) - m.*m;
e = -sum( h(h>0).* log2(h(h>0)));