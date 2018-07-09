[select count(*) row_count 
   from serv_ins_mst 
  where serv_ins_id = '@serv_ins_id@' ] 
| 
if (@row_count > 0) 
{
    [update serv_ins_mst 
        set serv_ins_id = '@serv_ins_id@',
            moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
            mod_usr_id = '@mod_usr_id@'
      where serv_ins_id = '@serv_ins_id@' ] 
}
else 
{ 
    [insert into serv_ins_mst
            (serv_ins_id, moddte, mod_usr_id)
          VALUES
            ('@serv_ins_id@', to_date('@moddte@','YYYYMMDDHH24MISS'), '@mod_usr_id@') ] 
}
