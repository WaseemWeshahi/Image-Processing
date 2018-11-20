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
nw(nw>254) = 254;
nw(nw<0) = 0;
se = [nw(1)+1;
    nw(2)+1];
sw = [nw(1);
    nw(2)+1];
ne = [nw(1)+1;
    nw(2)];

% calculating ?x and ?y
dX = point(1) - nw(1);
dY = point(2) - nw(2);

% reading the values of the surrounding point
SW = image(sw(1),sw(2));
SE = image(se(1),se(2));
NW = image(nw(1),nw(2));
NE = image(ne(1),ne(2));

% Lineary interpolating two pairs
S = SE*dX + SW*(1-dX);
N = NE*dX + NW*(1-dX);

% Lineary interpolating last two results
V = N*dY + S*(1-dY);
end
