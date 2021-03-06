clear all;close all ;clc
%I = imread('pic2/u2.png'); 
%I = imread('pic2/PSM.jpg');
%I = imread('pic2/H63BK.jpg');
%I = imread('pic2/renderboxe.jpg');
%I = imread('pic2/neatedS2C.png');
%I = imread('pic2/neatedC2C.png');
%I = imread('pic2/tubesharp.png'); 
%I = imread('pic2/color3.png'); 
%I = imread('pic2/color.png'); 
%I = imread('pic2/cupresize.png'); 
I = imread('pic2/s1.png');
%I = imread('pic2/renderbox.jpg');
%I = imread('pic2/resize2.png');
%I = imread('../pic/glass.jpg'); 
disMax=0;
objNum = 1;
data = [];
[ inx1,iny1,inx2,iny2,countD ] = get_img_data(I);
figure,
tic
for count = 1:1:countD-1
%% ============= make flood fill 2D Base =================
temp2D = selectOBJ(I,[round(inx1(count));round(iny1(count))]);
%     s  = regionprops(temp2D,'ConvexImage');
%     imshow(s.ConvexImage);
    
    %for k = 1:1:size(s.ConvexImage,1) 
        %hold on,plot(s.ConvexImage(k,1),s.ConvexImage(k,2),'b.') % TR RT
    %end
%figure,imshow(temp2D);
%% ================ 2D-BASAE construction =================
%[ twoD ] = twoDBaseProfile(temp2D);
[ twoD ] = twoDBaseProfile(temp2D);
%figure,imshow(twoD);

tempBody = selectOBJ(I,[round(inx2(count));round(iny2(count))]);
%figure,imshow(tempBody);
%% ================ MOD for 2 side Object =================
tempBody = select2Side( tempBody , temp2D , I);
%figure,imshow(twoD);
%figure,imshow(tempBody);
%%
[height, profWidth] = getProperty(tempBody); %% length to place 2D

if (iny2-iny1) > 0
    direction = -1;
    %['DOWN'];
else
    direction = 1;
    %['UP'];
end
% Basic3sw( twoD,distance,direction);
data = Basic3sw( twoD,profWidth,height,disMax,direction,objNum,data);
%
disMax = disMax + height;
objNum = objNum + 1;
end
axis tight;
toc
%['END'];