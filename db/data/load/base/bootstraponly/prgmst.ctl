[ select count(*) row_count 
    from prgmst 
   where invsts_prg = '@invsts_prg@' 
     and invsts = '@invsts@' ] | 
 
    if (@row_count > 0) 
    { 
        [ update prgmst 
             set srtseq = to_number('@srtseq@'),
                 alcflg = to_number('@alcflg@'),
                 shpflg = to_number('@shpflg@')
           where invsts_prg = '@invsts_prg@'
             and invsts = '@invsts@'] 
    }  
    else 
    { 
        [ insert into prgmst 
             (invsts_prg, invsts, srtseq, alcflg, shpflg)
           values 
             ('@invsts_prg@', '@invsts@', to_number('@srtseq@'),
              to_number('@alcflg@'), to_number('@shpflg@')) ]
    } 
