[ select count(*) row_count
    From cnttyp
   where cnttyp = '@cnttyp@']
   
  |
  
  if (@row_count > 0)
  {
      [ update cnttyp
           set cnttyp = '@cnttyp@',
               oprcod = '@oprcod@',
               dtl_flg = '@dtl_flg@',
               end_loc_cnt = '@end_loc_cnt@',
               nxt_cnttyp = '@nxt_cnttyp@',
               sum_retry_flg = '@sum_retry_flg@',
               cls_loc_cnt_mthd = '@cls_loc_cnt_mthd@',
               emp_loc_flg = '@emp_loc_flg@',
               adj_mthd = '@adj_mthd@',
               last_upd_dt = '@lst_upd_dt@',
               last_upd_usr_id = '@upd_usr_id@',
               diff_usr_flg = '@diff_usr_flg@',
               homog_adj_flg = '@homog_adj_flg@',
               rf_prmpt_rea_flg = '@rf_prmpt_rea_flg@'
         where cnttyp = '@cnttyp@'
          And oprcod = '@oprcod@' ]
  }
  else
  {
      [ insert into cnttyp
          (cnttyp, oprcod, dtl_flg, end_loc_cnt, 
           nxt_cnttyp, sum_retry_flg, cls_loc_cnt_mthd, 
           emp_loc_flg, adj_mthd, ins_dt, ins_usr_id, 
           diff_usr_flg, homog_adj_flg, rf_prmpt_rea_flg)
        Values
          ('@cnttyp@', '@oprcod@', '@dtl_flg@', '@end_loc_cnt@', 
           '@nxt_cnttyp@', '@sum_retry_flg@', '@cls_loc_cnt_mthd@', 
           '@emp_loc_flg@', '@adj_mthd@', sysdate, '@ins_usr_id@',
           '@diff_usr_flg@', '@homog_adj_flg@', '@rf_prmpt_rea_flg@') ]
  }
