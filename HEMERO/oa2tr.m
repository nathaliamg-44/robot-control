%OA2TR	Construye una transformaci�n homog�nea a partir de los vectores o y a
%
%	OA2TR(O, A) Devuelve la transformaci�n homog�nea de rotaci�n correspondiente a los
%	vectores de orientaci�n (O) y aproximaci�n (A), que le pasamos como par�metros.
%
%	Ver tambi�n RPY2TR, EUL2TR

%	Copyright (C) 1993 Peter Corke

function r = oa2tr(o, a)

n = cross(o, a);
r = [unit(n(:)) unit(o(:)) unit(a(:)) zeros(3,1); 0 0 0 1];