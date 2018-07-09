    [ select count(*) row_count 
        from ovr_loc_cod 
       where ovr_loc_cod = '@ovr_loc_cod@' ]
    | 
    if (@row_count > 0) 
    { 
        [ update ovr_loc_cod 
             set ovr_loc_cod = '@ovr_loc_cod@',
                 defflg = to_number('@defflg@'),
                 cyc_cnt_cod = '@cyc_cnt_cod@',
                 set_locsts = '@set_locsts@',
                 set_maxqvl_flg = to_number('@set_maxqvl_flg@')
           where ovr_loc_cod = '@ovr_loc_cod@' ] 
    }  
    else 
    { 
        [ insert into ovr_loc_cod 
             (ovr_loc_cod, defflg, cyc_cnt_cod, set_locsts, set_maxqvl_flg) 
            values 
              ('@ovr_loc_cod@',
               to_number('@defflg@'),
               '@cyc_cnt_cod@',
               '@set_locsts@',
               to_number('@set_maxqvl_flg@'))] 
    } 
