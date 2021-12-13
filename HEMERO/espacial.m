clear, clc
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
end