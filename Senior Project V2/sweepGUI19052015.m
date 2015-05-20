function varargout = sweepGUI19052015(varargin)
% SWEEPGUI19052015 MATLAB code for sweepGUI19052015.fig
%      SWEEPGUI19052015, by itself, creates a new SWEEPGUI19052015 or raises the existing
%      singleton*.
%
%      H = SWEEPGUI19052015 returns the handle to a new SWEEPGUI19052015 or the handle to
%      the existing singleton*.
%
%      SWEEPGUI19052015('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SWEEPGUI19052015.M with the given input arguments.
%
%      SWEEPGUI19052015('Property','Value',...) creates a new SWEEPGUI19052015 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sweepGUI19052015_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sweepGUI19052015_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sweepGUI19052015

% Last Modified by GUIDE v2.5 19-May-2015 01:45:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sweepGUI19052015_OpeningFcn, ...
                   'gui_OutputFcn',  @sweepGUI19052015_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before sweepGUI19052015 is made visible.
function sweepGUI19052015_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sweepGUI19052015 (see VARARGIN)

% Choose default command line output for sweepGUI19052015
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sweepGUI19052015 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sweepGUI19052015_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable4.
function uitable4_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable4 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PushImport.
function PushImport_Callback(hObject, eventdata, handles)
% hObject    handle to PushImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Push3D.
function Push3D_Callback(hObject, eventdata, handles)
% hObject    handle to Push3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over PushImport.
function PushImport_ButtonDownFcn(hObject, eventdata, handles)
image = Get_file();
axes(handles.axis2)
[inx1,iny1,inx2,iny2 ,countD,outCondition]=get_img_data(I);
% hObject    handle to PushImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
