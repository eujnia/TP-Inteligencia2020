function [W] = train(entradas,yd,criterio,testx,testyd,epocas,tasaAp)
    aux = 1;
    
    %Vector de entradas con su respectivo bias
    x=[-1*ones(size(entradas,1),1), entradas];
    testx=[-1*ones(size(testx,1),1) testx];
      
    W = (rand(size(x,2),1)-0.5)'; 
    
    graph_init
    
    for e=1:epocas
        for p=1:size(x,1)
         entrada=x(p,:)';
         yp=W*entrada;
         error=(yd(p)-sign(yp));
         W=W+(2*tasaAp)*error*entrada';
        end
    
        graph_update
             
        %Evaluo el desempeño:
        desemp=size(testx,1);
        for i=1:size(testx,1)
            ys=W*testx(i,:)';
            if(testyd(i)~=sign(ys))
                desemp=desemp-1;
            end
        end
        if((desemp/size(testx,1))>criterio)
            break;
        end
    end
end