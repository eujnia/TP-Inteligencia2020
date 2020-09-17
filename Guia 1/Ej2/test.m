function [tasaAcierto] = test(W,data,yd)
          
    %Vector de entradas con su respectivo bias -1
    x=[-1*ones(size(data,1),1), data];

    %Contador de errores:
    nroErrores=0;
    
    %Recorro los datos y evaluo la salida
    for p=1:size(x,1)
         if(yd(p)~=sign(W*x(p,:)'))
             nroErrores=nroErrores+1;
         end
    end
    tasaAcierto=100*(((size(x,1)-nroErrores))/size(x,1));   
end