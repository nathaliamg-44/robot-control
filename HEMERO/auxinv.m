%	AUXINV	Funci�n auxiliar de los bloques Simulink que calculan los modelos
%		cinem�ticos inversos

%	Copyright (C) Iv�n Maza 2001

function phi = triaux(u)

xd = u(1);
yd = u(2);
if yd == 0
   if xd>0
      phi = pi/2;
   else
      phi = -pi/2;
   end
else
   phi = atan(-xd/yd);
end
