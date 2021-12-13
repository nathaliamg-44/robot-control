function [T]= mTransformacion(eje,theta,x,y,z)
switch eje
    %rotación
    case 'x'
        T=[1 0 0 x; 0 cosd(theta) -sind(theta) y;0 sind(theta) cosd(theta) z;0 0 0 1 ]; 
    case 'y'
        T=[cosd(theta) 0 sind(theta) x ; 0 1 0 y; -sind(theta) 0 cosd(theta) z;0 0 0 1 ];
    case 'z'
        T=[cosd(theta) -sind(theta) 0 x ; sind(theta) cosd(theta) 0 y ; 0 0 1 z; 0 0 0 1];
    otherwise
     %El objeto no rota                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
     T=[1 0 0 x ; 0 1 0 y ; 0 0 1 z; 0 0 0 1];
end





%  function [Tt]= mTransformacion(fi,theta,alfa,x,y,z)
%     %rotación en XYZ N
%     Tt=[cosd(fi)*cosd(theta) sind(alfa)*sind(fi)-cosd(fi)*sind(theta)*cos(alfa) cosd(fi)*sind(theta)*sind(alfa)+sind(fi)*cos(alfa) x ; sind(theta) cosd(theta)*cosd(alfa) -cosd(theta)*sind(alfa) y ; -sind(fi)*cosd(theta) sind(fi)*sind(theta)*cosd(alfa)+cosd(fi)*sind(alfa) cosd(fi)*cosd(alfa)-sind(fi)*sind(theta)*sind(alfa) z; 0 0 0 1];
%   
 %function [Tt]= mTransformacion(fi,theta,alfa,x,y,z)
    %rotación enn XY