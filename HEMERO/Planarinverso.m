function varargout = Planarinverso(varargin)
% PLANARINVERSO MATLAB code for Planarinverso.fig
%      PLANARINVERSO, by itself, creates a new PLANARINVERSO or raises the existing
%      singleton*.
%
%      H = PLANARINVERSO returns the handle to a new PLANARINVERSO or the handle to
%      the existing singleton*.
%
%      PLANARINVERSO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLANARINVERSO.M with the given input arguments.
%
%      PLANARINVERSO('Property','Value',...) creates a new PLANARINVERSO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Planarinverso_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Planarinverso_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Planarinverso

% Last Modified by GUIDE v2.5 01-Jun-2020 11:32:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Planarinverso_OpeningFcn, ...
                   'gui_OutputFcn',  @Planarinverso_OutputFcn, ...
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


% --- Executes just before Planarinverso is made visible.
function Planarinverso_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%referencia
axis([-50 500 -50 500])
hold on
grid on
linea2= line([100,200],[30,50],'Color','b','LineWidth',3);
linea1= line([0,100],[0,30],'Color','k','LineWidth',3);
plot([200,350],[50,100],'Color','r','LineWidth',3)
hold on
%Pinza
plot([350,350],[120,80],'Color','k','LineWidth',3)
hold on
plot([350,370],[120,120],'Color','b','LineWidth',3)
hold on
plot([350,370],[80,80],'Color','r','LineWidth',3)
hold on
%Articulaciones rotacionales
%Primera articulación
r=20;
t=linspace(0,2*pi,50); 
x=r*sin(t); 
y=r*cos(t);
fill(x,y,'b')
%Segunda articulación
r=20;
t=linspace(0,2*pi,50); 
x=100+r*sin(t); 
y=30+r*cos(t);
fill(x,y,'r')
%Tercera articulación
r=20;
t=linspace(0,2*pi,50); 
x=200+r*sin(t); 
y=50+r*cos(t);
fill(x,y,'k')
%linea1= line([100,100],[300,300],[0,540],'Color','k','LineWidth',3);
% varargin   command line arguments to Planarinverso (see VARARGIN)

% Choose default command line output for Planarinverso
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Planarinverso wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Planarinverso_OutputFcn(hObject, eventdata, handles) 
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
axis([-150 400 -330 230])
hold on
grid on
for i=20:100
cla    
r=rotacion(-i);
xx=r*[100;30]
xx1=r*[100;0]
linea2= line([-xx(1)-5,-xx(1)-5],[-xx(2)+0,-xx(2)+100],'Color','b','LineWidth',3);
linea1= line([0,-xx(1)-5],[0,-xx(2)+10],'Color','k','LineWidth',3);
linea3= line([-xx(1)-5,i*1.1],[-xx(2)+90,200],'Color','r','LineWidth',3);
%Pinza
linea4= line([i*1.1,i*1.1],[220,180],'Color','b','LineWidth',3);
linea5= line([i*1.1,20+i*1.1],[220,220],'Color','r','LineWidth',3);
linea6= line([i*1.1,20+i*1.1],[180,180],'Color','r','LineWidth',3);
%Articulaciones rotacionales
%Primera articulación
r=20;
t=linspace(0,2*pi,50); 
x=r*sin(t); 
y=r*cos(t);
fill(x,y,'b')
%Segunda articulación
r=20;
t=linspace(0,2*pi,50); 
x=-xx(1)-r*sin(t); 
y=-xx(2)-r*cos(t)+15;
fill(x,y,'r')
%tercera articulación
r=20;
t=linspace(0,2*pi,50); 
x=-xx(1)-5+r*sin(t); 
y=-xx(2)+90+r*cos(t);
fill(x,y,'k')
drawnow;
pause(0.01)
end
%pausa y visualizacion
for i=20:100
    plot(i,200,'*','Color','g')
    pause(0.009)
end
%segundo movimiento
for se=0:90
cla
r=rotacion(-se);
xx2=r*[-10;110]
xx5=r*[-10;200]
xx3=r*[70;100]
xx4=r*[110;200]
xx6=r*[0;200]
linea2= line([xx2(1),xx5(1)],[xx2(2),xx5(2)],'Color','b','LineWidth',3);
linea1= line([0,xx2(1)],[0,xx2(2)],'Color','k','LineWidth',3);
linea3= line([xx5(1),xx6(1)+100],[xx5(2),xx6(2)],'Color','r','LineWidth',3);
%Pinza
linea4= line([xx6(1)+100,(xx6(1)+100)],[xx6(2)+20,xx6(2)-20],'Color','b','LineWidth',3);
linea5= line([xx6(1)+100,(xx6(1)+100)+20],[xx6(2)+20,xx6(2)+20],'Color','r','LineWidth',3);
linea6= line([xx6(1)+100,(xx6(1)+100)+20],[xx6(2)-20,xx6(2)-20],'Color','r','LineWidth',3);
%Articulaciones rotacionales
%Primera articulación
r=20;
t=linspace(0,2*pi,50); 
x=r*sin(t); 
y=r*cos(t);
fill(x,y,'b')
%Segunda articulación
r=20;
t=linspace(0,2*pi,50); 
x=xx2(1)+r*sin(t); 
y=xx2(2)+10+r*cos(t);
fill(x,y,'r')
%tercera articulación
r=20;
t=linspace(0,2*pi,50); 
x=xx5(1)-5+r*sin(t); 
y=xx5(2)+r*cos(t);
fill(x,y,'k')
drawnow;
pause(0.01)
end
for q=130:300
    y=-q+310
    plot(q,y,'*','Color','g')
    pause(0.009)
end
for a=0:70
cla
r=rotacion(-a);
x1=r*[100;5]
x2=r*[200;5]
x3=r*[300;0]

linea2= line([x1(1),x2(1)],[x1(2),x2(2)],'Color','b','LineWidth',3);
linea1= line([0,x1(1)],[0,x1(2)],'Color','k','LineWidth',3);
linea3= line([x2(1),x3(1)],[,x2(2),x3(2)],'Color','r','LineWidth',3);
%Pinza
linea4= line([x3(1),x3(1)],[x3(2)+20,x3(2)-20],'Color','b','LineWidth',3);
linea5= line([x3(1),x3(1)+20],[x3(2)+20,x3(2)+20],'Color','r','LineWidth',3);
linea6= line([x3(1),x3(1)+20],[x3(2)-20,x3(2)-20],'Color','r','LineWidth',3);
%Articulaciones rotacionales
%Primera articulación
r=20;
t=linspace(0,2*pi,50); 
x=r*sin(t); 
y=r*cos(t);
fill(x,y,'b')
%Segunda articulación
r=20;
t=linspace(0,2*pi,50); 
x=x1(1)+r*sin(t); 
y=x1(2)+r*cos(t);
fill(x,y,'r')
%Tercera articulación
r=20;
t=linspace(0,2*pi,50); 
x=x2(1)+r*sin(t); 
y=x2(2)+r*cos(t);
fill(x,y,'k')
drawnow;
pause(0.01)
end
for t=0:70
    r=rotacion(-t);
    x3=r*[300;0]
    plot(x3(1),x3(2),'*','Color','g')
    pause(0.009)
end
cla
for i=20:100
    plot(i,200,'*','Color','r')
    pause(0.009)
    if i==100
           %Trayectoria rectangular
           for q=110:300
             y=-q+310
             plot(q,y,'*','Color','r')
             pause(0.009)
             if q==300
                  for t=0:70
                     r=rotacion(-t);
                     x3=r*[300;0]
                     plot(x3(1),x3(2),'*','Color','r')
                     pause(0.009)
                  end
             end
          end  
    end    
end


function R=rotacion(angulo)
R=[cosd(angulo) -sind(angulo); sind(angulo) cosd(angulo)]
