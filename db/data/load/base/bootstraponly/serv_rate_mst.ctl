[ select count(*) row_count 
    from serv_rate_mst 
   where serv_rate_id = '@serv_rate_id@' ] 
| 
if (@row_count > 0) 
{
    [update serv_rate_mst 
        set serv_rate_id = '@serv_rate_id@',
            qty_by_cod = '@qty_by_cod@',
            moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
            mod_usr_id = '@mod_usr_id@'
      where serv_rate_id = '@serv_rate_id@' ] 
}
else 
{ 
    [insert into serv_rate_mst
                (serv_rate_id, qty_by_cod, moddte, mod_usr_id)
             VALUES
                ('@serv_rate_id@','@qty_by_cod@',to_date('@moddte@','YYYYMMDDHH24MISS'),'@mod_usr_id@') ] 
}
