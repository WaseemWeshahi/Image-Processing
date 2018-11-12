% TODO: what are the conditions for this algorithm to work?
function    tm = histShape (h1,h2)
% this function returns a tone map that maps h1 to h2 using the 2 pointer
% algorithm
% INPUT: two histograms (vectors of length 256)
% OUTPUT: a 1x256 vector tone map that maps h1 to h2
%
% Written By:
% Waseem Weshahi I.D: 206943391
% Bayan Farhan   I.D: 208300145

%normalizing
h1 = h1 / sum(h1);
h2 = h2 / sum(h2);

%the algorithm which we implemented uses the ACCUMILATIVE histograms, so
%first we calculate that
for i= 2:256
    h1(i)= h1(i-1) + h1(i);
    h2(i)= h2(i-1) + h2(i);
end

tm = 1:256;
j = 1;
% for each grey value in c1, we find the corresponding index (grey value)
% in h2 which has the same value
for i = 1:256
    while(h2(j)<h1(i) && j<256) 
        j=j+1;
    end
    tm(i) = j-1;

end
end


