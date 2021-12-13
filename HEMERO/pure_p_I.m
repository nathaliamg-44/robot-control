%	PURE_P_I	Calcula el �ndice del punto del camino que est� m�s pr�ximo a encontrarse
%			a una distancia L del veh�culo
%
%	Esta funci�n se utiliza dentro del bloque Simulink "Pure Pursuit I".

function k = pure_p_I(u)

global K_ANT

long = (length(u)-3)/2;
x_camino = u(1:long);
y_camino = u(long+1:2*long);
x_vehiculo = u(2*long+1);
y_vehiculo = u(2*long+2);
L = u(2*long+3);
dist=sqrt( (x_camino-x_vehiculo).^2+(y_camino-y_vehiculo).^2 );
dif = abs(dist-L);
k = K_ANT;
dif_delante = dif(k:length(dif));
[z,indice] = min(dif_delante);
k = indice + k -1;
K_ANT = k;

