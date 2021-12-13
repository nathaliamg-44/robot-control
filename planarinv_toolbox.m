clear, clc, close;
%Armando el modelo virtual
%a1=1; %longitud
prm = param();
%theta es variable la clase no le da un valor
%articulación cilindrica es Revolute
L1= Revolute('a',prm.a1,'alpha',0, 'd',0);%parametros de la art 1
L2= Revolute('a',prm.a1,'alpha',0, 'd',0);

%construir
bot=SerialLink([L1, L2]);

%Animar, .plot
home = [0, 0];
ws=[-3,3,-3,3,-1,3];
bot.plot(home,'workspace',ws,'noname')

while true
    P=input('Ingrese un vector de la posición deseada [x,y,z] : ');
    plot_sphere(P,20, 'y');  
    input('Presiona una tecla para mover el robot');
    bot.plot(invkin(P(1),P(2),P(3)));
    end 
%inversa

function k = invkin(x,y,z)
    prm=param();
    D= (x^2+y^2-prm.a1^2-prm.a1^2)/(2*prm.a1*prm.a1);
    q2=atan2(sqrt(1-D^2),D);
    q1=atan2(y,x)-atan2(prm.a1*sin(q2),prm.a1+prm.a1*cos(q2));
    k= [q1 ,q2]
    
end


function g = param(name, value)
    persistent buff;
    %Iniciar
    if isempty(buff)
        buff.a1=1;
    end
    %Sobreescribir valres
    if nargin>0
        buff.(name)=value;
    end
    g=buff;
end