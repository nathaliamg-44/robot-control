% mdl_puma560
% p560.teach(qz)
% p560.plot (qn)
% R=p560
% L(1) = Link([0, 1, 0 , 0, 1]);
% L(2) = Link([0, 2, 0, pi/2, 0]);
% L(3) = Link([0, 1.5, 0, 0, 1]);
% L(4) = Link([0, 2, 0, -pi/2, 0]);
% q = [1, pi/3, 1, pi/4];
% robo = SerialLink(L, 'name', 'PRPR')
% W = [-3 3 -3 3 -3 3];
% robo.plot(q,'workspace', W)

L(1) = Link([0 1.2 0.3 pi/2]);
L(2) = Link([0 1.2 0.3 0]);
SerialLink(L)
R=SerialLink(L,'name', 'Puma')
R.plot([0,1])

% mdl_puma560;
% robot=p560
% N=60; % Numero de Iteraciones
% 
% z=linspace(0.432,0.482,N); % se mueve 0.05 unidades
% x=zeros(1,N);
% y=x;
% for j=1:N
% y(1,j)=-0.15;
% x(1,j)=0.452;
% end
% phi=zeros(1,N);
% for k=1:length(z)
% phik=phi(k);
% T(:,:,k)=[cos(phik) -sin(phik) 0 x(k); 
%           sin(phik) cos(phik) 0 y(k); 
%           0 0 1 z(k); 
%           0 0 0 1];
% end
% qzz=ikine(robot,T)
% plot(robot,qzz)
% 
% y=linspace(-0.15,0.05,N); % se mueve 0.20 unidades
% x=zeros(1,N);
% z=x;
% for j=1:N
% x(1,j)=0.452;
% z(1,j)=0.482;
% end
% phi=zeros(1,N);
% for k=1:length(y)
% phik=phi(k);
% T(:,:,k)=[cos(phik) -sin(phik) 0 x(k); 
%           sin(phik) cos(phik) 0 y(k); 
%           0 0 1 z(k); 
%           0 0 0 1];
% end
% qyy=ikine(robot,T)
% plot(robot,qyy)
% 
% x=linspace(0.452,0.702,N); % se mueve 0.25 unidades
% y=zeros(1,N);
% z=y;
% for j=1:N
% y(1,j)=0.05;
% z(1,j)=0.482;
% end
% phi=zeros(1,N);
% for k=1:length(x)
% phik=phi(k);
% T(:,:,k)=[cos(phik) -sin(phik) 0 x(k); 
%           sin(phik) cos(phik) 0 y(k); 
%           0 0 1 z(k); 
%           0 0 0 1];
% end
% qxx=ikine(robot,T)
% plot(robot,qxx)
% 
% y=linspace(0.05,-0.05,N); % se mueve 0.10 unidades
% x=zeros(1,N);
% z=x;
% for j=1:N
% x(1,j)=0.702;
% z(1,j)=0.482;
% end
% phi=zeros(1,N);
% for k=1:length(y)
% phik=phi(k);
% T(:,:,k)=[cos(phik) -sin(phik) 0 x(k); 
%           sin(phik) cos(phik) 0 y(k); 
%           0 0 1 z(k); 
%           0 0 0 1];
% end
% qyy=ikine(robot,T)
% plot(robot,qyy)?