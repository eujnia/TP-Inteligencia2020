%%GACTUALIZACION GRÁFICO X EPOCA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%if (mod(e,10)==0)
%scatter (x1, x2, "r");  
scatter (x1_pos, x2_pos, "r");
scatter (x1_neg, x2_neg, "c");
x2r = W(1)/W(3)-x1r*W(2)/W(3);
plot (x1r, x2r, "g");
pause(aux)
%end
%%FIN ACTUALIZACION GRAFICO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%