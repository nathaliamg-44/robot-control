%RPY2TR	Obtiene la transformaci�n homog�nea correspondiente a los �ngulos RPY dados
%
%	RPY2TR([R P Y])
%	RPY2TR(R,P,Y) devuelve la transformaci�n homog�nea que corresponde a los �ngulos RPY
%	(roll/pitch/yaw). Dichos �ngulos se le deben pasar expresados en radianes, y son los
%	�ngulos de rotaci�n en torno a los ejes X, Y y Z respectivamente.
%
%	Ver tambi�n TR2RPY, EUL2TR

%	Copyright (C) Peter Corke 1993

function r = rpy2tr(roll, pitch, yaw)

if length(roll) == 3,
   r = rotz(roll(3)) * roty(roll(2)) * rotx(roll(1));
else
   r = rotz(yaw) * roty(pitch) * rotx(roll);
end