[ select count(*) row_count 
    from rule_parm 
   where rule_nam = '@rule_nam@'
     and parm_id  = '@parm_id@']
   | 
    if (@row_count > 0) 
    { 
         change rule parameter 
           where rule_nam   = '@rule_nam@'
             and parm_typ   = '@parm_typ@'
             and parm_id   = '@parm_id@'
    }  
    else 
    { 
        create rule parameter
         where rule_nam = '@rule_nam@'
           and parm_id  = '@parm_id@'
           and parm_typ = '@parm_typ@'
    } 
