[select count(*) row_count 
   from serv_ins 
  where serv_id = '@serv_id@' 
    and serv_ins_id = '@serv_ins_id@' ] 
| 
if (@row_count > 0) 
{
    [update serv_ins 
        set serv_id = '@serv_id@',
            serv_ins_id = '@serv_ins_id@',
            seqnum = @seqnum@,
            serv_ins_typ = '@serv_ins_typ@',
            stop_serv_flg = to_number('@stop_serv_flg@'),
            moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
            mod_usr_id = '@mod_usr_id@'
      where serv_id = '@serv_id@' 
        and serv_ins_id = '@serv_ins_id@' ] 
}
else 
{ 
    [insert into serv_ins
            (serv_id, serv_ins_id, seqnum, serv_ins_typ, stop_serv_flg, moddte, mod_usr_id)
         VALUES
            ('@serv_id@', '@serv_ins_id@', @seqnum@, '@serv_ins_typ@', to_number('@stop_serv_flg@'), to_date('@moddte@','YYYYMMDDHH24MISS'), '@mod_usr_id@') ] 
}
