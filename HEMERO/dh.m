% DH	Representaci�n matricial de la cinem�tica del manipulador
%
%	Cada vez que se quiera utilizar una funci�n de HEMERO relacionada con la cinem�tica
%	se deber�n introducir en una matriz los par�metros de Denavit-Hartenberg del manipula-
%	dor, de acuerdo con la notaci�n de Craig (1986). El modo de introducir dicha informa-
%	ci�n en esa matriz es el siguiente:
%
%	-	Habr� una fila por cada enlace que tenga el manipulador.
%
%	-	Cada fila tendr� el siguiente formato:
%
%			[alpha(i-1) a(i-1) theta(i) d(i) sigma(i)]
%    
%		donde:
%		-	alpha(i-1), a(i-1), theta(i), d(i) son los par�metros de Denavit-Hartenberg
%			seg�n Craig (1986).
%		-	sigma(i) indicar� el tipo de articulaci�n (ser� 0 si es de rotaci�n y un n�mero
%			distinto de cero si por el contrario es prism�tica).
%
%	As� pues para un robot con n enlaces, la matriz ser�a de dimensiones nx5.
%
%	Todos los �ngulos deber�n ser introducidos en radianes. Las longitudes a(i-1) y d(i)
%	podr�n ser expresadas en cualquier unidad y s�lo habr� que tener cuidado de recordar
%	que las transformaciones homog�neas y los Jacobianos que se calculen aparecer�n en 
%	esas mismas unidades.

%	Copyright (C) Peter Corke 1993
