%GRAVITY Calcula el par correspondiente al t�rmino gravitatorio.
%
%	GRAVITY (DYN, Q)
%	GRAVITY (DYN, Q, GRAV)
%
%	Devuelve el par (vector fila TAU_G) que corresponde al t�rmino gravitatorio para el estado
%	definido por el vector fila Q de variables articulares. La matriz DYN debe contener los pa-
%	r�metros cinem�ticos y din�micos del manipulador.
%  
%	Para el caso en que Q sea una matriz, cada fila es interpretada como un vector de variables
%	articulares y el resultado (TAU_G) es una matriz que en cada fila contiene el par correspon-
%	diente.
%  
%	El par�metro GRAV debe contener el vector con la aceleraci�n de la gravedad que sufre el
%	manipulador. Si no se le da este par�metro, se asume que la aceleraci�n de la gravedad tiene
%	un valor de 9.81 m/s2, y act�a en la direcci�n y sentido del vector -Z (es decir, GRAV = 
%	[0 0 -9.81]).
%
%	Ver tambi�n CORIOLIS, DYN, INERTIA, RNE.

%	Copyright (C)	Peter Corke 1993
%						Iv�n Maza 2001

function tg = gravity(dyn, q, grav)
	dyn(:,18:20) = 0;
	if numcols(q) ~= numrows(dyn),
		error('')
	end
	if nargin == 2,
		tg = rne(dyn, q, zeros(size(q)), zeros(size(q)));
	elseif nargin == 3,
		tg = rne(dyn, q, zeros(size(q)), zeros(size(q)), grav);
	end
	