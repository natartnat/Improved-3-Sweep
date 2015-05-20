function [ d , profileWidth ] = getProperty( tempBody )
profileWidth= [];
%% ================ Mod

[ imgB1 , rangeB1 ] = myCrop(tempBody);
for i = 1:1:size(imgB1,1)
        tempFind = find(imgB1(i,:));
        profileWidth(i,1) = tempFind(end) - tempFind(1);
end

%%
edge_imgB1 = edge(tempBody,'prewitt');

[H,theta,rho] = hough(edge_imgB1);


P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
line = houghlines(edge_imgB1,theta,rho,P);

pY1 = line(1,1).point1(2);
pY2 = line(1,1).point2(2);

d = abs(pY1-pY2); %% get height
id = 1;
figure('Name','getProp','NumberTitle','off'), imshow(tempBody), hold on

for k = 2:length(line) %% get longest length > height
    %%
    xy = [line(k).point1; line(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

    % Plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    %%
    Tp1 = line(1,k).point1(2);
    Tp2 = line(1,k).point2(2);
    
    temp_d = abs(Tp1-Tp2); %% ()
    if temp_d > d
        %pY1 = Tp1;
        %pY2 = Tp2;
        id = k;
    end

pc1 = line(1,id).point1;
pc2 = line(1,id).point2;

d = abs(pc1(2)-pc2(2)); % get length

end
xy = [line(id).point1; line(id).point2];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','red');
close getProp;