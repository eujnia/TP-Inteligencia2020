function [W] = train2(entradas,yd,epocas,criterio,tasaAp)
#rain(x,yd,nro_epocas,criterio,tasa_ap)
    %Vector de entradas con su respectivo bias
    x=[-1*ones(size(entradas,1),1), entradas];
     
    %Matriz de pesos
    W=rand(1,size(x,2),1)-0.5; %Vector de pesos inicializado con valores al azar entre -0.5 y +0.5
    

    %Itero por epocas
    for e=1:epocas
    
        %entrenamiento
        for p=1:size(x,1)
         entrada=x(p,:)';
         yp = entrada * W;

         if (yp>=0)
         y=1;
         else
         y=-1;
         endif
         error=(yd(p)-(y));
         W = W+(.5*tasaAp)*error*entrada'; 
        end
        
        %validación
             # desmp o validacion (si tenemos el dataset separado)
        desempenio=0;
        
        for p=1:size(x,1)
          
          y_p=x(p,:)'*W;
          
          if (y_p>=0)
            y_val=1;
          else
            y_val=-1;
          endif
          
          if y_val == yd(p) 
            desempenio += 1;
          endif
        end
        
          
      # nro de aciertos / nro total de casos
      desempenio_prom = desempenio / size(x,1);
      
      if desempenio_prom >= criterio
         break
      endif
    
    end
        
end
