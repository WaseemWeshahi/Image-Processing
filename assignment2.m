im1 = readImage('lena.tif');
showImage(im1);
disp('please click on four points in the image, make sure they are in clockwise order');
[x,y]=ginput(4);

im2 = readImage('stroller.tif');
showImage(im2);
disp('please click on four points in the image, make sure they are in clockwise order');
[z,w]=ginput(4);

A = [x(1) y(1) 0 0 1 0 -x(1)*z(1) -y(1)*z(1);
        0 0 x(1) y(1) 0 1 -x(1)*w(1) -y(1)*w(1)
        x(2) y(2) 0 0 1 0 -x(2)*z(2) -y(2)*z(2)
        0 0 x(2) y(2) 0 1 -x(2)*w(2) -y(2)*w(2)
        x(3) y(3) 0 0 1 0 -x(3)*z(3) -y(3)*z(3)
        0 0 x(3) y(3) 0 1 -x(3)*w(3) -y(3)*w(3)
        x(4) y(4) 0 0 1 0 -x(4)*z(4) -y(4)*z(4)
        0 0 x(4) y(4) 0 1 -x(4)*w(4) -y(4)*w(4)
        ];
    transpose_A = A.';
    inverse_A = inv(transpose_A*A);
    pinv = inverse_A*transpose_A ;
    combined = [z; w];
    parameters = pinv * combined;
    final_A = [parameters(1) parameters(2) parameters(5);
               parameters(3) parameters(4) parameters(6)
               parameters(7) parameters(8) 1];
    final_A = inv(final_A);
    [h,width]=size(im2);
    
    for i=1:h
        for j=1:width
            [in,on]=inpolygon(j,i,z,w);
            if in ==1 || on==1
                vec = [j;
                       i
                       1];
                point = final_A*vec;
                
            end
        end
    end
    
    

    