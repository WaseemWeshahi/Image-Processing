function    transfMat = calcTransfMat(x,y,z,w)
% INPUT: a list of four xs and four ys from the source image and a list of
%        four xs and ys
% OUTPUT: the transformation matrix which maps from (z,w) to (x,y)
% Method: we find the 8 parameters that define the transformation matrix as
% learned in class AND RETURN ITS INVERSE
%
%
% Written By:
% Waseem Weshahi   I.D: 206943391
% Bayan Farhan     I.D: 208300145

% we harcode the matrix which is used for global warping given 4 pairs of
% points
A = [x(1) y(1) 0 0 1 0 -x(1)*z(1) -y(1)*z(1);
    0 0 x(1) y(1) 0 1 -x(1)*w(1) -y(1)*w(1)
    x(2) y(2) 0 0 1 0 -x(2)*z(2) -y(2)*z(2)
    0 0 x(2) y(2) 0 1 -x(2)*w(2) -y(2)*w(2)
    x(3) y(3) 0 0 1 0 -x(3)*z(3) -y(3)*z(3)
    0 0 x(3) y(3) 0 1 -x(3)*w(3) -y(3)*w(3)
    x(4) y(4) 0 0 1 0 -x(4)*z(4) -y(4)*z(4)
    0 0 x(4) y(4) 0 1 -x(4)*w(4) -y(4)*w(4)
    ];

% merging the x' y' vector (z and w)
combined = [z'; w'];
combined = combined(:);

% solving for the 8 parameters
parameters = pinv(A) * combined;

% storing the inverse transformation matrix
transfMat = [parameters(1) parameters(2) parameters(5);
    parameters(3) parameters(4) parameters(6);
    parameters(7) parameters(8)      1      ];
transfMat = pinv(transfMat);
end
