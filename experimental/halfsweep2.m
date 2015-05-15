function halfsweep2()
clear all;close all;
%%I = imread('../pic/houghtestC.png');
%%I = imread('../pic2/testbeer.png');
I = imread('pic2/Basicrec.png');
%%I = imread('../pic2/testbeer3.png'); %% over result
%%I = imread('../pic2/squarebox.png'); %% over result
%%I = imread('../pic2/basicBox.png');

count = 1;
figure(1);imshow(I);
[inx1,iny1]= ginput(1);%% 2d base 
[inx2,iny2]= ginput(1); %% direction
tic
if iny2<iny1
    I = rot90(I,1);
end
r = [round(inx1);round(iny1)];

%% ============= make flood fill 2D Base =================
tol = 5;
ms=flood_fill(I,r,tol); 
[m n o] = size(I);

temp = zeros(m,n);
temp(ms) = 1;
figure(2),imshow(temp);
% a = find(sum(I));
% b = find(sum(temp));
%%hold on,plot(sum(temp,1));%% sum on verticle [horizontal shape]

%% ================ Case go down ===============
%% ================ find 2D base profile =======
%% ================ left right ================= % x coordinate
h = find(sum(temp,1)>0);
hh = find(sum(temp,2)>0);

x1 = h(1);
v = find(temp(:,x1)>0);
y1 = v(1);

y2 = hh(1);
b = find(temp(y2,:)>0);
x2 = b(1);

x3 = h(end);
v = find(temp(:,x3)>0);
y3 = v(1);

y4 = hh(end);
b = find(temp(y4,:)>0);
x4 = b(1);
p1 = [x1,y1];
p2 = [x2,y2];
p3 = [x3,y3];
p4 = [x4,y4];
%% =================== Mirror Flip ===============================
halfUD = ceil(p2(1,2)+p4(1,2)/2); % (up+down)/2
%halfcropX = ceil((tempstorage(1,1):tempstorage(2,1))/2);

halfLower = temp(halfUD:1:p4(1,2),p1(1,1):1:p3(1,1));%flip
halfUpper = rot90(halfLower,2);
%diffLR = abs(tempstorage(1,2) - tempstorage(2,2)); %% different of left and right high
%halfLower = halfLower(1:1:end-diffLR,1:1:end); %%halfLower with diff edit
%halfLower = halfLower(1:1:end,1:1:end); %%halfLower with diff edit
a = zeros(m,n);
figure(3),imshow(halfUpper);
% find differnt for shift
h1 = find(halfUpper(end,:)>0);
startCol = h1(1);
endCol = h1(end);
cropUpper = halfUpper(:,startCol:endCol);

h1 = find(halfLower(1,:)>0);
startCol = h1(1);
endCol = h1(end);
cropLower = halfLower(:,startCol:endCol);

[heightUpper,widthUpper] = size(cropUpper);
[heightLower,widthLower] = size(cropLower);

a(p1(1,2)-heightUpper+1:p1(1,2),p1(1,1):p1(1,1)+widthUpper -1)= cropUpper;
a(p1(1,2):p1(1,2)+heightLower-1,p1(1,1):p1(1,1)+widthLower -1)= cropLower;
figure(4),imshow(a);
hold on;
CropUp = find(sum(halfUpper,1));
%halfUpper = halfUpper(:,CropUp(1)):halfUpper(CropUp(end));
%a(cc:1:halfUD,p1(1,1):1:p3(1,1))= halfUpper;
%imshow(a);
%%cc = abs(halfUD-(p4(1,2)-halfUD));


%% =============== upper point incase of ============================
HorizontalSum = sum(a,2); %% counter clockwise

CoorXY = find(HorizontalSum); %% temp storage
p2 =[0 CoorXY(1)];%3
t = find(a(p2(1,2),:));
t = t((ceil(size(t,1)/2)),1);
p2(1,1) = t;

%% ====== check area 2D =======
actualArea = sum(temp(:));
cirIdealArea = pi*(round(x3-x1/2))*(round(y3-y2/2));
rectIdealArea = abs(sqrt((x4-x1)^2+(y4-y1)^2))*abs(sqrt((x3-x4)^2+(y3-y4)^2));
AreaT = [cirIdealArea,rectIdealArea];
%% find which one is it
tmp = abs(AreaT-actualArea);
[idx idx] = min(tmp); %index of closest value
closest = AreaT(idx); %closest value
imshow(temp)
hold off;

%% Find bound point
%% bound lowest point
r = [round(x2);round(y2)];
tol = 5;
ms=flood_fill(I,r,tol); 
[m n o] = size(I);

temp = zeros(m,n);
temp(ms) = 1;
figure,imshow(temp);

h = find(sum(temp,1)>0);
hh = find(sum(temp,2)>0);

x1 = h(1);
v = find(temp(:,x1)>0);
y1 = v(1);

y2 = hh(1);
b = find(temp(y2,:)>0);
x2 = b(1);

x3 = h(end);
v = find(temp(:,x3)>0);
y3 = v(1);

y4 = hh(end);
b = find(temp(y4,:)>0);
x4 = b(1);
pt1 = [x1,y1];
pt2 = [x2,y2];
pt3 = [x3,y3];
pt4 = [x4,y4];
%% creation
if (idx == 1)
    %% data for module
    Xs = [p1(1,1);p3(1,1);p4(1,1);pt4(1,1)]; %%check later
    Ys = [p1(1,2);p3(1,2);p4(1,2);pt4(1,2)]; %%check later
    sweep3_moduleV2(temp,Xs,Ys);
    
elseif(idx == 2)
    
    CoorCreX =0;CoorCreY = 0;
    [x,y] = bresenham(tempstorage(1,1),tempstorage(1,2),tempstorage(3,1),tempstorage(3,2));
    CoorCreX = [CoorCreX;x]; CoorCreY = [CoorCreY;y];
    [x,y] = bresenham(tempstorage(1,1),tempstorage(1,2),tempstorage(4,1),tempstorage(4,2));
    CoorCreX = [CoorCreX;x]; CoorCreY = [CoorCreY;y];
    [x,y] = bresenham(tempstorage(3,1),tempstorage(3,2),tempstorage(2,1),tempstorage(2,2));
    CoorCreX = [CoorCreX;x]; CoorCreY = [CoorCreY;y];
    [x,y] = bresenham(tempstorage(4,1),tempstorage(4,2),tempstorage(2,1),tempstorage(2,2));
    CoorCreX = [CoorCreX;x]; CoorCreY = [CoorCreY;y];
    CoorCreZ = 1;
    CoorCreZ = repmat(CoorCreZ,size(CoorCreX,1));
    scatter(CoorCreX(:),CoorCreY(:),CoorCreZ(:));
end
end

