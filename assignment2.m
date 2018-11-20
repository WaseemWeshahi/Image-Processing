%maps im1 to im2

im1 = readImage('lena.tif');
showImage(im1);
disp('please click on four points in the image, make sure they are in clockwise order');
[x,y]=ginput(4);
im2 = readImage('racecar.tif');
showImage(im2);
disp('please click on four points in the image, make sure they are in clockwise order');
[z,w]=ginput(4);
im1 = im1';
im2 = im2';
A = [x(1) y(1) 0 0 1 0 -x(1)*z(1) -y(1)*z(1);
        0 0 x(1) y(1) 0 1 -x(1)*w(1) -y(1)*w(1)
        x(2) y(2) 0 0 1 0 -x(2)*z(2) -y(2)*z(2)
        0 0 x(2) y(2) 0 1 -x(2)*w(2) -y(2)*w(2)
        x(3) y(3) 0 0 1 0 -x(3)*z(3) -y(3)*z(3)
        0 0 x(3) y(3) 0 1 -x(3)*w(3) -y(3)*w(3)
        x(4) y(4) 0 0 1 0 -x(4)*z(4) -y(4)*z(4)
        0 0 x(4) y(4) 0 1 -x(4)*w(4) -y(4)*w(4)
        ];
    
    combined = [z'; w'];
    combined = combined(:);
    parameters = pinv(A) * combined;

    final_A = [parameters(1) parameters(2) parameters(5);
               parameters(3) parameters(4) parameters(6)
               parameters(7) parameters(8) 1];
    final_A = pinv(final_A);
    [width,height]=size(im2);
    axis = 1:width*height;
    [X,Y] = ind2sub(im2,axis);
   % in = inpolygon(X,Y,z,w);
    for i=1:width
        for j=1:height
            in = inpolygon(i,j,z,w);
            if(in==1) 
               vec = [i;
                       j
                       1];
                point = final_A*vec;
                point=point./point(3);
                point(3) = []; %elimenating the Z coordinate
                nw = floor(point);
                nw(nw>254) = 254;
                nw(nw<0) = 0;
                se = [nw(1)+1;
                      nw(2)+1];
                sw = [nw(1);
                      nw(2)+1];
                ne = [nw(1)+1;
                      nw(2)];
                dX = point(1) - nw(1);
                dY = point(2) - nw(2);
                
                 SW = im1(sw(1),sw(2));
                 SE = im1(se(1),se(2));
                 NW = im1(nw(1),nw(2));
                 NE = im1(ne(1),ne(2));
                 
                 S = SE*dX + SW*(1-dX);
                 N = NE*dX + NW*(1-dX);
                 V = N*dY + S*(1-dY);
                 
                 im2(i,j) = fix(V); %potential bug
              
            
            end
        end
    end
    im2 = im2';
    showImage(im2);
% 
%    
%     for i = 1:width*height 
%     
%             if in(i) == 1 
%                 vec = [X(i);
%                        Y(i)
%                        1];
%                 point = final_A*vec;
%                 point=point/point(3);
%                 point(3,:) = []; %elimenating the Z coordinate
%                 sw = floor(point);
%                 se = [sw(1)+1;
%                       sw(2)];
%                 nw = [sw(1);
%                       sw(2)+1];
%                 ne = [sw(1)+1;
%                       sw(2)+1];
%                 dX = point(1) - sw(1);
%                 dY = point(2) - sw(2);
%                 
%                  SW = im2(sw(1),sw(2));
%                  SE = im2(se(1),se(2));
%                  NW = im2(nw(1),nw(2));
%                  NE = im2(ne(1),ne(2));
%                  
%                  S = SE*dX + SW*(1-dX);
%                  N = NE*dX + NW*(1-dX);
%                  V = N*dY + S*(1-dY);
%                  
%                  im2(X(i),Y(i)) = V; %potential bug
%             end
%     end
    
    
    
   
    
    

    