function    V = interpolate(image,point)
% INPUT: a grey scale image
%        & a point on the image (that isn't necesarily an integer)
% OUTPUT: The inerpolated (Binlineary) value of the "point" from "image"
% METHOD: Perform a binlinear interpolation as shown in class where first
% find out the 4 points surronding "point", then perform a linear
% interpolation on the upper pair and the lower pairs, then we interpolate
% those two values
%
%
% Written By:
% Waseem Weshahi    I.D: 206943391
% Bayan Farhan      I.D: 208300145

% finding out the 4 pixels surrounding the point
nw = floor(point);
[c,r] = size(image);
se = [min(nw(1,:)+1,c);
      min(nw(2,:)+1,r)];
sw = [max(nw(1,:),1);
      min(nw(2,:)+1,r)];
ne = [min(nw(1,:)+1,c);
      max(nw(2,:),1)];

% calculating ?x and ?y
dX = point(1,:) - nw(1,:);
dY = point(2,:) - nw(2,:);

% reading the values of the surrounding point
% SW = diag(image(sw(1,:),sw(2,:)))';
% SE = diag(image(se(1,:),se(2,:)))';
% NW = diag(image(nw(1,:),nw(2,:)))';
% NE = diag(image(ne(1,:),ne(2,:)))';

SW = image(sub2ind(size(image),sw(1,:),sw(2,:)));
SE = image(sub2ind(size(image),se(1,:),se(2,:)));
NW = image(sub2ind(size(image),nw(1,:),nw(2,:)));
NE = image(sub2ind(size(image),ne(1,:),ne(2,:)));

% Lineary interpolating two pairs
S = SE.*dX + SW.*(1-dX);
N = NE.*dX + NW.*(1-dX);

% Lineary interpolating last two results
V = N.*dY + S.*(1-dY);
end
