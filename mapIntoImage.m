function    [newImage] = mapIntoImage(imageA,imageB)
    % INPUT: two grey scale Images
    % OUTPUT: imageA into which image B has been mapped.
    % METHOD: uses inverse mapping from image A to image B in the selcted Area
    % Written By:
    % Waseem Weshahi   I.D: 206943391
    % Bayan Farhan     I.D: 208300145
    %
    %

    showImage(imageA);
    disp('please click on four points in the image, make sure they are in clockwise order and that they form a convex');
    [z,w]=ginput(4);
    %%TODO:
    %%MAKE SURE POINTS FORM A CONVEX QUADRILATERAL

    showImage(imageB);
    disp('please click on four points in the image, make sure they are in clockwise order and that they form a convex');
    [x,y]=ginput(4);
    %%TODO:
    %%MAKE SURE POINTS FORM A CONVEX QUADRILATERAL

    % Transposing images so that the code works and we code it intuentively
    imageB = imageB';
    imageA = imageA';
    newImage = imageA;

    % now we try and find the 8 parameters to define the transformation matrix
    % Hard coding in the rearranged "xy" matrix
    A = [x(1) y(1) 0 0 1 0 -x(1)*z(1) -y(1)*z(1);
        0 0 x(1) y(1) 0 1 -x(1)*w(1) -y(1)*w(1)
        x(2) y(2) 0 0 1 0 -x(2)*z(2) -y(2)*z(2)
        0 0 x(2) y(2) 0 1 -x(2)*w(2) -y(2)*w(2)
        x(3) y(3) 0 0 1 0 -x(3)*z(3) -y(3)*z(3)
        0 0 x(3) y(3) 0 1 -x(3)*w(3) -y(3)*w(3)
        x(4) y(4) 0 0 1 0 -x(4)*z(4) -y(4)*z(4)
        0 0 x(4) y(4) 0 1 -x(4)*w(4) -y(4)*w(4)
        ];

    % merging the x' y' vector
    combined = [z'; w'];
    combined = combined(:);

    % solving for the 8 parameters
    parameters = pinv(A) * combined;

    % storing the inverse transformation matrix
    final_A = [parameters(1) parameters(2) parameters(5);
        parameters(3) parameters(4) parameters(6)
        parameters(7) parameters(8) 1];
    final_A = pinv(final_A);


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
        point = final_A*vec;
        point=point./point(3);
        point(3) = []; %elimenating the Z coordinate

        % Applying the Bilinear interpolation from imB to calculate the
        % value which we should assign to the pixel in imA

        % first we figure out the 4 points surroinding the source
        % point
        nw = floor(point);
        nw(nw>254) = 254;
        nw(nw<0) = 0;
        se = [nw(1)+1;
            nw(2)+1];
        sw = [nw(1);
            nw(2)+1];
        ne = [nw(1)+1;
            nw(2)];

        % Applying Bilinear interpolation as shown in class
        dX = point(1) - nw(1);
        dY = point(2) - nw(2);

        SW = imageB(sw(1),sw(2));
        SE = imageB(se(1),se(2));
        NW = imageB(nw(1),nw(2));
        NE = imageB(ne(1),ne(2));

        S = SE*dX + SW*(1-dX);
        N = NE*dX + NW*(1-dX);
        V = N*dY + S*(1-dY);

        newImage(insideIndX(i),insideIndY(i)) = fix(V); %potential bug


    end
    % retransposing the image
    newImage = newImage';
    showImage(newImage);
end