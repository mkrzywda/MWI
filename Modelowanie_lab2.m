clc
clear all;
close all;

% Ustawienie wartoœci do obliczeñ

T=820;
T_k=T+273;
Q=140000;
R=8.3144;
d0=0.000041;
dx=0.1;
dt=3;
C=zeros(2,100);
tab=zeros(99,100);
dT=0;
gr=0;

for i=1:99
	C(1,i)=0.02;
end

C(1,1)=0.47;
C(1,2)=0.47;
C(1,3)=0.47;
C(1,4)=0.47;
C(1,5)=0.47;
austenit=zeros(1,100);

%Wykonywanie obliczeñ

for i=1:100
	D=d0*exp(-Q/(R*(T_k+(dT*i))))*1E10;
	Cgr=((912-T+(dT*i))/240.26);
	
	for j=1:100
		if j==1
		C(2,j)=(1-2*(D*dt/dx*dx))*C(1,j)+(D*dt/dx*dx)*(C(1,j)+C(1,j+1));
		elseif j==100
		C(2,j)=(1-2*(D*dt/dx*dx))*C(1,j)+(D*dt/dx*dx) * (C(1,j-1)+C(1,j));
		else
		C(2,j)=(1-2*(D*dt/dx*dx))*C(1,j) + (D*dt/dx*dx) * (C(1,j-1)+C(1,j+1));
		end
		if C(2,gr) > Cgr
		break;
		end	
		if C(1,j) > 0.0218
		austenit(i) = austenit(i)+1;
		end	
	end	
	tab(i,:)=C(1,:);
	C(1,:)=C(2,:);
end
% Wyœwietlanie wykresów

figure(1);
title('Wykres zmiany objêtoœci austenitu w stali w funkcji czasu');
ylabel('U³amek objêtoœci');
xlabel('Krok');
axis([1 100 0 30]);
hold on;
plot(austenit,'red-');
hold off;

figure(2);
title('Rozk³ad stê¿enia z odleg³oœci¹ w poszczególnych krokach');
xlabel('element');
ylabel('stê¿enie[%]');
hold on;
plot(tab(1,1:15));
plot(tab(5,1:15));
plot(tab(10,1:15));
plot(tab(20,1:15));
plot(tab(30,1:15));
plot(tab(40,1:15));
plot(tab(50,1:15));
plot(tab(60,1:15));
plot(tab(70,1:15));
plot(tab(80,1:15));
plot(tab(90,1:15));
plot(tab(99,1:15),'y-');


