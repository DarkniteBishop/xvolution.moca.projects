if ('@wh_id_tmpl@' = '')
{
    publish data where wh_id_tmpl = '----'
}    
else
{
    publish data where wh_id_tmpl = '@wh_id_tmpl@'
}
|
[ select count(*) row_count 
    from wrkopr 
   where oprcod = '@oprcod@' 
     and wh_id_tmpl  = @wh_id_tmpl ] | 

    if (@row_count > 0) 
    { 
        [ update wrkopr 
             set oprcod = '@oprcod@',
                 wh_id_tmpl = @wh_id_tmpl,
                 baspri = to_number('@baspri@'),
                 exptim = to_number('@exptim@'),
                 escinc = to_number('@escinc@'),
                 maxescpri = to_number('@maxescpri@'),
                 begdaycod = '@begdaycod@',
                 begtim = to_date('@begtim@','YYYYMMDDHH24MISS'),
                 enddaycod = '@enddaycod@',
                 endtim = to_date('@endtim@','YYYYMMDDHH24MISS'),
                 use_src_flg = to_number('@use_src_flg@'),
                 esc_cmd = '@esc_cmd@',
                 esc_cmd_flg = to_number('@esc_cmd_flg@'),
                 init_sts = '@init_sts@',
                 rls_cmd = '@rls_cmd@',
                 force_ack_loc_flg = to_number('@force_ack_loc_flg@')
           where oprcod = '@oprcod@'
             and wh_id_tmpl  = @wh_id_tmpl ] 
    }  
    else 
    { 
        [ insert into wrkopr 
             (oprcod, wh_id_tmpl, baspri, exptim, escinc, maxescpri, 
              use_src_flg, begdaycod, begtim, enddaycod, endtim, esc_cmd, esc_cmd_flg, init_sts, rls_cmd, force_ack_loc_flg) 
            values 
              ('@oprcod@', @wh_id_tmpl, to_number('@baspri@'), to_number('@exptim@'), 
               to_number('@escinc@'), to_number('@maxescpri@'), 
               to_number('@use_src_flg@'), '@begdaycod@', 
               to_date('@begtim@','YYYYMMDDHH24MISS'), 
               '@enddaycod@',to_date('@endtim@','YYYYMMDDHH24MISS'), '@esc_cmd@', to_number('@esc_cmd_flg@'), '@init_sts@', '@rls_cmd@', to_number('@force_ack_loc_flg@'))] 
    } 
