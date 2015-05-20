function main_module_for_gui(inx1,iny1,inx2,iny2 ,countD,I)
distance2=0;
data = [];

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
[distance, profWidth] = getProperty(tempBody); %% length to place 2D

if (iny2-iny1) > 0
    direction = -1;
    %['DOWN'];
else
    direction = 1;
    %['UP'];
end
% Basic3sw( twoD,distance,direction);
Basic3sw( twoD,profWidth,distance,distance2,direction);

%
distance2 = distance;
end
axis tight;
toc
%['END'];