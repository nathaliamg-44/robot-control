function [T]= mRotacion(eje,theta)
switch eje
    case 'x'
        T=[1 0 0 ; 0 cosd(theta) -sind(theta) ;0 sind(theta) cosd(theta)  ];
    case 'y'
        T=[cosd(theta) 0 sind(theta) ; 0 1 0 ; -sind(theta) 0 cosd(theta) ];
    case 'z'
        T=[cosd(theta) -sind(theta) 0 ; sind(theta) cosd(theta) 0 ; 0 0 1 ];
end