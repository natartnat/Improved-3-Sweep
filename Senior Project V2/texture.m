clear all
close all
clc
% load mandrill
% colormap(map)
% [x,y,z] = cylinder;
% Xhalf = [ones(480,375)*max(max(X))/2, X, ...
% ones(480,125)*max(max(X))/2];
% surface(x,y,z, 'FaceColor','texturemap',...
% 'EdgeColor','none','Cdata',flipud(Xhalf))
% view(3)
[XD,YD,ZD] = peaks(25);
load clown
C = flipud(X);
figure
surface(XD,YD,ZD,C,...
    'FaceColor','texturemap',...
    'EdgeColor','none',...
    'CDataMapping','direct')
colormap(map)
view(-35,45)