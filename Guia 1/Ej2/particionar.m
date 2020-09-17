function [file_trn,file_tst] = particionar(file, cant_part, p_trn)
     
  datos = csvread(file);
  n_pat = size(datos,1); 
  n_col = size(datos,2); 
  
  cant_dat_trn = n_pat * p_trn; 
  
  m_part_trn=[];
  m_part_tst=[];
  
  for k=1:cant_part
    
    idx = randperm(n_pat);
    idx_trn=idx(1:cant_dat_trn)';
    idx_tst=idx(cant_dat_trn+1:n_pat)';
    
    v_elem_trn=[];
    v_elem_tst=[];
    
    n_trn = size(idx_trn(:,1),1); % 800
    n_tst = size(idx_tst(:,1),1); % 200 
     
    %%%%%%
    for i=1:1:n_trn
      
      elem = datos(idx_trn(i,1), :)'; 
      
      v_elem_trn = [v_elem_trn elem]; %vector de los elem  matriz de (4,800)
      
    endfor
    
    v_elem_trn = v_elem_trn'; %queda de (800,4)
    m_part_trn = [m_part_trn v_elem_trn]; %(lo agregamos a la matriz)
  
    %%%%%%    
    for i=1:1:n_tst
      
      elem = datos(idx_tst(i,1), :)';
      v_elem_tst = [v_elem_tst elem];
      
    endfor
    v_elem_tst = v_elem_tst';
    m_part_tst = [m_part_tst v_elem_tst];

    
  endfor

  file_trn= 'p_trn.csv';
  file_tst= 'p_tst.csv';
  
  csvwrite(file_trn,m_part_trn);
  csvwrite(file_tst,m_part_tst);
  

endfunction