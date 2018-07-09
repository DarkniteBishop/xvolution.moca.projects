[select count(*) row_count 
   from def_serv
  where def_serv_id = '@def_serv_id@' 
    and wh_id = '@wh_id@' ] 
| 
if (@row_count > 0) 
{
    [update def_serv
        set def_serv_id = '@def_serv_id@',
            wh_id = '@wh_id@',
            def_serv_cod = '@def_serv_cod@',
            client_id = '@client_id@',
            carcod = '@carcod@',
            prtnum = '@prtnum@',
            prt_client_id = '@prt_client_id@',
            invsts = '@invsts@',
            invtyp = '@invtyp@',
            supnum = '@supnum@',
            cstnum = '@cstnum@',
            ordtyp = '@ordtyp@',
            serv_id = '@serv_id@',
            serv_rate_id = '@serv_rate_id@',
            serv_req_flg = to_number('@serv_req_flg@'),
            moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
            mod_usr_id = '@mod_usr_id@',
            ordnum = '@ordnum@',
            ordlin = '@ordlin@',
            ordsln = '@ordsln@',
            srvlvl = '@srvlvl@',
            csttyp = '@csttyp@',
            dstare = '@dstare@',
            trlr_typ = '@trlr_typ@',
            vehtyp = '@vehtyp@',
            trlr_cod = '@trlr_cod@',
            untcst = to_number('@untcst@')
      where def_serv_id = '@def_serv_id@' 
        and wh_id = '@wh_id@'] 
}
else 
{ 
    [insert into def_serv
            (def_serv_id, wh_id, def_serv_cod, client_id, carcod, prtnum, prt_client_id, invsts, invtyp, supnum, cstnum, ordtyp, serv_id, serv_rate_id, serv_req_flg, moddte, mod_usr_id, ordnum, ordlin, ordsln, srvlvl, csttyp, dstare, trlr_typ, vehtyp, trlr_cod,untcst)
         VALUES
            ('@def_serv_id@', '@wh_id@', '@def_serv_cod@', '@client_id@', '@carcod@', '@prtnum@', '@prt_client_id@', '@invsts@', '@invtyp@', '@supnum@', '@cstnum@', '@ordtyp@', '@serv_id@', '@serv_rate_id@', to_number('@serv_req_flg@'), to_date('@moddte@','YYYYMMDDHH24MISS'), '@mod_usr_id@', '@ordnum@', '@ordlin@', '@ordsln@', '@srvlvl@', '@csttyp@', '@dstare@', '@trlr_typ@', '@vehtyp@', '@trlr_cod@',to_number('@untcst@')) ] 
}
