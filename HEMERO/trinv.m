%TRINV	Transformacion inversa de una dada
%
%	TRINV(T) devuelve la transformaci�n inversa de la transformaci�n T que se le
%	pasa como par�metro
%

% 	Copyright (C) Iv�n Maza 2001

function Ti = trinv(T)
	R=T(1:3,1:3);
	P=T(1:3,4);
	Ti=[R' -R'*P
	    0 0 0 1];	