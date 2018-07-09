[select count(*) row_count 
   from wh_serv 
  where serv_id = '@serv_id@' 
    and wh_id = '@wh_id@' ] 
| 
if (@row_count > 0) 
{
    [update wh_serv
        set serv_id = '@serv_id@',
            wh_id = '@wh_id@',
            seqnum = to_number('@seqnum@'),
            mixed_prt_flg = to_number('@mixed_prt_flg@'),
            spec_serv_cod = '@spec_serv_cod@',
            moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
            mod_usr_id = '@mod_usr_id@',
            serv_enaflg = to_number('@serv_enaflg@'),
            lodlvl = '@lodlvl@',
            audit_thresh_cost = to_number('@audit_thresh_cost@')
      where serv_id = '@serv_id@' 
        and wh_id = '@wh_id@' ] 
}
else 
{ 
    [insert into wh_serv
            (serv_id, wh_id, seqnum, mixed_prt_flg, spec_serv_cod, moddte, mod_usr_id, serv_enaflg, lodlvl, audit_thresh_cost)
         VALUES
            ('@serv_id@', '@wh_id@', to_number('@seqnum@'), to_number('@mixed_prt_flg@'), '@spec_serv_cod@', to_date('@moddte@','YYYYMMDDHH24MISS'), '@mod_usr_id@', to_number('@serv_enaflg@'), '@lodlvl@', to_number('@audit_thresh_cost@')) ] 
}
