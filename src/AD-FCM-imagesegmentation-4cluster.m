clear all;
clc;
% using the L*a*b* color space and c-means clustering.

% Step 1: Read Image
% Read im3.jpg, which is an image of San Francisco and Oakland.

image = imread('im3.jpg');
imshow(image), title('image segmentation');
text(size(image,2),size(image,fuzzy C-means and AD-FCM', ...
     'FontSize',7,'HorizontalAlignment','right'); 


% Step 2: Convert Image from RGB Color Space to L*a*b* Color Space.
% Convert the image to L*a*b* color space using makecform and applycform.

cform = makecform('srgb2lab');
lab_image = applycform(image,cform);
certainty=0.45;

% Step 3: Classify the Colors in 'a*b*' Space Using c-Means Clustering

dataimage = double(lab_image(:,:,2:3));
nrows = size(dataimage,1);
ncols = size(dataimage,2);
c=zeros(4,ncols*nrows);
dataimage = reshape(dataimage,nrows*ncols,2);

 ncluster = 4;
 
% Fuzzy C-means classification with 4 classes
m=2;

[center,U,obj_fcn] = fcm(dataimage,ncluster,m);

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
%index5 = zeros(nrows*ncols);
%count=1;
%for i=1:nrows*ncols
 %   if ((U(1,i)<0.7) && (U(2,i)<0.7) &&(U(3,i)<0.7) &&(U(4,i)<0.7))
  %      index5(count)=i;
   %     count=count+1;
    %end
%end

% index5 = find(U(5,:) == maxU);

fcmImage(1:length(dataimage))=0;       
fcmImage(index1)= 1;
fcmImage(index2)= 0.8;
fcmImage(index3)= 0.6;
fcmImage(index4)= 0.4;
%fcmimage(index5)=0.1;
 %fcmImage(index5)= 0.2;
 fcmAmb=fcmImage;
%  a1=U(1,:);
%  a2=U(2,:);
%  a3=U(3,:); 
%  a4=U(4,:);
%  b1=sum(a1);
%  b2=sum(a2);
%  b3=sum(a3);
%  b4=sum(a4);
  
        for j=1:4            
           a=sum(U(j,:));
            if (j==1)
            b1=sum(1-U(2,:));
            b2=sum(1-U(3,:));
            b3=sum(1-U(4,:));
            c(1,:)=(U(1,:)*a+((1-U(2,:))*b1)+((1-U(3,:))*b2)+((1-U(4,:))*b3))/(4*ncols*nrows);
            end
            if (j==2)
            b1=sum(1-U(1,:));
            b2=sum(1-U(3,:));
            b3=sum(1-U(4,:));
            c(2,:)=(U(2,:)*a+((1-U(1,:))*b1)+((1-U(3,:))*b2)+((1-U(4,:))*b3))/(4*ncols*nrows);
            end
            if (j==3)
            b1=sum(1-U(1,:));
            b2=sum(1-U(2,:));
            b3=sum(1-U(4,:));
            c(1,:)=(U(3,:)*a+((1-U(1,:))*b1)+((1-U(2,:))*b2)+((1-U(4,:))*b3))/(4*ncols*nrows);
            end
            if (j==4)
            b1=sum(1-U(1,:));
            b2=sum(1-U(2,:));
            b3=sum(1-U(3,:));
            c(1,:)=(U(4,:)*a+((1-U(1,:))*b1)+((1-U(2,:))*b2)+((1-U(3,:))*b3))/(4*ncols*nrows);
            end
             
       end
for i=1:nrows*ncols
        if (max(c(:,i))< certainty)
      fcmAmb(i)=0.1;
        end
end

                              
% Step 4: Label Every Pixel in the Image Using the Results from C-MEANS.

pixel_labels = reshape(fcmImage,nrows,ncols);
figure,imshow(pixel_labels,[]), title('image labeled by cluster index');impixelinfo;
pixel_labels_amb = reshape(fcmAmb,nrows,ncols);
figure,imshow(pixel_labels_amb,[]), title('image labeled by cluster index for ambiguity');impixelinfo;

figure,
plot(obj_fcn);
title('Objective Function Values');
xlabel('Iteration Count');
ylabel('Objective Function Value');