function varargout = check(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @check_OpeningFcn, ...
    'gui_OutputFcn',  @check_OutputFcn, ...
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
function check_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = check_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
function pushbutton1_Callback(hObject, eventdata, handles)

mIconFile       =   fullfile('/media/');
filespec = { '*.jpg', 'JPEG files (*.jpg)';...
    '*.bmp', 'BMP files (*.bmp)'; ...
    '*.tif', 'TIFF files (*.tif)';
    '*.gif', 'GIF files (*.gif)';...
    '*.pnp', 'PNP files (*.pnp)'};
[filename, pathname] = uigetfile(filespec, ...
    'Pick an icon image file', mIconFile);

if ~isequal(filename,0)
    mIconFile =fullfile(pathname, filename);
    d=imread([mIconFile]);
    t1=imresize(d,[370 400]);
    t2=imresize(d,[70 120]);
    handles.pmimage1=t1;
    handles.tmpimage1=t1;
    set(handles.pushbutton10,'CData',t2)
end
guidata(hObject, handles);
function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.slider1,'Value',0)
set(handles.slider2,'Value',0)
set(handles.slider3,'Value',0)
if (handles.imstatus==1)
    handles.tmpimage1=handles.pmimage1;
    set(handles.pushbutton4,'CData',handles.tmpimage1)
    set(handles.pushbutton10,'CData',imresize(handles.tmpimage1,[70 120]))
elseif (handles.imstatus==2)
    handles.tmpimage2=handles.pmimage2;
    set(handles.pushbutton4,'CData',handles.tmpimage2)
    set(handles.pushbutton11,'CData',imresize(handles.tmpimage2,[70 120]))
elseif (handles.imstatus==3)
    set(handles.pushbutton4,'CData',handles.imout)
end
guidata(hObject, handles);
function pushbutton3_Callback(hObject, eventdata, handles)
mIconCData =[];
uiresume;
delete(check);
function pushbutton4_Callback(hObject, eventdata, handles)
function edit1_Callback(hObject, eventdata, handles)
file = get(hObject,'String');
if exist(file, 'file') ~= 2
    errordlg(['The given icon file cannot be found ' 10, file], ...
        'Invalid Icon File', 'modal');
    set(hObject, 'String', mIconFile);
else
    mIconCData = [];
    localUpdateIconstem();
end
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
mIsEditingIcon = false;
function edit1_ButtonDownFcn(hObject, eventdata, handles)
set(hObject,'String','');
set(hObject,'Enable','on');
set(hObject,'ButtonDownFcn',[]);
uicontrol(hObject);
function slider1_Callback(hObject, eventdata, handles)

RO=uint8(fix(get(handles.slider1,'value')));
GO=uint8(fix(get(handles.slider2,'value')));
BO=uint8(fix(get(handles.slider3,'value')));
for i=1:100
    for j=1:100
    L(i,j,1)=RO;
    L(i,j,2)=GO;
    L(i,j,3)=BO;
    end
end
set(handles.pushbutton5,'CData',L)
RO=double(RO);
GO=double(GO);
BO=double(BO);
if(handles.imstatus==1)
d=handles.pmimage1;
elseif(handles.imstatus==2)
 d=handles.pmimage2;
elseif (handles.imstatus==3)
    d=handles.imout;
end
mag=sqrt(RO^2+GO^2+BO^2);
a=size(d);
T=double(d);
for i=1:a(1)
    for j=1:a(2)
        magt=sqrt((T(i,j,1)^2)+(T(i,j,2)^2)+(T(i,j,3)^2));
        dot=(T(i,j,1)*RO+T(i,j,2)*GO+T(i,j,3)*BO)/(mag*magt);
        J(i,j,1)=uint8(fix(RO*dot/mag*magt));
        J(i,j,2)=uint8(fix(GO*dot/mag*magt));
        J(i,j,3)=uint8(fix(BO*dot/mag*magt));
    end
end
set(handles.pushbutton4,'CData',J)
if (handles.imstatus==1)
    handles.tmpimage1=J;
    set(handles.pushbutton10,'CData',imresize(J,[70 120]));
elseif (handles.imstatus==2)
    handles.tmpimage2=J;
    set(handles.pushbutton11,'CData',imresize(J,[70,120]))
end
set(handles.pushbutton4,'CData',J)
guidata(hObject, handles);
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


guidata(hObject, handles);
function slider2_Callback(hObject, eventdata, handles)

RO=uint8(fix(get(handles.slider1,'value')));
GO=uint8(fix(get(handles.slider2,'value')));
BO=uint8(fix(get(handles.slider3,'value')));
for i=1:100
    for j=1:100
    L(i,j,1)=RO;
    L(i,j,2)=GO;
    L(i,j,3)=BO;
    end
end
set(handles.pushbutton5,'CData',L)
RO=double(RO);
GO=double(GO);
BO=double(BO);
if(handles.imstatus==1)
d=handles.pmimage1;
elseif(handles.imstatus==2)
 d=handles.pmimage2;
elseif (handles.imstatus==3)
    d=handles.imout;
end
mag=sqrt(RO^2+GO^2+BO^2);
a=size(d);
T=double(d);
for i=1:a(1)
    for j=1:a(2)
        magt=sqrt((T(i,j,1)^2)+(T(i,j,2)^2)+(T(i,j,3)^2));
        dot=(T(i,j,1)*RO+T(i,j,2)*GO+T(i,j,3)*BO)/(mag*magt);
        J(i,j,1)=uint8(fix(RO*dot/mag*magt));
        J(i,j,2)=uint8(fix(GO*dot/mag*magt));
        J(i,j,3)=uint8(fix(BO*dot/mag*magt));
    end
end
set(handles.pushbutton4,'CData',J)
if (handles.imstatus==1)
    handles.tmpimage1=J;
    set(handles.pushbutton10,'CData',imresize(J,[70,120]))
elseif (handles.imstatus==2)
    handles.tmpimage2=J;
    set(handles.pushbutton11,'CData',imresize(J,[70 120]))
end
set(handles.pushbutton4,'CData',J)
guidata(hObject, handles);
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

guidata(hObject, handles);
function slider3_Callback(hObject, eventdata, handles)

RO=uint8(fix(get(handles.slider1,'value')));
GO=uint8(fix(get(handles.slider2,'value')));
BO=uint8(fix(get(handles.slider3,'value')));
for i=1:100
    for j=1:100
    L(i,j,1)=RO;
    L(i,j,2)=GO;
    L(i,j,3)=BO;
    end
end
set(handles.pushbutton5,'CData',L)
RO=double(RO);
GO=double(GO);
BO=double(BO);
if(handles.imstatus==1)
d=handles.pmimage1;
elseif(handles.imstatus==2)
 d=handles.pmimage2;
elseif (handles.imstatus==3)
    d=handles.imout;
end
mag=sqrt(RO^2+GO^2+BO^2);
a=size(d);
T=double(d);
for i=1:a(1)
    for j=1:a(2)
        magt=sqrt((T(i,j,1)^2)+(T(i,j,2)^2)+(T(i,j,3)^2));
        dot=(T(i,j,1)*RO+T(i,j,2)*GO+T(i,j,3)*BO)/(mag*magt);
        J(i,j,1)=uint8(fix(RO*dot/mag*magt));
        J(i,j,2)=uint8(fix(GO*dot/mag*magt));
        J(i,j,3)=uint8(fix(BO*dot/mag*magt));
    end
end
set(handles.pushbutton4,'CData',J)
if (handles.imstatus==1)
    handles.tmpimage1=J;
    set(handles.pushbutton10,'CData',imresize(J,[70 120]))
elseif (handles.imstatus==2)
    handles.tmpimage2=J;
    set(handles.pushbutton11,'CData',imresize(J,[70 120]))
end
set(handles.pushbutton4,'CData',J)
guidata(hObject, handles);
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

guidata(hObject, handles);
function pushbutton5_Callback(hObject, eventdata, handles)

R1=get(handles.slider1,'value');
G1=get(handles.slider2,'value');
B1=get(handles.slider3,'value');
for i=1:100
    for j=1:100
    L(i,j,1)=R1;
    L(i,j,2)=G1;
    L(i,j,3)=B1;
    end
end
set(handles.pushbutton5,'CData',L)

guidata(hObject, handles);
function pushbutton9_Callback(hObject, eventdata, handles)
mIconFile       =   fullfile('/media/');
filespec = { '*.jpg', 'JPEG files (*.jpg)';...
    '*.bmp', 'BMP files (*.bmp)'; ...
    '*.tif', 'TIFF files (*.tif)';
    '*.gif', 'GIF files (*.gif)';...
    '*.pnp', 'PNP files (*.pnp)'};
[filename, pathname] = uigetfile(filespec, ...
    'Pick an icon image file', mIconFile);

if ~isequal(filename,0)
    mIconFile =fullfile(pathname, filename);
    d=imread([mIconFile]);
    t1=imresize(d,[370 400]);
    t2=imresize(d,[70 120]);
    handles.pmimage2=t1;
    handles.tmpimage2=t1;
    set(handles.pushbutton11,'CData',t2)
end
guidata(hObject, handles);
function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton10_Callback(hObject, eventdata, handles)
handles.imstatus=1;
set(handles.pushbutton4,'CData',handles.tmpimage1);
guidata(hObject, handles);
function pushbutton11_Callback(hObject, eventdata, handles)
handles.imstatus=2;
set(handles.pushbutton4,'CData',handles.tmpimage2);
guidata(hObject, handles);
function pushbutton12_Callback(hObject, eventdata, handles)
imwrite(get(handles.pushbutton4,'CData'),'imout.jpg');
function pushbutton13_Callback(hObject, eventdata, handles)
d=get(handles.pushbutton4,'CData');
d=rgb2gray(d);
handles.gray=d;
imtool(d);
guidata(hObject, handles);
function pushbutton14_Callback(hObject, eventdata, handles)
p=get(handles.pushbutton4,'CData');
p=rgb2gray(p);
p=edge(p,'canny');
handles.canny=p;
imtool(p);
guidata(hObject, handles);
function pushbutton15_Callback(hObject, eventdata, handles)
p=get(handles.pushbutton4,'CData');
d=rgb2hsv(p);
set(handles.pushbutton4,'CData',d);
handles.hsv=d;
guidata(hObject, handles);
function pushbutton16_Callback(hObject, eventdata, handles)
p=get(handles.pushbutton4,'CData');
p=rgb2gray(p);
p=imcomplement(p);
handles.negative=p;
imtool(p)
guidata(hObject, handles);
function slider4_Callback(hObject, eventdata, handles)
handles.imstatus=3;
handles.imratio=get(handles.slider4,'value');
rat=handles.imratio;
I1=double(handles.tmpimage1);
I2=double(handles.tmpimage2);
handles.imout=uint8(fix(rat*I1+(1-rat)*I2));
    set(handles.pushbutton4,'CData',handles.imout);
guidata(hObject, handles);
function slider4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function pushbutton17_Callback(hObject, eventdata, handles)
mIconFile       =   fullfile('/media/');
filespec = { '*.avi', 'AVI files (*.avi)';};
[filename, pathname] = uigetfile(filespec, ...
    'Pick an icon image file', mIconFile);

if ~isequal(filename,0)
    handles.video =fullfile(pathname, filename);
end
guidata(hObject, handles);
function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton19_Callback(hObject, eventdata, handles)
handles.imstatus=3;
t=mmreader(handles.video);
p=str2num(get(handles.edit3,'String'));
d=read(t,p);
handles.imout=d;
set(handles.edit3,'String','')
set(handles.pushbutton4,'CData',imresize(d,[370 400]));
guidata(hObject, handles);
function pushbutton8_Callback(hObject, eventdata, handles)
k=get(handles.pushbutton4,'CData');
r=k(:,:,3);
t=imhist(r);
stem(handles.axes1,t)
function pushbutton6_Callback(hObject, eventdata, handles)
k=get(handles.pushbutton4,'CData');
r=k(:,:,1);
t=imhist(r);
stem(handles.axes1,t)
function pushbutton7_Callback(hObject, eventdata, handles)
k=get(handles.pushbutton4,'CData');
r=k(:,:,2);
t=imhist(r);
stem(handles.axes1,t)
function pushbutton20_Callback(hObject, eventdata, handles)
p=get(handles.pushbutton4,'CData');
p=rgb2gray(p);
p=edge(p,'canny');
handles.canny=p;
r=handles.canny;
t=imhist(r);
stem(handles.axes1,t)
function pushbutton21_Callback(hObject, eventdata, handles)
d=get(handles.pushbutton4,'CData');
d=rgb2gray(d);
handles.gray=d;
r=handles.gray;
t=imhist(r);
stem(handles.axes1,t)
function pushbutton22_Callback(hObject, eventdata, handles)
p=get(handles.pushbutton4,'CData');
p=rgb2gray(p);
p=imcomplement(p);
handles.negative=p;
r=handles.negative;
t=imhist(r);
stem(handles.axes1,t)
