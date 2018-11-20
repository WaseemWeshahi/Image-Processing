function    [newImage] = mapIntoImage(imageA,imageB)
% INPUT: two grey scale Images
% OUTPUT: imageA into which image B has been mapped.
% METHOD: uses inverse mapping from image A to image B in the selcted Area
%
%
% Written By:
% Waseem Weshahi   I.D: 206943391
% Bayan Farhan     I.D: 208300145

showImage(imageA);
disp('please click on four points in the image, make sure they are in clockwise order and that they form a convex');
[z,w]=ginput(4);

%%MAKE SURE POINTS FORM A CONVEX QUADRILATERAL

if (IsPointWithinLine(z(1),w(1),z(2),w(2),z(3),w(3))||IsPointWithinLine(z(2),w(2),z(3),w(3),z(4),w(4)) ||IsPointWithinLine(z(1),w(1),z(3),w(3),z(4),w(4))||IsPointWithinLine(z(1),w(1),z(2),w(2),z(4),w(4)))
    disp('invalied points,please enter new points not on the same line: ');
    [z,w]=ginput(4);
end

    
showImage(imageB);
disp('please click on four points in the image, make sure they are in clockwise order and that they form a convex');
[x,y]=ginput(4);

%%MAKE SURE POINTS FORM A CONVEX QUADRILATERAL

if (IsPointWithinLine(x(1),y(1),x(2),y(2),x(3),y(3))||IsPointWithinLine(x(2),y(2),x(3),y(3),x(4),y(4)) ||IsPointWithinLine(x(1),y(1),x(3),y(3),x(4),y(4))||IsPointWithinLine(x(1),y(1),x(2),y(2),x(4),y(4)))
    disp('invalied points,please enter new points not on the same line: ');
    
    [x,y]=ginput(4);
end

% Transposing images so that the code works and we code it intuentively
imageB = imageB';
imageA = imageA';
newImage = imageA;

% now we go and find the (inverse) transformation matrix
transfMat = calcTransfMat(x,y,z,w);
[width,height]=size(imageA);
%     xvec = 1:width;
%     yvec = 1:height;
%storing the X's and Y's of the image
[X,Y] = ind2sub(size(imageA),1:width*height);

% reading the Coordinates of the pixels that are inside (or on the edges)
% the quadrilateral
in = inpolygon(X,Y,z,w);
[insideIndX,insideIndY] = ind2sub(size(imageA),find(in==1));

% for each pixel inside the quadrilateral, we perform the inverse
% mapping and Bilinear interpolation
[~,numberOfPix] = size(insideIndX);
for i=1:numberOfPix
    % calculating the source of each point inside the quadrilateral in imA
    vec = [insideIndX(i);
        insideIndY(i)
        1];
    point = transfMat*vec;
    point=point./point(3);
    point(3) = []; %elimenating the Z coordinate
    
    % Applying the Bilinear interpolation from imB on the point
    % to calculate the value which we should assign to the pixel in
    % the new image
    V = interpolate(imageB,point);
    newImage(insideIndX(i),insideIndY(i)) = fix(V); %potential bug
    
    
end

% retransposing the new image
newImage = newImage';
showImage(newImage);
end