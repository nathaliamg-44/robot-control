clear, clc
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

% Trayectoria de transformaciones
for k=1 :length(x)
    TG(:,:,k)= mTransformacion('a',0,x(k),y(k),0);
end
% Calcula el modelo inverso con q0=[0 0 0] y una 
% máscara M =[1 1 0 0 0 1] 
%TG(:,:,2) = mTransformacion('a',0,0.01,28.2,0);
q0=[(t1*pi/180) (t2*pi/180) (t3*pi/180) 0];
M =[1 1 0 0 0 1];
q=ikine(dh,stol,ilimit,TG, q0,[1 1 0 0 0 0])
plotbot(dh,q,'dfw')
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
end

%%60,60
%160,100
%240,200