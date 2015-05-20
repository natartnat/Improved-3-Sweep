function [data] = Basic3sw( twoD,profWidth,height,disMax,direction,objNum,data)
%% mod
temp = 1;
if disMax~=0
    j =disMax;
    height = height + disMax;
    top = 1;
else
    j =1;
end

%% get data to preparing resize profile
twoDbaseLen = size(twoD,2); % Standard length
idL =1;
%%
%figure,
%twoD(1:2:end) = NaN;
edge_imgB1 = edge(twoD,'prewitt');
%edge_imgB1 = twoD;
for i=j:1:height-1
    %% closed cap
    if i == j || i > disMax - 1 || top == 1
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
% %     if twoDScale <= 0
% %          twoDScale = twoDBefore;
% %      end
%     else
%         twoDBefore = twoDScale;
%     end

    twoDresize = imresize(twoDresize,[newHeight profWidth(idL)]);
    [yy , xx] = find(twoDresize >= 1);
    %% shift to center 
    xx = xx-ceil(size(twoDresize,2)/2);
    yy = yy-ceil(size(twoDresize,1)/2);
    %%
    if isempty(xx)|| isempty(yy)
        xx = [1]; yy =[1];
    end
    if mod(objNum,2) == 0 
        hold on,plot3(xx,yy,ones(size(yy,1),1)*i*(-1),'b.')
    else
    hold on,plot3(xx,yy,ones(size(yy,1),1)*i*(-1),'g.')
    end
    idL = idL+1;
    data(objNum).stap(temp).objnumm = twoDresize;
    temp = temp + 1;
end
%data(1).xx = dataX;


%% shape shift
% a = sum(twoDresize,1);
% b = sum(twoDresize,2);
% xxx = (a(1)+a(end))/2;
% yyy = (b(1)+b(end))/2;
