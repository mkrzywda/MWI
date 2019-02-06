close all; clear all; clc;

temp = 820;
time = 60;
R = 8.3144;
temp_k = temp + 273;
Q = 140000;
d0 = 0.000041;
D = d0*exp(-Q /(R * temp_k))*1E10;
dt = 0.01;
dx = 0.1;
max_ksi = 100;
dt_size = 360;
cga=-(temp-845)/210; %dane do modelu
v=0;

for i=1:100
    if(i==1)
        C(i) = 0.3829; %wype³nienie 
    else
        C(i) = cga; 
    end
end

ksi = 1; 
plot(C);
hold all
Calka_Aust(1:100) = 0.0;
int = 1;

for j=1:1:time/dt;
    temp=temp+dt*v;
    C1 = C;
    C1(ksi+1) = C1(ksi);
    C1(1) = C1(2);
for i=1:1:100;
    if i==1
        C1(i)=(1-2*((D*dt)/dx^2))*C1(i)+(C1(i)+C1(i+1))*((D*dt)/dx^2);
    elseif i ==100
        C1(i)=(1-2*((D*dt)/dx^2))*C1(i)+(C1(i)+C1(i-1))*((D*dt)/dx^2);
    else
        C1(i)=(1-2*((D*dt)/dx^2))*C1(i)+(C1(i-1)+C1(i+1))*((D*dt)/dx^2);
    end
    C(1:100) = C1(1:100);
end

if mod(j, 100) == 0
    Calka_Aust(int)=trapz(C1);
if int >= 5
    deltaCalka = Calka_Aust(int)-Calka_Aust(int-1); %krok z jakim wartoœci siê zmieniaj¹
    dksi = deltaCalka/(0.1-0.02);
if dksi >= dx %dx to sta³y krok
    ksi_2=round(dksi/dx) %zaokr¹glenie ró¿nicy przez sta³y krok
if(ksi_2 >= max_ksi)
    break;
end
    C(1:ksi_2)=0.3829;
    ksi=ksi_2;
end
end
    int = int + 1;
    figure(1);
    plot(C);
    hold all
    title('Stezenie wegla')
    xlabel('Odleglosc [um]')
    ylabel('Stezenie %')
end
end

figure(2);
plot(Calka_Aust(1:int));
title('Scalkowane stezenie wegla')
xlabel('Nr iteracji')
ylabel('')
