clear all;
close all;
% Valores iniciales para el calculo:
amax= input('Introduzca la aceleraci�n m�xima (m/s^2)=');
vmax= input('Introduzca la velocidad amax (m/s)=');
rmax= input('Introduzca el desplazamiento m');
 

%calculo de los tiempos y del recorrido:
 
dt=0.01;
 
t0=0;

t1=vmax/amax;
r1=1/2*amax*t1^2;
r2=rmax-2*r1;
t2=t1+r2/vmax;
r2=r1+r2;
r0=0;
t=[t0 t1 t2]
r=[r0 r1 r2 ];
 

% definidir las condiciones iniciales
r0=0;
v0=0;
a0=amax;
r=r0;
v=v0;
a=a0;
 
% reproducci�n de trayectoria
 
k=1
 
for t=t0:dt:t1
    a=amax;
    v=v+a*dt;
    r=r+v*dt+0.5*a*dt^2;

    A(k,1)=a;
    V(k,1)=v;
    R(k,1)=r;
    T(k,1)=t;

    k=k+1;
end
 
% for t=(t1+dt):dt:t2
%     a=0;
%     v=vmax;
%     r=r+v*dt;
% 
%     A(k,1)=a;
%     V(k,1)=v;
%     R(k,1)=r;
%     T(k,1)=t;
% 
%     k=k+1;
% end
  for t=(t1+dt):dt:t2
    a=amax;
    v=v+a*dt;
    r=r+v*dt+0.5*a*dt^2;

    A(k,1)=a;
    V(k,1)=v;
    R(k,1)=r;
    T(k,1)=t;

    k=k+1;
end  

 plot(T,V,'g-')
 grid on;
 zoom on;