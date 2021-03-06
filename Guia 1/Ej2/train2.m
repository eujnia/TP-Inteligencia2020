function [W] = train2(entradas,yd,epocas,criterio,tasaAp) 
    % separo los datos de validacion
    p_valida =round(size(entradas,1)*0.2);
    
    x_val = entradas(1:p_valida)'; 
    yd_val = yd(1:p_valida,:);
    
    %Vector de entradas con su respectivo bias
    entradas = entradas(p_valida:size(entradas,1),:);
    yd = yd(p_valida:size(yd,1),:);
    
    x=[-1*ones(size(entradas,1),1), entradas];
     
    %Matriz de pesos
    W=rand(size(x,2),1)-0.5; 
    %Vector de pesos inicializado con valores al azar entre -0.5 y +0.5

    %Itero por epocas
    for e=1:epocas
    
        %entrenamiento
        for p=1:size(x,1)
   
         yp = x(p,:) * W; 
         error=(yd(p)-sign(yp));
         W = W+(.5*tasaAp)*error*x(p,:)'; 
        end
        
        # validacion si contamos con otro conjunto de datos 
        desemp=0;
        
        for p=1:size(x_val,1)
          
          y_p=x_val(p,:)*W;
          
          if (y_p>=0)
            y_val=1;
          else
            y_val=-1;
          endif
          
          if y_val == yd_val(p) 
            desemp += 1;
          endif
        end
        
          
      # nro de aciertos / nro total de casos
      desempProm = desemp / size(x,1);
      
      if desempProm >= criterio
         break
      endif
    
    end
        
end
