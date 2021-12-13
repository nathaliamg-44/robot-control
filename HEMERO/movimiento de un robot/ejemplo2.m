global t1
global t2
global t3
cla

 

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
t1=get(hObject,'value')

 

xlim([-20,20]);
ylim([-20,20]);

 

% Se introduce la matriz con los par?metros de Denavit-Hartenberg
  dh=[0 0     t1 0 0;
      0 10 t2 0 0;
      0 10 t3 0 0];
  q = [t1 t2 t3];
% % 
 
 
 T0=eye(4);
 T1=linktrans(dh(1,:),t1);
T2= linktrans(dh(2,:),t2);
T3=linktrans(dh(3,:),t3);
TTtotal= T0*T1*T2*T3
% 
frame(T0,'r',1,1);
frame(T1,'y',1,1);

 

T02=T0*T1*T2;
line([0,T02(1,4)],[0,T02(2,4)]);
frame(T02,'b',1,1);

 


T03=T02*T3;
line([T02(1,4),T03(1,4)],[T02(2,4),T03(2,4)]);
frame(T03,'r',1,1);
rotate3d;
  
  