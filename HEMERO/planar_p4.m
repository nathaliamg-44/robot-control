clear, clc
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