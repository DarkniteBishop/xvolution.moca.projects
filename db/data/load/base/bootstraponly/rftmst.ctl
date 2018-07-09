[ select count(*) row_count 
    from rftmst 
   where wh_id = '@wh_id@'
     and devcod = '@devcod@' ] | 

    if (@row_count > 0) 
    { 
        [ update rftmst 
             set wh_id = '@wh_id@',
                 devcod = '@devcod@',
                 curwrkare = '@curwrkare@',
                 curwrkzon = '@curwrkzon@',
                 curstoloc = '@curstoloc@',
                 hmewrkare = '@hmewrkare@',
                 vehtyp = '@vehtyp@',
                 actdte = to_date('@actdte@','YYYYMMDDHH24MISS')
           where wh_id = '@wh_id@'
             and devcod = '@devcod@' ] 
    }  
    else 
    { 
        [ insert into rftmst 
            (wh_id, devcod, curwrkare, curwrkzon, curstoloc, 
             hmewrkare, vehtyp, actdte) 
           values 
            ('@wh_id@', '@devcod@', '@curwrkare@', '@curwrkzon@', '@curstoloc@', 
             '@hmewrkare@', '@vehtyp@', 
             to_date('@actdte@','YYYYMMDDHH24MISS')) ] 
    } 
