function [D]=Get_file()
[filename,pathname] = uigetfile({'*.jpg';'*.tif';'*.png';'*.*'}, 'Get Image file');
        fich1 = fullfile(pathname,filename);
        D=imread(fich1);
       
            %D = imresize(D,[100 100]);
            %imshow(D, 'InitialMagnification', 'fit')
        
