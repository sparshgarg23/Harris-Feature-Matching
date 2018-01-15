I1=imread('latrobe1.jpg');
I2=imread('latrobe2.jpg');

[r1,c1]=corners(I1,5,0.000999);
[r2,c2]=corners(I2,5,0.000999);
I1=rgb2gray(I1);
I2=rgb2gray(I2);
figure, imshow(I1),
hold on;
plot(c1, r1, '+');
hold off;
figure,imshow(I2),
hold on;
plot(c2,r2,'+');
%Matching features
list1=[c1,r1];
list2=[c2,r2];
[f1,vpts1]=features(I1,list1,9);
[f2,vpts2]=features(I2,list2,9);
[indexPairs,scores] = match_features(f1,f2,0.9991) ;
matchedPoints1 = vpts1(indexPairs(:,1),:);
matchedPoints2 = vpts2(indexPairs(:,2),:);
figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);


