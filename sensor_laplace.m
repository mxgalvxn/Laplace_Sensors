clear m;
clc;
clear;
m = mobiledev("monsorrot.cpp");
m.Logging = 1;
disp(m)
pause(30);

%Obtencion de datos
[ac,ta] = accellog(m);
[ang,tav] = angvellog(m);
[ma,tam] = magfieldlog(m);
[or, to] = orientlog(m);
[lat, lon, timestamp, speed, course, alt, horizacc] = poslog(m);

%Grafica de Aceleracion
set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(1)
hold on
plot(ta,ac)
title('Aceleración vs tiempo')
xlabel('Tiempo')
ylabel('Aceleración')
hold off

% Separacion de coordenadas
szac = size(ac);
acx = ac(1:szac(1),1);
acy = ac(1:szac(1),2);
acz = ac(1:szac(1),3);


set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(2)
hold on
view(30,30)
plot3(acx,acy,acz)
title('Componentes 3D de la Aceleración')
xlabel('x')
ylabel('y')
zlabel('z')
hold off

%Aplicacion de fourier y sus filtros
Fs = 1000;            % Sampling frequency    
FT = 20;
fourierac = fft(ac);
figure
bandpass(fourierac,[1 FT],Fs)
 

%Grafica de Velocidad Angular

set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(4)
hold on
plot(tav,ang);
title('Velocidad ángular vs tiempo')
xlabel('Tiempo')
ylabel('Velocidad angular')
hold off

% Separacion de coordenadas
szang = size(ang);
angx = ang(1:szang(1),1);
angy = ang(1:szang(1),2);
angz = ang(1:szang(1),3);

set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(5)
hold on
view(30,30)
plot3(angx,angy,angz)
title('Componentes 3D de la Velocidad Angular')
xlabel('x')
ylabel('y')
zlabel('z')
hold off


%Aplicacion de fourier y sus filtros
fourierang = fft(ang);
figure
bandpass(fourierang,[1 FT],Fs)


% Grafica de Orientacion

set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(7)
hold on
plot(to,or);
title('Orientación vs tiempo')
xlabel('Tiempo')
ylabel('Orientación')
hold off

% Separacion de coordenadas
szor = size(or);
orx = or(1:szor(1),1);
ory = or(1:szor(1),2);
orz = or(1:szor(1),3);

set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(8)
hold on
view(30,30)
plot3(orx, ory, orz)
title('Componentes 3D de la Orientacion')
xlabel('x')
ylabel('y')
zlabel('z')
hold off
             

%Aplicacion de fourier y sus filtros
fourieror = fft(or);
figure
bandpass(fourieror,[1 FT],Fs)


% Grafica de Campo Magnetico

set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(10)
hold on
plot(tam,ma);
title('Campo magnético vs tiempo')
xlabel('Tiempo')
ylabel('Campo magnético')
hold off

% Separacion de coordenadas
szma = size(ma);
max = ma(1:szma(1),1);
may = ma(1:szma(1),2);
maz = ma(1:szma(1),3);

set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(11)
hold on
view(30,30)
plot3(max, may, maz)
title('Componentes 3D del Campo Magnetico')
xlabel('x')
ylabel('y')
zlabel('z')
hold off


%Aplicacion de fourier y sus filtros
fourierma = fft(ma);
figure
bandpass(fourierma,[1 FT],Fs)

% Graficas de Posicion

set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(13)
hold on
plot(timestamp,lon);
title('Posición vs tiempo')
xlabel('Tiempo')
ylabel('Posición')
hold off

set(gcf, 'Position', get(0,'Screensize')); warning('off','all'); %Pantalla Completa
figure(14)
hold on
view(30,30)
plot3(lat, lon, alt)
title('Componentes 3D de la Posicion')
xlabel('x')
ylabel('y')
zlabel('z')
hold off

                        
