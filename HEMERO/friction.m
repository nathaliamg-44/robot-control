%FRICTION Calcula el par correspondiente a las fricciones seg�n un cierto modelo.
%
%	TAU = FRICTION(DYN, QD)
%
%	Devuelve el par (vector fila TAU_F) que corresponde a las fricciones que sufren las articu-
%	laciones para las velocidades articulares contenidas en el vector QD. En la matriz DYN est�n
%	los par�metros necesarios:
%
%		17	G		Velocidad de la articulaci�n / velocidad del enlace
%		18	B		Fricci�n viscosa, referida al motor
%		19	Tc+		Fricci�n de Coulomb (rotaci�n positiva), referida al motor
%		20	Tc-		Fricci�n de Coulomb (rotaci�n negativa), referida al motor
%  
%	para calcular las fricciones seg�n el siguiente modelo:
%
%			B�q'+Tc+,  si q'>0
%			B�q'+Tc-,  si q'<0
%
%	Ver tambi�n CORIOLIS, DYN, GRAVITY, RNE.

%	Copyright (C)	1994 Peter I. Corke
%						2001 Iv�n Maza

function  tau = friction(dyn, qd)
	[n,nc] = size(dyn);
	if nc < 18
		error('no hay par�metros de fricci�n');
	end
	if numcols(qd) ~= n
		error('datos err�neos');
	end
	
	b = dyn(:,18);
	if nc >= 19,
		tcp = dyn(:,19);
		if nc >= 20,
			tcm = dyn(:,20);
		else
			tcm = -tcp;
		end
	else
		tcp = zeros(size(b));
		tcm = tcp;
	end
	% referimos los valores de fricci�n al enlace
	b = b.*(dyn(:,17).^2);
	tcp = tcp.*dyn(:,17);
	tcm = tcm.*dyn(:,17);
	
	tau = qd*diag(b) + (qd>0)*diag(tcp) + (qd<0)*diag(tcm);