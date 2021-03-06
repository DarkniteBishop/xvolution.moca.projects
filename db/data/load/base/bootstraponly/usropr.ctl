[ select count(*) row_count 
    from usropr 
   where usr_id = '@usr_id@' 
     and oprcod = '@oprcod@' 
     and wh_id  = '@wh_id@' ] | 

    if (@row_count > 0) 
    { 
        [ update usropr 
             set usr_id = '@usr_id@',
                 oprcod = '@oprcod@',
                  wh_id = '@wh_id@'
           where usr_id = '@usr_id@' 
             and oprcod = '@oprcod@'
             and wh_id  = '@wh_id@'] 
    }  
    else 
    {
        create user operation
         where usr_id = '@usr_id@'
           and oprcod = '@oprcod@'
           and wh_id = '@wh_id@'
    }
