
function guiscript
f = figure('Visible','off','SizeChangedFcn',@match_width);
u = uipanel('Units','Pixels', 'Tag','StatusBar',...
            'BackgroundColor','blue');
f.Visible= 'on';

function match_width(hObject,eventdata) 
       fig = gcbo;
       u = findobj(fig,'Tag','StatusBar');      

       % change panel units to pixels and adjust position
       panelunits = u.Units;
       u.Units = 'pixels';
       figpos = fig.Position; 
       upos = [1, figpos(4) - 20, figpos(3), 20];
       u.Position = upos;

       % restore original panel units
       u.Units = panelunits;
      
    end 
end