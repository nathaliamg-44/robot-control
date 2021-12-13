% IKINE	Calcula la cinem�tica inversa del manipulador
%
%	Q = IKINE(DH, STOL, ILIMIT, T)
%	Q = IKINE(DH, STOL, ILIMIT, T, Q0)
%	Q = IKINE(DH, STOL, ILIMIT, T, Q0, M)
%
%	Devuelve los valores de las variables articulares necesarios para que el efector
%	final del manipulador tenga la posici�n y orientaci�n dadas por la transformaci�n
%	T. La soluci�n del problema cinem�tico inverso no es �nica en general, y es posi-
%	ble que para una misma orientaci�n y posici�n deseadas, se obtengan soluciones dis-
%	tintas en funci�n del vector inicial de variables articulares (Q0) que se le pase
%	a IKINE.
%
%	Es posible usar la funci�n para que devuelva las variables articulares correspon-
%	dientes a una s�la posici�n y orientaci�n, o bien a una trayectoria de posiciones
%	y orientaciones. Eso depender� del formato del par�metro T:
%
%	-	Si T es una transformaci�n homog�nea, entonces IKINE devuelve un vector
%		fila(Q) con las variables articulares correspondientes a la posici�n y
%		orientaci�n indicadas en la matriz T.
%
%	-	Si T es una trayectoria de transformaciones homog�neas, entonces el re-
%		sultado ser� una matriz (Q), en la que la fila i-�sima contendr� las va-
%		riables articulares correspondientes a la transformaci�n T (:, :, i ).
%		La estimaci�n inicial para Q en cada paso se toma de la soluci�n obtenida
%		en el paso anterior.
%
%	Sea cual sea el formato de T, la estimaci�n inicial para el vector de variables
%	articulares ser� la dada en el par�metro Q0 (puede ser una columna o una fila), y
%	en el caso de que no se lo demos, asume que es el vector nulo. 
%
%	Para el caso de un manipulador con menos de 6 grados de libertad el efector final
%	no podr� alcanzar algunas posiciones y orientaciones. Esto normalmente lleva a una
%	no convergencia de IKINE. Una soluci�n consiste en especificar un vector (fila o
%	columna) de pesos (M), cuyos elementos ser�n 0 para aquellos grados de libertad que
%	en cartesianas est�n restringidos, y 1 en otro caso. Los elementos de M se corres-
%	ponden con las traslaciones a lo largo de los ejes X, Y y Z, y con las rotaciones en
%	torno a los ejes X, Y y Z. 
%	Por ejemplo si el manipulador no se puede desplazar a lo largo del eje Z, ni rotar en 
%	torno a los ejes X e Y, M deber� ser el vector [1 1 0 0 0 1].
%	El n�mero de elementos no nulos debe ser igual al n�mero de grados de libertad del ro-
%	bot.
%
%	ILIMIT es el n�mero m�ximo de iteraciones que se ejecutar�n en busca de una soluci�n 
%	(un valor usual es 1000).
% 
%	STOL ser� la m�xima diferencia que se admitir� entre la transformaci�n correspondiente
%	a las variables articulares soluci�n y la transformaci�n con la posici�n y orientaci�n
%	especificadas (un valor usual es 1e-6). Dicha diferencia se mide haciendo uso de la 
%	funci�n TR2DIFF.
%
%	Ver tambi�n FKINE, JACOB0, TR2DIFF.
	
%  Copyright (C)	1999 Peter Corke
%						2001 Iv�n Maza


function qt = ikine(dh, stol, ilimit, tr, q, m)

	n = numrows(dh);

	if nargin == 4,
		q = zeros(n, 1);
	else
		q = q(:);
	end
	if nargin == 6,
		m = m(:);
      if numrows(m) ~= 6 
         error('El vector m�scara debe tener 6 elementos')
		end
	else
      if numrows(dh) < 6,
         disp('Para un manipulador con menos de 6 DOF se debe pasar como par�metro un vector m�scara');
		end
		m = ones(6, 1);
	end
		

	tcount = 0;
	if ishomog(tr),		% Caso de que se especifique una s�la transformaci�n
		nm = 1;
		count = 0;
		while nm > stol,
			e = tr2diff(fkine(dh, q'), tr) .* m;
			dq = pinv( jacob0(dh, q') )*e;
         q = q + dq;                 
			nm = norm(dq);
			count = count+1;
         if count > ilimit,
            error('Parece que no hay convergencia')
			end
		end
		qt = q';
	else			% Caso de que se trate de una trayectoria de transformaciones
      np = size(tr,3);
      qt=[];
		for i=1:np,
			nm = 1;
         T = tr(:,:,i);
			count = 0;
			while nm > stol,
				e = tr2diff(fkine(dh, q'), T) .* m;
            dq = pinv( jacob0(dh, q') ) * e;
            q = q + dq;
				nm = norm(dq);
				count = count+1;
            if count > ilimit,
         		error('Parece que no hay convergencia')
				end
			end
			qt = [qt; q'];
			tcount = tcount + count;
		end
	end
