function [distance2]=Basic3swEdit( twoD,profWidth,distance,distance2,direction)
%% mod
if distance2~=0
    startHeight = 1;
    height = distance2;
    distance = distance + distance2;
    top = 1;
else
    startHeight =1;
    height = 1;
end

%% get data to preparing resize profile
twoDbaseLen = size(twoD,2); % Standard length
idL =1;
%%
%figure,
%twoD(1:2:end) = NaN;
%edge_imgB1 = edge(twoD,'canny');
edge_imgB1 = twoD;
for i=startHeight:1:distance-1
    %% closed cap
    if i == startHeight || i > distance - 1 || top == 1
       twoDresize = twoD;
       top = 0;
    else
        twoDresize = edge_imgB1;
    end
    %% resize in percent
%     if profWidth(idL)< 5
%         profWidth(idL) = size(twoD,2);
%     end
    %% old formula
    %twoDScale = abs((1+(profWidth(idL)- twoDbaseLen)/100.00)); %as percent
    %% new formula

    if profWidth(idL) <1
        profWidth(idL) =1;
    end
    newHeight = round(size(twoDresize,1)/ size(twoDresize,2) * profWidth(idL));
                         %original height   %original width     %new width
    if newHeight<1
    newHeight =1;
    end

    twoDresize = imresize(twoDresize,[newHeight profWidth(idL)]);
    [yy , xx] = find(twoDresize >= 1);
    %% shift to center 
    xx = xx-ceil(size(twoDresize,2)/2);
    yy = yy-ceil(size(twoDresize,1)/2);
    %%
    if size(xx)>0
        hold on,plot3(xx,yy,ones(size(yy,1),1)*height*(-1),'b.')
        height = height + 1;
    else
        
    end
    idL = idL+1;
    %dataY = [dataY,yy];
    %dataX = [dataX,xx];
    %data = dataY;
end
%data(1).xx = dataX;


