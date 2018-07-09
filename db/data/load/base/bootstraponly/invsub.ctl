[ select count(*) row_count 
    from invsub 
   where subnum = '@subnum@' ] | 
  
    if (@row_count > 0) 
    { 
        [ update invsub 
             set subnum = '@subnum@',
                 lodnum = '@lodnum@',
                 subwgt = to_number('@subwgt@'),
                 prmflg = to_number ('@prmflg@'),
                 phyflg = to_number('@phyflg@'),
                 mvsflg = to_number('@mvsflg@'),
                 ctnflg = to_number('@ctnflg@'),
                 idmflg = to_number('@idmflg@'),
                 wrkref = '@wrkref@',
                 tagdev = '@tagdev@',
                 adddte = to_date('@adddte@','YYYYMMDDHH24MISS'),
                 lstmov = to_date('@lstmov@','YYYYMMDDHH24MISS'),
                 lstdte = to_date('@lstdte@','YYYYMMDDHH24MISS'),
                 lstcod = '@lstcod@',
                 lst_usr_id = '@lst_usr_id@'
           where subnum = '@subnum@' ] 
    }  
    else 
    { 
        [ insert into invsub 
             (subnum, lodnum, subwgt, prmflg, phyflg, mvsflg, ctnflg, 
              idmflg, wrkref, tagdev, adddte, lstmov, lstdte, lstcod, 
              lst_usr_id) 
           values 
             ('@subnum@', '@lodnum@', to_number('@subwgt@'), 
              to_number('@prmflg@'), to_number('@phyflg@'), 
              to_number('@mvsflg@'), to_number('@ctnflg@'), 
              to_number('@idmflg@'), '@wrkref@', '@tagdev@', 
              to_date('@adddte@','YYYYMMDDHH24MISS'), 
              to_date('@lstmov@','YYYYMMDDHH24MISS'), 
              to_date('@lstdte@','YYYYMMDDHH24MISS'), 
              '@lstcod@', '@lst_usr_id@') ] 
    } 
