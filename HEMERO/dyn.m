%DYN	Contiene los par�metros cinem�ticos y din�micos del manipulador.
%
%	Cada vez que se quiera utilizar una funci�n de HEMERO relacionada con la din�mica
%	ser� necesario introducir en una matriz los par�metros de Denavit-Hartenberg del
%	manipulador, junto con ciertos par�metros din�micos. El modo de introducir esta
%	informaci�n en dicha matriz (a la que se denominar� gen�ricamente DYN) es el
%	siguiente:
%
%	* Habr� una fila por cada enlace que tenga el manipulador.
%	* Cada fila tendr� el siguiente formato:
%  
%		1	alpha(i-1)	Par�metros de Denavit-Hartenberg	
%		2	a(i-1)		
%		3	theta(i)	
%		4	d(i)	
%		5	sigma(i)	Tipo de articulaci�n; 0 si es de rotaci�n y 1 si es prism�tica 
%		6	masa		Masa del enlace i
%		7	rx		Centro de masas del enlace respecto al cuadro de referencia de dicho enlace
%		8	ry
%		9	rz
%		10	Ixx		Elementos del tensor de inercia referido al centro de masas del enlace
%		11	Iyy
%		12	Izz
%		13	Ixy
%		14	Iyz
%		15	Ixz
%		16	Jm		Inercia de la armadura	          
%		17	G		Velocidad de la articulaci�n / velocidad del enlace
%		18	B		Fricci�n viscosa, referida al motor
%		19	Tc+		Fricci�n de Coulomb (rotaci�n positiva), referida al motor
%		20	Tc-		Fricci�n de Coulomb (rotaci�n negativa), referida al motor
%
%	As� pues para un robot con n enlaces, la matriz DYN tendr�a dimensiones nx20.
%
%	Todos los �ngulos deber�n ser introducidos en radianes. El resto de par�metros
%	de la matriz podr�n tener las unidades que se deseen, siempre que se sea cohe-
%	rente en el uso de dichas unidades. Es decir que si se introducen las masas en
%	Kg y los centros de masas en metros, al escribir el tensor de inercia se deber�
%	expresar en Kg m2.
%
%	Ver tambi�n DH.

%	Copyright (C) Peter Corke 1993
