%	PARAB	Calcula las trayectorias articulares resultantes de emplear funciones lineales
%		con enlace parab�lico
%
%	[QCOEF,TIME,Q_T,QD_T,QDD_T,INTERVS] = PARAB (Q,AC,T0,TIJ,STEP)
%
%	Los par�metros de la funci�n son:
%
%	- Q:	matriz con tantas filas como articulaciones, que contiene en cada columna las
%		posiciones articulares deseadas para el punto inicial,los puntos de paso y el
%		punto final.
%	- AC:	matriz con tantas filas como articulaciones, que contiene en cada columna los
%		m�dulos de las aceleraciones articulares deseados para el punto inicial,los
%		puntos de paso y el punto final.
%	- T0:	par�metro que contiene el instante inicial
%	- TIJ:	Vector que contiene la duraci�n de los intervalos entre puntos.
%	- STEP:	Paso con el que se calculan la posici�n, velocidad y aceleraci�n resultantes.
%
%	Esta funci�n devuelve:
%
%	- QCOEF		matriz de tres dimensiones, que contiene en cada fila los coeficientes
%			de los polinomios de orden dos, que son soluci�n para cada una de las
%			variables articulares. La primera columna se corresponde con la potencia
%			cuadr�tica y la �ltima con el t�rmino independiente. Para los tramos
%			lineales, el t�rmino cuadr�tico es nulo. El tercer �ndice de la matriz
%			hace referencia a la articulaci�n a la que le corresponden los coefi-
%			cientes.
%	- TIME		vector tiempo con los instantes para los que se calculan las matrices
%			Q_T, QD_T y QDD_T que contienen los valores de la posici�n, velocidad
%			y aceleraci�n articular resultantes.
%	- Q_T		matriz que contiene en cada fila los valores de posici�n correspondientes
%			a cada articulaci�n.
%	- QD_T		matriz que contiene en cada fila los valores de velocidad correspondientes
%			a cada articulaci�n.
%	- QDD_T		matriz que contiene en cada fila los valores de aceleraci�n correspondientes
%			a cada articulaci�n.
%	- INTERVS	matriz que contiene en cada fila las duraciones de los tramos parab�licos
%			y lineales para cada articulaci�n.

%	Copyright (C) Iv�n Maza 2001


function [Qcoef,time,q_t,qd_t,qdd_t,intervs] = parab(q,ac,t0,tij,step)

l = length(tij);
[h,n] = size(q);
[o,m] = size(ac);
if (n~=m) | (o~=h)
   error('Las dimensiones de las matrices de especificaci�n de posici�n y aceleraci�n deben ser id�nticas')
end
if (l~=n-1)
   error('La dimensi�n del vector con la duraci�n de los intervalos no es correcta')
end

for w=1:h
	qaux = q(w,:);
	acaux = ac(w,:);
	[tp,tl,vl,a] = parabaux(qaux,acaux,tij);
	intervaux=[];
	for x=1:1:(n-1)
   	intervaux = [intervaux tp(x) tl(x)];
	end
   intervaux = [intervaux tp(x+1)];
   intervs(w,:) = intervaux;
	t = t0;
	tfinal = t0 + sum (tij);
	time = t0:step:tfinal;
	pal1 = a(1)/2;
	pal2 = vl(1)-a(1)*(t0+intervaux(1));
	pal3 = qaux(1) - pal2*t0 - pal1*t0^2;
	Qcoef(1,:,w) = [pal1 pal2 pal3]; 
   
   k = 1;
	qt = [];
	qdt = [];
	qddt = [];

	while (time(k)<t+intervaux(1))
   	qt(k) = sum(Qcoef(1,:,w).*[time(k)^2 time(k) 1]);
   	qdt(k) = sum(Qcoef(1,:,w).*[time(k)*2 1 0]);
   	qddt(k) = sum(Qcoef(1,:,w).*[2 0 0]);
   	k = k+1;
	end

	t = t + intervaux(1);
	aux = sum(Qcoef(1,:,w).*[t^2 t 1]);

	if (n>2)
   	for i=2:2:2*n-4
      	lin1 = 0;
      	lin2 = vl(i/2);
      	lin3 = aux - lin2*t;
      	Qcoef(i,:,w) = [lin1 lin2 lin3];
      	while (time(k)<t+intervaux(i))
         	qt(k) = sum(Qcoef(i,:,w).*[time(k)^2 time(k) 1]);
         	qdt(k) = sum(Qcoef(i,:,w).*[time(k)*2 1 0]);
         	qddt(k) = sum(Qcoef(i,:,w).*[2 0 0]);
         	k = k+1;
      	end   
      	t = t + intervaux(i);
         aux = sum(Qcoef(i,:,w).*[t^2 t 1]);
         
      	pal1 = a(i/2+1)/2;
      	pal2 = vl(i/2) - a(i/2+1)*t;
      	pal3 = aux - pal2*t-pal1*t^2;
      	Qcoef(i+1,:,w) = [pal1 pal2 pal3];   
      	while (time(k)<t+intervaux(i+1))
         	qt(k) = sum(Qcoef(i+1,:,w).*[time(k)^2 time(k) 1]);
         	qdt(k) = sum(Qcoef(i+1,:,w).*[time(k)*2 1 0]);
         	qddt(k) = sum(Qcoef(i+1,:,w).*[2 0 0]);      
         	k = k+1;
      	end
      	t = t + intervaux(i+1);
      	aux = sum(Qcoef(i+1,:,w).*[t^2 t 1]);
      
   	end
	else
   	i = 0;
	end


	i = i+2;

	lin1 = 0;
	lin2 = vl(i/2);
	lin3 = aux - lin2*t;
	Qcoef(i,:,w) = [lin1 lin2 lin3];
	while (time(k)<t+intervaux(i))
   	qt(k) = sum(Qcoef(i,:,w).*[time(k)^2 time(k) 1]);
   	qdt(k) = sum(Qcoef(i,:,w).*[time(k)*2 1 0]);
   	qddt(k) = sum(Qcoef(i,:,w).*[2 0 0]);   
   	k = k+1;
	end   
	t = t + intervaux(i);
	aux = sum(Qcoef(i,:,w).*[t^2 t 1]);

	pal1 = a(i/2+1)/2;
	pal2 = vl(i/2) - a(i/2+1)*t;
	pal3 = qaux(i/2+1)-pal2*(t+intervaux(i+1))-pal1*(t+intervaux(i+1))^2;
	Qcoef(i+1,:,w) = [pal1 pal2 pal3];

	while (time(k)<t+intervaux(i+1))
   	qt(k) = sum(Qcoef(i+1,:,w).*[time(k)^2 time(k) 1]);
   	qdt(k) = sum(Qcoef(i+1,:,w).*[time(k)*2 1 0]);
   	qddt(k) = sum(Qcoef(i+1,:,w).*[2 0 0]);   
   	k = k+1;
	end

	qt(k) = sum(Qcoef(i+1,:,w).*[time(k)^2 time(k) 1]);
	qdt(k) = sum(Qcoef(i+1,:,w).*[time(k)*2 1 0]);
   qddt(k) = sum(Qcoef(i+1,:,w).*[2 0 0]);
   
   q_t(w,:) = qt;
   qd_t(w,:) = qdt;
   qdd_t(w,:) = qddt;
end



