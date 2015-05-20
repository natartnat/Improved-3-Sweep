%% oneClick_Script
clear all;close all;
%% 16/05/2015 unfinsh
img = imread('pic2/resize2.png');
%img = imread('pic2/cupresize.png');
img_G = rgb2gray(img);
%% divide by grey level
umb = graythresh(img_G);
bw = im2bw(img_G,umb);
imshow(img)
%% tagging label
[ L , ne ] = bwlabel(bw);
[ prop ] = regionprops(L,'basic');
[ extree ] = regionprops(L,'Extrema');  
hold on;
for n=2:size(extree,1)
    for j = 1:size(extree(n).Extrema,1)
        plot(extree(n).Extrema(j,1),extree(n).Extrema(j,2),'*r');
    end
end
for n=2:size(prop,1)
    rectangle('Position',prop(n).BoundingBox,'EdgeColor','g','LineWidth',2);
end
pause(3)
%% area <300 discard
s = find([prop.Area]<300);
%% area >300
for n=1:size(s,2)
    rectangle('Position',prop(s(n)).BoundingBox,'EdgeColor','g','LineWidth',2);
end
pause(2)
%% delete area <300
for n=1:size(s,2)
    d= round(prop(s(n)),BoundingBox);
    bw(d(2):d(2)+d(4),d(1):d(1)+d(3))=0;
end
