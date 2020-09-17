%Ejercicio 1 Guia 1 - IC - Agustin Spahn

%% Archivo de datosa leer:
datosOR=csvread('OR_trn.csv');
datosXOR=csvread('XOR_trn.csv');

Cant_entradas=2;
porcentaje_desemp=.75;

indx_trainOR=floor(porcentaje_desemp*size(datosOR,1))

xOR=datosOR(1:indx_trainOR,1:Cant_entradas); %Entradas x1 y x2
yOR=datosOR(1:indx_trainOR,3); %Salida correcta/esperada (para entrenar)
xORtst=datosOR(indx_trainOR+1:size(datosOR,1),1:Cant_entradas); %Entradas x1 y x2
yORtst=datosOR(indx_trainOR+1:size(datosOR,1),3); %Salida correcta/esperada (para entrenar)


indx_trainXOR=floor(porcentaje_desemp*size(datosOR,1))

xXOR=datosXOR(1:indx_trainXOR,1:Cant_entradas); %Entradas x1 y x2
yXOR=datosXOR(1:indx_trainXOR,3); %Salida correcta/esperada (para entrenar)
xXORtst=datosXOR(indx_trainXOR+1:size(datosXOR,1),1:Cant_entradas); %Entradas x1 y x2
yXORtst=datosXOR(indx_trainXOR+1:size(datosXOR,1),3); %Salida correcta/esperada (para entrenar)

%% Numero maximo de epocas de entrenamiento: (veces que se muestra el
%conjunto competo de datos)
epocas=500; 

%% Tasa de aprendizaje:
mu=0.01;
desemp=0.99;

%% Datos de prueba:
datoststOR=csvread('OR_tst.csv');
datoststXOR=csvread('XOR_tst.csv');

xTestOR=datoststOR(:,1:Cant_entradas); %Entradas x1 y x2
xTestXOR=datoststXOR(:,1:Cant_entradas); %Entradas x1 y x2

yTestOR=datoststOR(:,3); %Salida correcta/esperada (para testear)
yTestXOR=datoststXOR(:,3); %Salida correcta/esperada (para testear)

%% Main
WOR=train(xOR,yOR,desemp,xORtst,yORtst,epocas,mu)
tasaAciertoOR=test(xTestOR,yTestOR,WOR)

WXOR=train(xXOR,yXOR,desemp,xXORtst,yXORtst,epocas,mu)
tasaAciertoXOR=test(xTestXOR,yTestXOR,WXOR
