warning('off');

nro_epocas=2000;
criterio=0.875;
tasa_ap=0.1; 

disp('Inciso a):');
des = p_desemp('spheres1d10.csv',5,0.8,nro_epocas,criterio,tasa_ap);

disp('  Desempeño por particion:');
disp('   P1        P2        P3        P4        P5');
disp(des');
disp(['  Desempeño promedio: ', num2str(mean(des))]);



disp(' ');
disp('Inciso b):');

nro_epocas=50;
criterio=0.99;
tasa_ap=0.1; 

d1 = p_desemp('spheres2d10.csv', 10, 0.8,nro_epocas,criterio,tasa_ap);

d2 = p_desemp('spheres2d50.csv', 10, 0.8,nro_epocas,criterio,tasa_ap);
 
d3 = p_desemp('spheres2d70.csv', 10, 0.8,nro_epocas,criterio,tasa_ap);

d = [d1';d2';d3'];
dprom=[];
 
 for i=1:size(d,1)
   dprom=[dprom; mean(d(i,:))];
 endfor
disp('  Matriz de desempeños:');
disp(d);
disp('  Desempeño promedio:');
disp(dprom);