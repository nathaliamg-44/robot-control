%JACOBN	Calcula el Jacobiano expresado en el sistema de coordenadas del efector final
%
%	JACOBN(DH, Q) devuelve el Jacobiano expresado en el sistema de referencia del 
%	efector final que corresponde a los valores de las variables articulares con-
%	tenidos en Q.
%
%	La matriz Jacobiana permite obtener el vector de velocidades en el espacio car-
%	tesiano (V) del efector final expresado en el cuadro {n} (asociado al efector 
%	final) a partir de las derivadas de las variables articulares en virtud de la 
%	expresi�n:
%
%                        V = J dQ
%
%	El vector de velocidades (V) est� formado por las velocidades lineales a lo largo
%	de los ejes X, Y y Z, y por las velocidades angulares de giro en torno a los ejes
%	X, Y y Z, expresadas ambas en el cuadro {n}.
%	As� pues, si el manipulador tiene menos de seis grados de libertad en el Jacobiano
%	aparecer�n filas de ceros. En concreto se puede establecer la siguiente correspon-
%	dencia:
%
%               Fila nula                  No es posible
%                   1              Traslaci�n a lo largo del eje X
%                   2              Traslaci�n a lo largo del eje Y
%                   3              Traslaci�n a lo largo del eje Z
%                   4                 Rotaci�n en torno al eje X
%                   5                 Rotaci�n en torno al eje Y
%                   6                 Rotaci�n en torno al eje Z
%
%	Para un manipulador un n articulaciones, el Jacobiano es una matriz 6xn.
%
%	Ver tambi�n JACOB0, TR2DIFF

%  Copyright (C)	Peter Corke 1999
%						Iv�n Maza 2001

function J = jacobn(dh, q)
	J = [];
	n = numrows(dh);
	
	T = eye(4,4);
   for i=n-1:-1:1,
      T = linktrans(dh(i+1,:), q(i+1)) * T;
      if dh(i,5) == 0,
         % articulaci�n de rotaci�n
         d = [-T(1,1)*T(2,4)+T(2,1)*T(1,4)
              -T(1,2)*T(2,4)+T(2,2)*T(1,4)
              -T(1,3)*T(2,4)+T(2,3)*T(1,4)];
         delta = T(3,1:3)';	% nz oz az
      else
         % articulaci�n prism�tica
         d = T(3,1:3)';		% nz oz az
         delta = zeros(3,1);	%  0  0  0
      end
      J = [[d; delta] J];
   end
   
   if dh(n,5) == 0,
      % articulaci�n de rotaci�n
      d = zeros(3,1);         %  0  0  0
      delta = [0 0 1]';       %  0  0  1
   else
      % articulaci�n prism�tica
      d = [0 0 1]';           %  0  0  1 
      delta = zeros(3,1);     %  0  0  0
   end
   J = [J [d; delta]];

