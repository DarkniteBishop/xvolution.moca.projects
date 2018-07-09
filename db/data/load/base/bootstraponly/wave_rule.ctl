[ select count(*) row_count 
    from wave_rule 
   where rule_nam = '@rule_nam@'
     and dumkey   = @dumkey@] |
  
    if (@row_count > 0) 
    { 
        [ update wave_rule 
             set rule_nam = '@rule_nam@',
                 dumkey = @dumkey@,
                 srtseq = @srtseq@,
                 cmd    = '@cmd@'
           where rule_nam = '@rule_nam@'
	     and dumkey   = @dumkey@] 
    }  
    else 
    { 
        [insert 
	  into wave_rule 
             (rule_nam, dumkey, srtseq, cmd)
           values 
             ('@rule_nam@', @dumkey@, @srtseq@, '@cmd@')] 
    } 
