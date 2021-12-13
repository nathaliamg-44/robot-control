
function varargout = MarcoReferenciaXY(varargin)
% MARCOREFERENCIA MATLAB code for MarcoReferencia.fig
%      MARCOREFERENCIA, by itself, creates a new MARCOREFERENCIA or raises the existing
%      singleton*.
%
%      H = MARCOREFERENCIA returns the handle to a new MARCOREFERENCIA or the handle to
%      the existing singleton*.
%
%      MARCOREFERENCIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MARCOREFERENCIA.M with the given input arguments.
%
%      MARCOREFERENCIA('Property','Value',...) creates a new MARCOREFERENCIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MarcoReferencia_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MarcoReferencia_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MarcoReferencia

% Last Modified by GUIDE v2.5 28-Sep-2021 23:34:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MarcoReferenciaXY_OpeningFcn, ...
                   'gui_OutputFcn',  @MarcoReferenciaXY_OutputFcn, ...
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


% --- Executes just before MarcoReferencia is made visible.
function MarcoReferenciaXY_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MarcoReferencia (see VARARGIN)

% Choose default command line output for MarcoReferencia
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MarcoReferencia wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MarcoReferenciaXY_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
movimiento(handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.

function movimiento(handles)

px=str2double(get(handles.edit1,'String'))
py=str2double(get(handles.edit2,'String'))
pz=0
rx=get(handles.slider1,'value')
ry=get(handles.slider2,'value')
rz=0
set(handles.text12,'String',rx)
set(handles.text13,'String',ry)
mTransformacion(ry,rz,rx,px,py,pz)

function [Tt]= mTransformacion(fi,theta,alfa,x,y,z)
    %rotación en XYZ 
    axis vis3d
    rotate3d
    Tt=[cosd(fi)*cosd(theta) sind(alfa)*sind(fi)-cosd(fi)*sind(theta)*cosd(alfa) cosd(fi)*sind(theta)*sind(alfa)+sind(fi)*cos(alfa) x ; sind(theta) cosd(theta)*cosd(alfa) -cosd(theta)*sind(alfa) y ; -sind(fi)*cosd(theta) sind(fi)*sind(theta)*cosd(alfa)+cosd(fi)*sind(alfa) cosd(fi)*cosd(alfa)-sind(fi)*sind(theta)*sind(alfa) z; 0 0 0 1];
    frame(Tt,'c',1,1);
    
function edit1_Callback(hObject, eventdata, handles)
movimiento(handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
movimiento(handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function slider1_Callback(hObject, eventdata, handles)
movimiento(handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)




% hObject    handle to axes3 (see GCBO)
%h=plot3(0,0,0);


% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function text12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
