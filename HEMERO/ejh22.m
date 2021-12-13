% Ejemplo de apoyo para aprender el uso de la función FRAME

echo off
disp('Ejemplo H.2.2 de FRAME')
clear all
TA=[1 0 0 0;
   0 1 0 0 ;
   0 0 1 0;
   0 0 0 1];
TB=transl(2,4,0)*rotx(pi/6)*TA;
TC=transl(-1,-3,2)*rotz(pi/3)*TA;
frame(TA,'r',1);
frame(TB,'g',1);
frame(TC,'b',1);
axis([-2 3 -2 3 -2 3])	% Se establecen los rangos de los ejes
grid on						% Se establece una rejilla
view(180,0)				% Se establece el punto de vista
