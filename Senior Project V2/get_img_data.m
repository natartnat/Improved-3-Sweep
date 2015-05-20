function [inx1,iny1,inx2,iny2 ,countD,outCondition]=get_img_data(I)
inx1 = [];iny1 = [];inx2 = [];iny2 = [];
countD = 1;

outCondition = 0;

figure,imshow(I);
while(outCondition == 0)
[xin,yin]= ginput(1); %% 2d base
    if (yin>size(I,1) || yin<0) || (xin>size(I,2) || xin<0)
        outCondition = 1;
    else
        inx1 = [inx1 ,xin ];
        iny1 = [iny1 ,yin ];
        
        [xin,yin]= ginput(1); %% direction
        
        inx2 = [inx2 ,xin ];
        iny2 = [iny2 ,yin ];
        
        countD = countD + 1;
    end
end