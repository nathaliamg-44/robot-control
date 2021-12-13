function varargout = lab3_1b(varargin)
% LAB3_1B MATLAB code for lab3_1b.fig
%      LAB3_1B, by itself, creates a new LAB3_1B or raises the existing
%      singleton*.
%
%      H = LAB3_1B returns the handle to a new LAB3_1B or the handle to
%      the existing singleton*.
%
%      LAB3_1B('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB3_1B.M with the given input arguments.
%
%      LAB3_1B('Property','Value',...) creates a new LAB3_1B or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab3_1b_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab3_1b_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab3_1b

% Last Modified by GUIDE v2.5 26-Oct-2021 03:58:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab3_1b_OpeningFcn, ...
                   'gui_OutputFcn',  @lab3_1b_OutputFcn, ...
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


% --- Executes just before lab3_1b is made visible.
function lab3_1b_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab3_1b (see VARARGIN)

% Choose default command line output for lab3_1b
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab3_1b wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab3_1b_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    movimiento(handles)
%   valor=(get(handles.slider1,'value'))%recibe el dato del slider1.
  
    
    



 

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


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
set(handles.slider1,'value',str2num(get(hObject,'string')))
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when uipanel1 is resized.
function uipanel1_SizeChangedFcn(hObject, eventdata, handles)

% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




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

function movimiento(handles)
    %Por medio del método get se recibe Theta 0,1,2
    %Set envia el valor del slider a un Static Text
    to=(get(handles.slider4,'value'))
    set(handles.text9,'string',to) 
    
    t1=(get(handles.slider1,'value'))
    set(handles.text2,'string',t1) 

    t2=(get(handles.slider2,'value'))
    set(handles.text3,'string',t2) 
 

    %Definición de parámetros de axis 
    delete(gca)   
    h = plot(0,0)
    p = get(h,'Parent')
    xlim(p,'manual');
    xlim(p,[-700 700]) %Define el límite del eje x que se observará en la gráfica
    ylim(p,'manual');
    ylim(p,[-700 700])%Define el límite del eje y que se observará en la gráfica 
    grid on
    hold on
    axis vis3d
    rotate3d
    rotate3d
    xlabel('Eje x')
    ylabel('Eje y')
    radio = 20;
    
    %Dimensiones de los eslabones L1,L2,L3
    l1=200;
    l2=220;
    l3=240;
    
    %Parámetros de matriz de Denavit Hatenberg 
    dh = [ 0  0 to 0 0 ;
           0 l1 t1 0 0 ;
           0 l2 t2 0 0 ;
           0 l3  0 0 0 ];
    %Ángulos variables de los articulares t1,t2,t3
    q =[(to*pi/180) (t1*pi/180) (t2*pi/180) 0];     
    
    %Matriz transformación de cada articulación obtenido con Linktrans
    To =linktrans(dh(1,:),q(1))
    T1 =linktrans(dh(2,:),q(2))
    T2 =linktrans(dh(3,:),q(3));
    T3 =linktrans(dh(4,:),q(4));
    
    %Marco de referencia {0}
    x0 = To(1,4);
    y0 = To(2,4);
    viscircles([x0 y0],radio,'Color','b');
    
    %Marco de referencia de {1} visto desde {0}
    T01=To*T1;
    x1 = T01(1,4);
    y1 = T01(2,4);
    viscircles([x1 y1],radio,'Color','r');
    line([0,x1],[0,y1],'Color','r','LineWidth',3);
    
    %Marco de referencia de {2} visto desde {1} y {0}
    T12=To*T1*T2;
    x2 = T12(1,4);
    y2 = T12(2,4);
    viscircles([x2 y2],radio,'Color','m');
    line([x1,x2],[y1,y2],'Color','r','LineWidth',3);
    
    %Marco de referencia de {3} visto desde {3} {1} {0}
    T123=To*T1*T2*T3
    x3 = T123(1,4);
    y3 = T123(2,4);
    viscircles([x3 y3],radio,'Color','b');
    line([x2,x3],[y2,y3],'Color','r','LineWidth',3);
    
    
    %Procedimiento matemático para determinar posición del Efector Final
    Qx = l1*cosd(to)+l2*cosd(to+t1)+l3*cosd(t1+t2+to);
    Qy = l1*sind(to)+l2*sind(to+t1)+l3*sind(t1+t2+to);
    
    %Envio a dos static text de la posición en X e Y del efector Final 
    set(handles.text13,'string',Qx)
    set(handles.text14,'string',Qy)
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
movimiento(handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
movimiento(handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
