[ select count(*) row_count 
    from invlod 
   where lodnum = '@lodnum@' 
     and wh_id  = '@wh_id@']
     
     | 
 
    if (@row_count > 0) 
    { 
        [ update invlod 
             set stoloc = '@stoloc@',
                 wh_id  = '@wh_id@',
                 lodwgt = to_number('@lodwgt@'),
                 prmflg = to_number('@prmflg@'),
                 unkflg = to_number('@unkflg@'),
                 mvlflg = to_number('@mvlflg@'),
                 bundled_flg = to_number('@bundled_flg@'),
                 adddte = to_date('@adddte@', 'YYYYMMDDHH24MISS')
           where lodnum = '@lodnum@' 
             and wh_id  = '@wh_id@'] 
    }  
    else 
    { 
        [ insert into invlod 
             (lodnum, stoloc, lodwgt, prmflg, unkflg, mvlflg, adddte, wh_id, bundled_flg)
           values 
             ('@lodnum@', '@stoloc@', to_number('@lodwgt@'), 
              to_number('@prmflg@'), to_number('@unkflg@'), 
              to_number('@mvlflg@'), 
              to_date('@adddte@', 'YYYYMMDDHH24MISS'),
              '@wh_id@',
              to_number('@bundled_flg@')) ]
    } 
