% FKINE	Calcula la cinem�tica directa de un robot manipulador
%
%	FKINE(DH, Q)  calcula la cinem�tica directa de una manipulador para un
%	estado dado por el vector de variables articulares Q. Dicho manipulador
%	quedar� descrito por su matriz de par�metros de Denavit-Hartenberg (DH).
%
%	Es posible utilizar esta funci�n de dos modos:
%
%	a)	Si Q es un vector, entonces es interpretado como el vector de variables 
%		articulares para el que se pretende calcular el modelo directo, y FKINE
%		devuelve la transformaci�n homog�nea T correspondiente al �ltimo enlace
%		del manipulador. En este caso Q deber� ser un vector fila.
% 
%	b)	Si Q es una matriz, cada fila ser� interpretada como un vector de varia-
%		bles articulares, y T ser� una matriz tridimensional 4x4xm, siendo m el
%		n�mero de filas de Q. T es lo que se denominar� una trayectoria de trans-
%		formaciones homog�neas.
%		Para extraer la transformaci�n homog�nea (Ti) que hay "condensada" en la
%		fila i-�sima de la matriz T, bastar� con escribir:
%
%                            TI = T(:,:,i)
%
%	Empleando la funci�n FKINE seg�n este �ltimo modo, es posible obtener todas
%	las transformaciones homog�neas correspondientes a una trayectoria dada en 
%	el espacio de variables articulares.
%
%	Ver tambi�n DH, LINKTRANS.

%	Copyright (C)	Peter Corke 1999
%						Iv�n Maza 1999                      

function t = fkine(dh, q)
   
   n = numrows(dh);
	if numcols(q) ~= n,
		error('datos err�neos')
	end
	
	if numrows(q) == 1, % si q es solamente un vector fila
		t = eye(4,4);
		for i=1:n,
         t = t * linktrans(dh(i,:), q(i));
		end
	else
		k=1;
		for qv=q',		% para cada punto de la trayectoria dada en variables articulares
			tt = eye(4,4);
			for i=1:n,
            tt = tt * linktrans(dh(i,:), qv(i));
         end
         t(:,:,k) = tt;
         k=k+1;
		end
	end
