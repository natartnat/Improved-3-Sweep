function [ ]= shapeDeClick_module( twoD )
%% edge
edge_imgB1 = edge(twoD,'prewitt');
temp = edge_imgB1;
%% extracted data
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


%% ====== check area 2D =======
actualArea = sum(twoD(:));
cirIdealArea = pi*round((x3-x1)/2)*round((y4-y2)/2);
rectIdealArea = abs((sqrt((x4-x1)^2+(y4-y1)^2))...
    *abs(sqrt((x3-x4)^2+(y3-y4)^2))/2)...
    +abs((sqrt((x2-x1)^2+(y2-y1)^2))...
    *abs(sqrt((x3-x2)^2+(y3-y2)^2))/2);
AreaT = [cirIdealArea,rectIdealArea];
%% find which one is it
tmp = abs(AreaT-actualArea);
[idx idx] = min(tmp); %index of closest value
%closest = AreaT(idx); %closest value
hold off;
