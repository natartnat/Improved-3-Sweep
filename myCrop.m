function [out range]= myCrop( temp )

hh = find(sum(temp,1)>0); %% projection X coor
h = find(sum(temp,2)>0); %% projection Y coor

x1 = hh(1);
x2 = hh(end);
y1 = h(1);
y2 = h(end);
range = [x1 x2 y1 y2];
out = (temp(y1:y2,x1:x2));

end

