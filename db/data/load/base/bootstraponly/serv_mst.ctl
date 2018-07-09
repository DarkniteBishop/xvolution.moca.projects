[select count(*) row_count 
   from serv_mst 
  where serv_id = '@serv_id@' ] 
| 
if (@row_count > 0) 
{
    [update serv_mst 
        set serv_id = '@serv_id@',
            actcod = '@actcod@',
            moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
            mod_usr_id = '@mod_usr_id@',
            serv_typ = '@serv_typ@'
      where serv_id = '@serv_id@' ] 
}
else 
{ 
    [insert into serv_mst
            (serv_id, actcod, moddte, mod_usr_id, serv_typ)
         VALUES
            ('@serv_id@', '@actcod@', to_date('@moddte@','YYYYMMDDHH24MISS'), '@mod_usr_id@', '@serv_typ@') ] 
}
