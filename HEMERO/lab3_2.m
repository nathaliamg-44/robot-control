function varargout = lab3_2(varargin)
% LAB3_2 MATLAB code for lab3_2.fig
%      LAB3_2, by itself, creates a new LAB3_2 or raises the existing
%      singleton*.
%
%      H = LAB3_2 returns the handle to a new LAB3_2 or the handle to
%      the existing singleton*.
%
%      LAB3_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB3_2.M with the given input arguments.
%
%      LAB3_2('Property','Value',...) creates a new LAB3_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab3_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab3_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab3_2

% Last Modified by GUIDE v2.5 16-Nov-2021 14:08:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab3_2_OpeningFcn, ...
                   'gui_OutputFcn',  @lab3_2_OutputFcn, ...
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


% --- Executes just before lab3_2 is made visible.
function lab3_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab3_2 (see VARARGIN)

% Choose default command line output for lab3_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab3_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab3_2_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
movimiento(handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
movimiento(handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
movimiento(handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
movimiento(handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
movimiento(handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
movimiento(handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function movimiento(handles)
    
    %------------Sliders-------------------------------------------------- 
    angulo1=(get(handles.slider1,'value'));
    set(handles.text6,'string',angulo1); 
    t1=(angulo1*pi)/180;
    
    angulo2=(get(handles.slider2,'value'));
    set(handles.text7,'string',angulo2);
    t2=(angulo2*pi/180);
    d3=(get(handles.slider3,'value'));
    set(handles.text8,'string',d3);
    
    angulo3=(get(handles.slider4,'value'));
    set(handles.text9,'string',angulo3);
    t3=(angulo3*pi/180);
    
    
    
 
    
    
    %------------Axis------------------------------------------------------
    delete(gca)
    h = plot3(0,0,0)
    p = get(h,'Parent')
    xlim(p,'manual');
    xlim(p,[-1000 1000]) %Define el límite del eje x que se observará en la gráfica
    ylim(p,'manual');
    ylim(p,[-1000 1000])%Define el límite del eje y que se observará en la gráfica
    zlim(p,'manual'); 
    zlim(p,[-200 1000])%Define el límite del eje z que se observará en la gráfica
    axis vis3d
    rotate3d
    grid on
    grid minor
    hold on
    xlabel('Eje x')
    ylabel('Eje y')
    zlabel('Eje z')
    
    %----------------------Eslabones --------------------------------------
    r=30; %radio del cilindro 
    h=80; %altura del cilindro
    
    
    [x1,y1,z1]=cylinder(1);
    x2=x1+r*x1; 
    y2=y1+r*y1 ;
    z2=z1+h*z1;
    surf(x2+100,y2+100,z2,'FaceColor','b','EdgeColor','none');
    
     %Dimensiones de los eslabones L1,L2,L3
    l1=600;
    l2=600;
    l3=200;
    d4=400;
    d2=200;
    
    
    line([100,100],[100,100],[90,600],'Color','g','LineWidth',3);
        
    %Parámetros de matriz de Denavit Hatenberg 
    dh = [ 0  0 t1 l1 0;
           0 l2 t2  0 0;
          pi l3  0 d3 1;
           0  0 t3 0 0];
    %Ángulos variables de los articulares t1,t2,t3
    q =[t1 t2 d3 t3];     
  
    %Matriz transformación de cada articulación obtenido con Linktrans
    
    To =linktrans(dh(1,:),q(1));
  
    T1 =linktrans(dh(2,:),q(2));
    T2 =linktrans(dh(3,:),q(3));
    T3 =linktrans(dh(4,:),q(4));
        
    
    T01=To*T1;
    x1 = T01(1,4);
    y1 = T01(2,4);
    z1 = T01(3,4);
    line([100,x1],[100,y1+100],[z1,z1],'Color','r','LineWidth',3);
    
    
    %Marco de referencia de {2} visto desde {1}{0}
    T012=T01*T2;
    x2 = T012(1,4);
    y2 = T012(2,4);
    z2 = T012(3,4);
    line([x1,x2],[y1+100,y2+100],[600,600],'Color','g','LineWidth',3);
    
    %Marco de referencia
    T0123=T012*T3;
    x2 = T0123(1,4);
    y2 = T0123(2,4);
    z2 = T0123(3,4);
    line([x2,x2],[y2+100,y2+100],[z2+d4,z2],'Color','r','LineWidth',3);
    set(handles.text8,'string',z2);
  
    v1=T0123(1,4);
    v2=T0123(2,4);
    v3=T0123(3,4);
    set(handles.text13,'string',v1);
    set(handles.text14,'string',v2);
    set(handles.text15,'string',v3);
    

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
t1=0; t2=0; t3=45; % valores de theta 
l1=500; l2=200; 
dh = [ 0  0 t1 0 0 ;
       0 l1 t2 0 0 ;
        0 l2 t3 0 0];
stol=1e-6; ilimit=1000;
TG(:,:,1) = mTransformacion('a',0,700,0,0);
x=[700:-22.2:500];
y=[100:22.2:300];
%-x1y
x1=[500:-22.2:300];
y1=[300:-22.2:100];
%-x-y-2
x2=[300:22.2:500];
y2=[100:-22.2:-100];
%x-y-3
x3=[500:22.2:699];
x_3=[500:22.2:700];
y3=[-100:22.2:100];
for k=2:length(x)
TG(:,:,k)=mTransformacion('a',0,x(k),y(k),0);
end
for k=1:length(x1)
TG(:,:,k+10)=mTransformacion('a',0,x1(k),y1(k),0);
end
for k=1:length(x2)
TG(:,:,k+20)=mTransformacion('a',0,x2(k),y2(k),0);
end
for k=1:length(x3)
TG(:,:,k+30)=mTransformacion('a',0,x3(k),y3(k),0);
end


q0=[(t1*pi/180) (t2*pi/180) (t3*pi/180)];
M =[1 1 0 0 0 1];
q=ikine(dh,stol,ilimit,TG, q0,[1 1 0 0 0 1])
%plot(x,y,'g', tx, ty, 'g', fx, fy, 'g');
hold on
grid on 
grid minor
plotbot(dh,q,'dfw')
plot(x,y,'r*', x1, y1, 'r*', x2, y2, 'r*',x_3 , y3, 'r*');

function [T]= mTransformacion(eje,theta,x,y,z)
switch eje
    %rotación
    case 'x'
        T=[1 0 0 x; 0 cosd(theta) -sind(theta) y;0 sind(theta) cosd(theta) z;0 0 0 1 ]; 
    case 'y'
        T=[cosd(theta) 0 sind(theta) x ; 0 1 0 y; -sind(theta) 0 cosd(theta) z;0 0 0 1 ];
    case 'z'
        T=[cosd(theta) -sind(theta) 0 x ; sind(theta) cosd(theta) 0 y ; 0 0 1 z; 0 0 0 1];
    otherwise
     %El objeto no rota                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
     T=[1 0 0 x ; 0 1 0 y ; 0 0 1 z; 0 0 0 1];
    end

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
