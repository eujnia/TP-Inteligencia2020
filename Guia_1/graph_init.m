%%INICIALIZACION DE GRÁFICO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure 1;
hold off

%LEO PUNTOS A CLASIFICAR
%OR
%datos_pos=csvread('OR_trn_pos.csv');
%datos_neg=csvread('OR_trn_neg.csv');    

%XOR
datos_pos=csvread('XOR_trn_pos.csv');
datos_neg=csvread('XOR_trn_neg.csv');

%datos=csvread('XOR_trn.csv');
%Cant_entradas=2;

%CASOS AFIRMATIVOS
x1_pos=datos_pos(:,1); %Entradas x1 y x2
x2_pos=datos_pos(:,2); %Entradas x1 y x2

%CASOS NEGATIVOS
x1_neg=datos_neg(:,1); %Entradas x1 y x2
x2_neg=datos_neg(:,2); %Entradas x1 y x2

%y=datos(:,3); %Salida correcta/esperada (para entrenar)


%    x1 = entradas(:,1);
%    x2 = entradas(:,2);

%PINTO CASOS AFIRMATIVOS EN ROJO
scatter (x1_pos, x2_pos, "r");
axis([-2 2 -2 2])
axis manual
hold on
%PINTO CASOS NEGATIVOS EN CELESTE
scatter (x1_neg, x2_neg, "c");


%GRAFICO EJES X-Y EN NEGRO
a=linspace(-2,2) ;
b=linspace(0,0) ;
plot(a,b,'k-') ;
plot(b,a,'k-') ;
pause(aux)

%PINTO RECTA CON PESOS ALEATORIOS EN AZUL
x1r = [-1,0,1];
x2r = W(1)/W(3)-x1r*W(2)/W(3);
plot (x1r, x2r, "b");
xlabel ("x1");
ylabel ("x2");
title ("training process");
pause(aux)

%%GRAFICO-FIN%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%