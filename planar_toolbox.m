clear, clc;
%Armando el modelo virtual
a1=1; %longitud

%theta es variable la clase no le da un valor
%articulación rotacional es Revolute
L1= Revolute('a',a1,'alpha',0, 'd',0);%parametros de la art 1
L2= Revolute('a',a1,'alpha',0, 'd',0);

%construir
bot=SerialLink([L1, L2]);

%Animar, .plot
ws=[-4,4,-4,4,-1,3];
bot.teach([0,1.5], 'workspace', ws,'noname')