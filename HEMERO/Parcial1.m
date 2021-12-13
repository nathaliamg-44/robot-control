% clear
% Tfi= eye(4);
% Tr= eye(4);
% T1 = mTransformacion('z',40,0,0,0);
% T2 = mTransformacion('a',0,15,0,0);
% T3 = mTransformacion('z',-40,6,0,0);
% T4 = mTransformacion('y',45,0,0,0);
% T5 = mTransformacion('z',-35,0,0,0);
% Tf=T1*T2*T3*T4*T5;
% frame(Tfi,'m',1,1)
% grid on
% hold on
% frame(Tf,'g',1,1)

syms th1 th2 th3 th4 real;       
syms l1 l4 d2 d3 real;   
 
dh = [0    0 l1 th1  0;
      pi/2 0 d2 pi/2 1;
      0    0 d3 0    1;
      0    0 l4 th4  0];
 q=[th1 th2 th3 th4];            
 T =simplify((fkine(dh,q)))  %Simple se encarga de simplificar la expresión resultante