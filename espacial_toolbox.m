clear, clc;
%Armando el modelo virtual
a1=1; %longitud
a2=1;
d1=1;
%theta es variable la clase no le da un valor
%articulación cilindrica es Revolute
L1= Revolute('a',a1,'alpha',0, 'd',d1);%parametros de la art 1
L2= Revolute('a',a2,'alpha',pi, 'd',0);
L3= Prismatic('a',0,'alpha',0,'theta', 0,'qlim',[0.5, 2]);
L4= Revolute('a',0,'alpha', 0,'d',0);
%construir
bot=SerialLink([L1, L2, L3,L4]);

%Animar, .plot
ws=[-4,4,-4,4,-1,3];
bot.teach([0,0,1.5,0], 'workspace', ws,'noname')