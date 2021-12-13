%DIFF2TR	Convierte un vector de movimiento diferencial en la correspondiente transformaci�n
%		homog�nea
%
%	T = DIFF2TR(D)	Devuelve la transformaci�n homog�nea (T) de traslaci�n y rotaci�n diferenciales
%	que corresponde al vector de movimiento diferecial (D) que se le pasa como par�metro.
%
%	Ver tambi�n TR2DIFF

%	Copyright (C) Peter Corke 1993

function t = diff2tr(d)
	t =[	0		-d(6)	d(5)	d(1)
			d(6)	0		-d(4)	d(2)
			-d(5)	d(4)	0		d(3)
         0		0		0		0	];
