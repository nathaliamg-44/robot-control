%EUL2TR	Genera una transformaci�n homog�nea a partir de los �ngulos de Euler Z-Y-Z
%
%	EUL2TR([ALPHA BETA GAMMA])
%	EUL2TR(ALPHA, BETA, GAMMA)
%	Esta funci�n devuelve la transformaci�n homog�nea que corresponde a los �ngulos de
%	Euler Z-Y-Z (ALPHA, BETA, GAMMA) que se le pasan como par�metros.
%
%	Ver tambi�n RPY2TR, TR2EUL

%	Copyright (C) Peter Corke 1993

function r = eul2tr(alpha, beta, gamma)

if length(alpha) == 3,
   r = rotz(alpha(1)) * roty(alpha(2)) * rotz(alpha(3));
else
   r = rotz(alpha) * roty(beta) * rotz(gamma);
end