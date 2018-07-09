[ select count(*) row_count 
   from vehtyp 
  where vehtyp_id = '@vehtyp_id@' 
    and voc_cod = '@voc_cod@' ] | 

    if (@row_count > 0) 
    {
        [ update vehtyp 
             set vehtyp_id = '@vehtyp_id@',
                 voc_cod = '@voc_cod@',
                 moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
                 mod_usr_id = '@mod_usr_id@',
                 veh_lod_limit = '@veh_lod_limit@'
           where vehtyp_id = '@vehtyp_id@' 
             and voc_cod = '@voc_cod@' ]
    }
    else 
    { 
        [ insert into vehtyp
               (vehtyp_id, voc_cod, moddte, mod_usr_id, veh_lod_limit )
           values
               ('@vehtyp_id@', '@voc_cod@', 
		 to_date('@moddte@','YYYYMMDDHH24MISS'),'@mod_usr_id@', '@veh_lod_limit@' ) ]
    }
