%ACCEL	Calcula las aceleraciones articulares resultantes de aplicar unos determinados
%     	pares a las articulaciones del manipulador
%
%	QDD = ACCEL(DYN, Q, QD, TORQUE, GRAV) devuelve un vector columna con
%	las aceleraciones articulares que resultan de aplicar al manipulador los pares
%	contenidos en el vector TORQUE.
%
%	Utiliza el m�todo 1 de Walker y Orin para calcular la din�mica del manipulador. Este
%	m�todo es �til para la simulaci�n de la din�mica del manipulador, en conjunci�n con
%	una funci�n num�rica de integraci�n.
%
%	Con el vector columna GRAV se especifica la aceleracion de la gravedad que sufre el
%	manipulador (por defecto se toma 9.81 m/s2 en direcci�n -Z, es decir GRAV=[0 0 -9.81]).
%
%	Ver tambi�n RNE, DYN, ODE45.

%  Copyright (C)	1999 Peter Corke
%						2001 Iv�n Maza

function qdd = accel(dyn, q, qd, torque, grav)
	q = q(:)';
	qd = qd(:)';
	M = inertia(dyn, q);	% C�lculo de la matriz de masas
   tau = rne(dyn, q, qd, zeros(size(q)), grav);	% 	C�lculo de los t�rminos centr�fugos y de Coriolis, 
																%	gravitatorios y de fricci�n.
	qdd = inv(M) * (torque(:) - tau');
