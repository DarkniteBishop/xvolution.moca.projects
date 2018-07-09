[ select count(*) row_count 
    from cardtl 
   where carcod = '@carcod@' 
     and srvlvl = '@srvlvl@' ] | 

    if (@row_count > 0) 
    { 
        [ update cardtl 
             set carcod = '@carcod@',
              	 srvlvl = '@srvlvl@',
              	 cartyp = '@cartyp@',
              	 sddflg = to_number('@sddflg@'),
                 intl_flg = to_number('@intl_flg@'),
                 fluid_load_flg = to_number('@fluid_load_flg@'),
                 bundle_flg = to_number('@bundle_flg@'),
                 shp_stg_ovrd_flg = to_number('@shp_stg_ovrd_flg@')
                 single_pkg_shp_flg = to_number('@single_pkg_shp_flg@')
           where carcod = '@carcod@' 
             and srvlvl = '@srvlvl@' ] 
    }
    else 
    { 
        [ insert into cardtl 
            (carcod, srvlvl, cartyp, sddflg, intl_flg, fluid_load_flg, bundle_flg, shp_stg_ovrd_flg,single_pkg_shp_flg) 
           values 
            ('@carcod@', '@srvlvl@', '@cartyp@', to_number('@sddflg@'), to_number('@intl_flg@'), to_number('@fluid_load_flg@'), to_number('@bundle_flg@'), to_number('@shp_stg_ovrd_flg@'),to_number('@single_pkg_shp_flg@')) ] 
    } 

