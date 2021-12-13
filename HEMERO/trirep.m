% TRIREP Funci�n que permite representar gr�ficamente el modelo del triciclo cl�sico
%
%	TRIREP(X,Y,PHI,ALPHA,COLOR,B,L,C,NP,OPT)
%
%	Esta funci�n se encarga de generar una representaci�n gr�fica simple del triciclo cl�sico a partir
%	de las coordenadas del centro de guiado (X,Y), de la orientaci�n del veh�culo (PHI) y de la orien-
%	taci�n de la rueda delantera del veh�culo (ALPHA). Los valores de X, Y, PHI y ALPHA pueden ser
%	vectores, en cuyo caso se representar�n tantos puntos de la trayectoria como indique el par�metro
%	NP. En este caso, es posible especificar que aparezcan simult�neamente todas esas representaciones
%	en pantalla dando un valor cualquiera al par�metro OPT. Si no se introduce dicho par�metro, las
%	representaciones aparecen y desaparecen sucesivamente, y al final solamente queda la �ltima en
%	pantalla.
%
%	Las dimensiones de la representaci�n gr�fica vienen determinadas por los siguientes par�metros:
%	-	B: es la separaci�n entre las dos ruedas traseras.
%	-	L: es la separaci�n entre la rueda delantera y las traseras.
%	-	C: es el radio de las ruedas.
%
%	El color de la representaci�n se especifica mediante el par�metro COLOR

%	Copyright (C) Iv�n Maza 2001

function h = trirep(x, y, phi, alpha, color, a, l, c, np, opt)

hdl(1) = patch; hdl(2) = patch;
puntos = length(x);
w = a/4;

% Se especifica la geometr�a de las ruedas traseras y la transmisi�n
datosx1=[-a-w/2	-a+w/2	-a+w/2	-w/4	-w/4	w/4	w/4	a-w/2	a-w/2	a+w/2	a+w/2	a-w/2	a-w/2	-a+w/2  -a+w/2	-a-w/2];
datosy1=[c			c			c/16		c/16	l		l		c/16	c/16	c		c		-c		-c		-c/16	-c/16	  -c		-c];
datosz1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
unos1=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
link1=[datosx1;datosy1;datosz1;unos1];
lfs1=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];

% Se especifica la geometr�a de la rueda delantera
datosx2=[-w/2	w/2	w/2	-w/2];
datosy2=[c		c		-c		-c];
datosz2=[0 0 0 0];
unos2=[1 1 1 1];
link2=[datosx2;datosy2;datosz2;unos2];
lfs2=[1 2 3 4];


step = floor(puntos/np);
if (step==0)
   error('No hay suficientes datos para generar ese n�mero de puntos');
end

for (k=1:step:step*np)
   % Se le da la orientaci�n correcta al veh�culo
   T1 = transl(x(k),y(k),0)*rotz(phi(k));   
   li1=T1*link1;
   % Se le da la orientaci�n adecuada a la rueda delantera
   T2 = transl([-l*sin(phi(k)) l*cos(phi(k)) 0])*transl(x(k),y(k),0)*rotz(alpha(k))*rotz(phi(k));
	li2=T2*link2;   
	if (nargin==10)
		erasemode='none';
		% Se dibujan todas las representaciones juntas
		set(hdl(1),'faces',lfs1,'vertices',[li1(1,:)' li1(2,:)' li1(3,:)'],'FaceColor',color,'erasemode',erasemode);
		set(hdl(2),'faces',lfs2,'vertices',[li2(1,:)' li2(2,:)' li2(3,:)'],'FaceColor',color,'erasemode',erasemode);
		patch('faces',lfs1,'vertices',[li1(1,:)' li1(2,:)' li1(3,:)'],'FaceColor',color,'erasemode',erasemode);
		patch('faces',lfs2,'vertices',[li2(1,:)' li2(2,:)' li2(3,:)'],'FaceColor',color,'erasemode',erasemode);
	else
   	erasemode='normal';
   	% Se dibujan las representaciones secuencialmente
   	set(hdl(1),'faces',lfs1,'vertices',[li1(1,:)' li1(2,:)' li1(3,:)'],'FaceColor',color,'erasemode',erasemode);
   	set(hdl(2),'faces',lfs2,'vertices',[li2(1,:)' li2(2,:)' li2(3,:)'],'FaceColor',color,'erasemode',erasemode);
	end
end
   
h=hdl;