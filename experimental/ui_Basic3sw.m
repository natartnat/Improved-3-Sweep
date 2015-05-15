function ui_Basic3sw()
figure(1)
panel1 = uipanel('Parent',1);
panel2 = uipanel('Parent',panel1);
set(panel1,'Position',[0 0 0.95 1]);
set(panel2,'Position',[0 -1 1 2]);

set(gca,'Parent',panel2);
s = uicontrol('Style','Slider','Parent',1,...
      'Units','normalized','Position',[0.95 0 0.04 1],...
      'Value',1,'Callback',{@slider_callbackR,panel2});
getF = uicontrol('Style','Pushbutton','parent',1, ...
   'String','Getfile',...
   'Position',[0.2,1,70,20],... %[x y xtrude ytrude]
   'BackgroundColor',[0.8,0.8,0.8], ...
   'CallBack',{@Get_file,panel2});
threeSw = uicontrol('Style','Pushbutton','parent',1, ...
   'String','Getfile',...
   'Position',[0.2,1,70,20],... %[x y xtrude ytrude]
   'BackgroundColor',[0.8,0.8,0.8], ...
   'CallBack',{@Get_file,panel2});
end

function slider_callbackR(src,eventdata,arg1)
val = get(src,'Value');
set(arg1,'Position',[0 -val 1 2])
end

function Get_file(src,eventdata,arg1)
[filename,pathname] = uigetfile({'*.jpg';'*.tif';'*.png';'*.*'}, 'Get Image file');
fich1 = fullfile(pathname,filename);
if(exist(fich1))
    D=imread(fich1);
    %D = imresize(D,[100 100]);
    imshow(D);
    set(arg1,'Position',[0 -1 1 2])
end
end

function main_call(D)
try
    script_main(D);
catch
end
end
