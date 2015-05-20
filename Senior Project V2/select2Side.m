function [tempBody] = select2Side( tempBody , twoD , I)
%% ============== mod
[ twoD , rangeD1 ] = myCrop( twoD );
[ tempBody1 , rangeB1 ] = myCrop( tempBody );
% =============== get 2 side of square
%% i want to know bound of Body
%% now it error with 1 side 

%% plot at half of side
if rangeD1(1) < rangeB1(1) %if body on the right side |right > left
    x1 = round((rangeD1(1) + rangeB1(1))/2);
    y1 = round((rangeB1(3) + rangeB1(4))/2);
    if (rangeB1(1) - rangeD1(1))<0 || x1 < rangeD1(1) 
        x1 = round(rangeD1(1)*1.1);
    end
    %figure,imshow(I),hold on,plot(x1,y1,'*b')
    tempBodyExtend = selectOBJ(I,[round(x1);round(y1)]);
elseif rangeD1(2) > rangeB1(2) %if body on the left side |left > right
    x1 = round((rangeD1(2)+rangeB1(2))/2);
    y1 = round((rangeB1(3) + rangeB1(4))/2);
    if(rangeB1(2) - rangeD1(2))>0 || x1> rangeD1(2)
        x1 = round(rangeD1(2)*0.9);
    end
    tempBodyExtend = selectOBJ(I,[round(x1);round(y1)]);
else
    tempBodyExtend = zeros(size(I,1),size(I,2));
end
%% simple check outside fixed range
outS = find(sum(tempBodyExtend,2));
if ~isempty(outS)
    if outS(1) > 5 && outS(end) <= size(tempBodyExtend,2)-5
        tempBody = tempBody + tempBodyExtend;
    end 
end
figure('Name','twoSide','NumberTitle','off'); imshow(tempBody);

tempBody = edge(tempBody,'canny');
% se = strel('disk',3);
% tempBody = imdilate(tempBody,se);
figure('Name','twoSide2','NumberTitle','off'); imshow(tempBody);
close twoSide;
close twoSide2;
%[ tempBody , rangeB1 ] = myCrop( tempBody );
%figure,imshow(tempBody);
%hold on,plot(x1,y1,'b.');hold off;