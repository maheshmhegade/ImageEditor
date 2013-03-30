function varargout = editimage(varargin)
% EDITIMAGE MATLAB code for editimage.fig
%      EDITIMAGE, by itself, creates a new EDITIMAGE or raises the existing
%      singleton*.
%
%      H = EDITIMAGE returns the handle to a new EDITIMAGE or the handle to
%      the existing singleton*.
%
%      EDITIMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDITIMAGE.M with the given input arguments.
%
%      EDITIMAGE('Property','Value',...) creates a new EDITIMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before editimage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to editimage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help editimage

% Last Modified by GUIDE v2.5 30-Mar-2013 23:05:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @editimage_OpeningFcn, ...
                   'gui_OutputFcn',  @editimage_OutputFcn, ...
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


% --- Executes just before editimage is made visible.
function editimage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to editimage (see VARARGIN)

% Choose default command line output for editimage
handles.output = hObject;
handles.colorFilter = '';
handles.previousFilter = '';

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes editimage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = editimage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
mIconFile       =   fullfile('/home/mmh/images');

filespec = { '*.jpg', 'JPEG files (*.jpg)';...
    '*.bmp', 'BMP files (*.bmp)'; ...
    '*.tif', 'TIFF files (*.tif)';
    '*.gif', 'GIF files (*.gif)';...
    '*.pnp', 'PNP files (*.pnp)'};
[filename, pathname] = uigetfile(filespec, ...
    'Pick an icon image file', mIconFile);

if ~isequal(filename,0)
    mIconFile = fullfile(pathname, filename);
    handles.originalImage = imread([mIconFile]);
    handles.displayImage = handles.originalImage;
    displayImage(hObject,handles);
end
guidata(hObject, handles);

function displayImage(hObject,handles)

if(size(handles.originalImage,1) > size(handles.originalImage,2))
   tmpDisplayImageHeight = 300;
   tmpDisplayImageWidth = round((size(handles.originalImage,2)/size(handles.originalImage,2))*300);
else
   tmpDisplayImageHeight = round((size(handles.originalImage,1)/size(handles.originalImage,2))*300);
   tmpDisplayImageWidth = 300;
end
    tmpDisplayImage = imresize(handles.displayImage,[tmpDisplayImageHeight,tmpDisplayImageWidth]);
    set(handles.pushbutton1,'CData',tmpDisplayImage);
guidata(hObject,handles);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function setRadioButtonStatus(hObject,handles)
if(strcmp(handles.previousFilter,'red'))
    set(handles.radiobutton1,'Value',~(get(handles.radiobutton1,'Value')));
elseif(strcmp(handles.previousFilter,'green'))
    set(handles.radiobutton2,'Value',~get(handles.radiobutton2,'Value'));
elseif(strcmp(handles.previousFilter,'blue'))
    set(handles.radiobutton3,'Value',~get(handles.radiobutton3,'Value'));
elseif(strcmp(handles.previousFilter,'yellow'))
    set(handles.radiobutton4,'Value',~get(handles.radiobutton4,'Value'));
else    
end
guidata(hObject,handles);
% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
handles.previousFilter = handles.colorFilter;
setRadioButtonStatus(hObject,handles);
handles.colorFilter = 'red';
guidata(hObject, handles);
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
handles.previousFilter = handles.colorFilter;
setRadioButtonStatus(hObject,handles);
handles.colorFilter = 'green';
guidata(hObject, handles);
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
handles.previousFilter = handles.colorFilter;
setRadioButtonStatus(hObject,handles);
handles.colorFilter = 'blue';
guidata(hObject, handles);
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
handles.previousFilter = handles.colorFilter;
setRadioButtonStatus(hObject,handles);
handles.colorFilter = 'yellow';
guidata(hObject, handles);
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

if(strcmp(handles.colorFilter,'red'))
    handles.displayImage = generateEditImage(hObject,handles,1);
elseif(strcmp(handles.colorFilter,'green'))
    handles.displayImage = generateEditImage(hObject,handles,2);
elseif(strcmp(handles.colorFilter,'blue'))
    handles.displayImage = generateEditImage(hObject,handles,3);
elseif(strcmp(handles.colorFilter,'yellow'))
    
else
    
end
displayImage(hObject,handles)
guidata(hObject, handles);

function editedImage = generateEditImage(hObject,handles,channelNumber)

grayLayer = rgb2gray(handles.originalImage);
editedImage(:,:,1) = grayLayer;
editedImage(:,:,2) = grayLayer;
editedImage(:,:,3) = grayLayer;

for i=1 : size(handles.originalImage,1)
    for j=1 : size(handles.originalImage,2)
        if (handles.originalImage(i,j,channelNumber) > 150)
           editedImage(i,j,1) = handles.originalImage(i,j,1);
           editedImage(i,j,2) = handles.originalImage(i,j,2);
           editedImage(i,j,3) = handles.originalImage(i,j,3);
        end
    end
end 
guidata(hObject, handles);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
mIconFile       =   fullfile('/home/mmh/images');
filespec = { '*.jpg', 'JPEG files (*.jpg)';...
    '*.bmp', 'BMP files (*.bmp)'; ...
    '*.tif', 'TIFF files (*.tif)';
    '*.gif', 'GIF files (*.gif)';...
    '*.pnp', 'PNP files (*.pnp)'};
[filename, pathname] = uiputfile(filespec, ...
    'Pick an icon image file', mIconFile);

mIconFile = fullfile(pathname, filename);
imwrite(handles.displayImage,mIconFile);
guidata(hObject, handles);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
