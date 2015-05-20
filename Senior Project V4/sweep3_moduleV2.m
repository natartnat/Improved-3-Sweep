%% this is stable version *%
% programmer    : Nat anunta
% version       : 2.0
% date          : 23/04/2015 01:44 
%               : ?

% feature       : module for circle sweep
% variable use  : ?
% bug           : []
function sweep3_moduleV2(img,Xs,Ys)

%[img, map, alphat] = imread('C:\Users\Nat\Documents\MATLAB\pic\glass.png','png');
%img = imread('C:\Users\Nat\Documents\MATLAB\pic\glass.png');
%img = imread('C:\Users\Nat\Documents\MATLAB\pic\cancan.jpg');
%img = imread('C:\Users\Nat\Documents\MATLAB\pic\cokese.jpg');
% min_x = 0;max_x = 360;
% min_y = 0;max_y = 360; 

min_x = 0;max_x = size(img,1);
min_y = 0;max_y = size(img,2);

%%grayt = rgb2gray(img);
%%BW = edge(grayt,'canny');
%BW = flipud(BW);
%%imshow(BW);

imagesc([min_x max_x], [min_y max_y], flipud(img));% flip y axis
hold on;
set(gca,'ydir','normal');

%[y x] = ginput(4);

Xs = int32(Xs);Ys = int32(Ys);
data =[];roRa=[];
for level = Ys(1,1):1:Ys(4,1) %% from top to bottom
    try
    row = img(level,:); %find in row
    rowOne = find(row == 1);%% got y that  == 1
    if size(rowOne,2)>=1
        Rotaterange = int32(abs(rowOne(end) - rowOne(1))/2);
        center = int32(abs((rowOne(end) + rowOne(1)))/2);
        Xshift = rowOne(1)- Xs(1); %% shift from (0,0)

        [dataSet]=plotPoint3_moduleV2(double(Rotaterange) ,double(level),'verticle',Xshift);
        data = [data ; dataSet];
        roRa = [roRa; Rotaterange];
    end
    catch ex
    end
end
data = flipud(data);
figure(2);
%data(:,3) = sort(data(:,3));
a=sort(data(:,3));
figure;
scatter3(data(:,1),data(:,2),a(:,1));
%disp('whathappen');



%rowTwo = find(row2 == 1);
% tmp = rowOne(end) - rowOne(1);
% tmp2 = rowTwo(end) - rowTwo(1);

% if (tmp >=tmp2)
%     use = tmp;
% else
%     use = tmp2;
% end
%plot(x,y,'b-*','linewidth',1.5);

%for x(1,1):1:
%row2= BW(x(2,1),:)

%colormap(gray);
%hold on;
% [M,N] = size(img); 
%  alphat = alphat(1:M, 1:N); 
 % image([0 200],[0 200],img); 
% set(img, 'AlphaData', alphat);

%[rowAllx rowAlly] = find(BW==1);