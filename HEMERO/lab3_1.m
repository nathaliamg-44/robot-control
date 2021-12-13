function varargout = lab3_1(varargin)
% LAB3_1 MATLAB code for lab3_1.fig
%      LAB3_1, by itself, creates a new LAB3_1 or raises the existing
%      singleton*.
%
%      H = LAB3_1 returns the handle to a new LAB3_1 or the handle to
%      the existing singleton*.
%
%      LAB3_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB3_1.M with the given input arguments.
%
%      LAB3_1('Property','Value',...) creates a new LAB3_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab3_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab3_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab3_1

% Last Modified by GUIDE v2.5 11-Nov-2021 09:45:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab3_1_OpeningFcn, ...
                   'gui_OutputFcn',  @lab3_1_OutputFcn, ...
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


% --- Executes just before lab3_1 is made visible.
function lab3_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab3_1 (see VARARGIN)

% Choose default command line output for lab3_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab3_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab3_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    delete(gca)
    h = plot(0,0)
    p = get(h,'Parent')
    xlim(p,'manual');
    xlim(p,[-100 400]) %Define el límite del eje x que se observará en la gráfica
    ylim(p,'manual');
    ylim(p,[-100 400])%Define el límite del eje y que se observará en la gráfica 
    grid on
    grid minor
    hold on
    xlabel('Eje x')
    ylabel('Eje y')
    
    radio = 20;
    
    %Articulación rotacional 1
    viscircles([0 0],radio,'Color','r');
       %Eslabón 1
       line([0,60],[0,60],'Color','r','LineWidth',5);
       
    %Articulación rotacional 2
    viscircles([60 60],radio,'Color','r')
      %Eslabón 2
      line([60,160],[60,100],'Color','r','LineWidth',5);
    
    %Articulación rotacional 3
    viscircles([160 100],radio,'Color','r')
      %Eslabón 1
      line([160,240],[100,200],'Color','r','LineWidth',5);
    
    %Articulación rotacional 4
    viscircles([240 200],radio,'Color','r')
    
    %Marcos de referencia
    
    line([0,-60],[0,60],'Color','m','LineWidth',1);
    line([0,60],[0,60],'Color','g','LineWidth',1);
    
    line([60,160],[60,100],'Color','g','LineWidth',1);
    line([60,10],[60,160],'Color','m','LineWidth',1);
    
    line([160,240],[100,200],'Color','g','LineWidth',1);
    line([160,80],[100,180],'Color','m','LineWidth',1);

    line([240,300],[200,240],'Color','g','LineWidth',1);
    line([240,200],[200,260],'Color','m','LineWidth',1);
    
    
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
t1=35; t2=35; t3=-35; % valores de theta 
l1=80; l2=115; l3=127;
dh = [ 0  0 t1 0 0 ;
           0 l1 t2 0 0 ;
           0 l2 t3 0 0 ;
           0 l3  0 0 0 ];
stol=1e-6; ilimit=1000;
%Trayectoria de arco 5 y orientacion (0rad)
x= [0:4.1:250];
y= [30:2.83:200];
for k=1 :length(x)
    TG(:,:,k)= mTransformacion('a',0,x(k),y(k),0);
end
q0=[(t1*pi/180) (t2*pi/180) (t3*pi/180) 0];
M =[1 1 0 0 0 1];
q=ikine(dh,stol,ilimit,TG, q0,[1 1 0 0 0 0])
plotbot(dh,q,'dfw')

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
