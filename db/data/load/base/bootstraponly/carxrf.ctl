[ select count(*) row_count
    from carxrf 
   where carcod = '@carcod@'
     and srvlvl = '@srvlvl@' 
     and dstnam = '@dstnam@' ]
|
if (@row_count > 0)
{
    [ update carxrf set
             carcod = '@carcod@',
             srvlvl = '@srvlvl@',
             dstnam = '@dstnam@',
             dstcar = '@dstcar@',
             dstlvl = '@dstlvl@',
             tax_id = '@tax_id@',
             meter_num = '@meter_num@',
             prcl_pkgtyp = '@prcl_pkgtyp@',
             ground_flg = to_number('@ground_flg@'),
             spr_adr_id = '@spr_adr_id@',
             cod_adr_id = '@cod_adr_id@',
             serv_prnt_lblflg = to_number('@serv_prnt_lblflg@'),
             traknm_type = '@traknm_type@',
             service_type = '@service_type@'
       where carcod = '@carcod@'
         and srvlvl = '@srvlvl@'
         and dstnam = '@dstnam@' ]
}
else 
{
    [ insert into carxrf
         (carcod, srvlvl, dstnam, dstcar, dstlvl, 
          tax_id, meter_num,
          prcl_pkgtyp, ground_flg, spr_adr_id, cod_adr_id,
          serv_prnt_lblflg, traknm_type, service_type) 
      values
         ('@carcod@', '@srvlvl@', '@dstnam@', '@dstcar@', '@dstlvl@',
          '@tax_id@', '@meter_num@', 
          '@prcl_pkgtyp@', to_number('@ground_flg@'), 
          '@spr_adr_id@', '@cod_adr_id@', to_number('@serv_prnt_lblflg@'), 
          '@traknm_type@', '@service_type@') ]
}
