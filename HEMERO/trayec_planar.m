function varargout = trayec_planar(varargin)
% TRAYEC_PLANAR MATLAB code for trayec_planar.fig
%      TRAYEC_PLANAR, by itself, creates a new TRAYEC_PLANAR or raises the existing
%      singleton*.
%
%      H = TRAYEC_PLANAR returns the handle to a new TRAYEC_PLANAR or the handle to
%      the existing singleton*.
%
%      TRAYEC_PLANAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAYEC_PLANAR.M with the given input arguments.
%
%      TRAYEC_PLANAR('Property','Value',...) creates a new TRAYEC_PLANAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trayec_planar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trayec_planar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trayec_planar

% Last Modified by GUIDE v2.5 16-Nov-2021 11:04:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trayec_planar_OpeningFcn, ...
                   'gui_OutputFcn',  @trayec_planar_OutputFcn, ...
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


% --- Executes just before trayec_planar is made visible.
function trayec_planar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trayec_planar (see VARARGIN)

% Choose default command line output for trayec_planar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trayec_planar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trayec_planar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
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
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
delete(gca)
    h = plot(0,0)
    p = get(h,'Parent')
    xlim(p,'manual');
    xlim(p,[-30 30]) %Define el límite del eje x que se observará en la gráfica
    ylim(p,'manual');
    ylim(p,[-30 30])%Define el límite del eje y que se observará en la gráfica 
    grid on
    grid minor
    hold on
    xlabel('Eje x')
    ylabel('Eje y')
t1=0; t2=0; t3=45; % valores de theta 
l1=8; l2=11.5; l3=12.7;
dh = [ 0  0 t1 0 0 ;
           0 l1 t2 0 0 ;
           0 l2 t3 0 0 ;
           0 l3  0 0 0 ];
stol=1e-6; ilimit=1000;
%Trayectoria de arco 5 y orientacion (0rad)
% x= 0:3:28.2;
% y=ones(1, length(x))*3;
% phi=zeros(1,length(x));
% %Trayectoria de transformaciones
% for k=1:length(x)
%     TG(:,:,k)=[cos(phi(k)) -sin(phi(k)) 0 x(k);
%        sin(phi(k))  cos(phi(k)) 0 y(k);
%        0 0 1 0;
%        0 0 0 1];
%     
% end
% Calcula el modelo inverso con q0=[0 0 0] y una 
%máscara M =[1 1 0 0 0 1]
%Puntos del circulo
t=0:0.0785:pi/2;
x=7.9*cos(t); y = 7.9*sin(t)+20.3;
%
tx=[0:-0.42:-4.2];
ty=[28.2:-0.79:20.3];
fy=[20.3:-0.61:14.8];
TG(:,:,1) = mTransformacion('a',0,7.9,20.3,0);  
for k=1:length(fy)
fx(k)=-4.2;
end
for k=2:length(x)
TG(:,:,k)=mTransformacion('a',0,x(k),y(k),0);
end
TG(:,:,2) = mTransformacion('a',0,0.01,28.2,0);
for k=2:length(tx)
TG(:,:,k+20)=mTransformacion('a',0,tx(k),ty(k),0);
end
for k=2:length(fy)
TG(:,:,k+30)=mTransformacion('a',0,-4.2,fy(k),0);
end
%TG(:,:,2) = mTransformacion('a',0,0.01,28.2,0);

q0=[(t1*pi/180) (t2*pi/180) (t3*pi/180) 0];
M =[1 1 0 0 0 1];
q=ikine(dh,stol,ilimit,TG, q0,[1 1 0 0 0 0])
plot(x,y,'g', tx, ty, 'g', fx, fy, 'g');
hold on
grid on 
grid minor
plotbot(dh,q,'dfw')
plot(x,y,'g*', tx, ty, 'g*', fx, fy, 'g*');
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)



% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
