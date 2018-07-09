[ select count(*) row_count 
    from devmst 
   where wh_id = '@wh_id@'
     and devcod = '@devcod@' ] | 

    if (@row_count > 0) 
    { 
        [ update devmst 
             set wh_id = '@wh_id@',
                 devcod = '@devcod@',
                 devcls = '@devcls@',
                 devnam = '@devnam@',
                 voc_term_id = '@voc_term_id@',
                 prtadr = '@prtadr@',
                 lbl_prtadr = '@lbl_prtadr@',
                 touchscreen_flg = '@touchscreen_flg@',
                 pko_prcare = '@pko_prcare@',
                 spl_hand_loc = '@spl_hand_loc@',
                 pko_autoctnnum_flg = '@pko_autoctnnum_flg@'
           where wh_id = '@wh_id@'
             and devcod = '@devcod@' ] 
    }  
    else 
    { 
        [ insert into devmst 
              (wh_id, devcod, devcls, devnam, voc_term_id, lbl_prtadr, prtadr, touchscreen_flg, pko_prcare, spl_hand_loc, pko_autoctnnum_flg) 
            values 
              ('@wh_id@', '@devcod@', '@devcls@', '@devnam@', '@voc_term_id@', '@lbl_prtadr@', '@prtadr@', '@touchscreen_flg@', '@pko_prcare@', '@spl_hand_loc@', '@pko_autoctnnum_flg@') ]
    }
