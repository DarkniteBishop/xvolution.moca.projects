[select count(*) row_count 
   from serv_ins_action 
  where serv_ins_id = '@serv_ins_id@' 
    and serv_action_typ = '@serv_action_typ@' 
    and serv_action_cod = '@serv_action_cod@'
    and seqnum = '@seqnum@' ] 
| 
if (@row_count > 0) 
{
    [update serv_ins_action 
        set serv_ins_id = '@serv_ins_id@',
            serv_action_typ = '@serv_action_typ@',
            serv_action_cod = '@serv_action_cod@',
            seqnum = @seqnum@,
            rf_frm_id = '@rf_frm_id@',
            gui_frm_id = '@gui_frm_id@',
            cnfrm_val_var_nam = '@cnfrm_val_var_nam@',
            post_cnfrm_val_cmd = '@post_cnfrm_val_cmd@',
            invsts = '@invsts@',
            ems_evt_nam = '@ems_evt_nam@',
            rpt_id = '@rpt_id@',
            cmd = '@cmd@',
            hldnum = '@hldnum@',
            hldcod = '@hldcod@',
            hldpfx = '@hldpfx@',
            reacod = '@reacod@',
            moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
            mod_usr_id = '@mod_usr_id@'
      where serv_ins_id = '@serv_ins_id@' 
        and serv_action_typ = '@serv_action_typ@' 
        and serv_action_cod = '@serv_action_cod@' 
        and seqnum = '@seqnum@'] 
}
else 
{ 
    [insert into serv_ins_action
            (serv_ins_id, serv_action_typ, serv_action_cod, seqnum, rf_frm_id, gui_frm_id, cnfrm_val_var_nam, post_cnfrm_val_cmd, invsts, ems_evt_nam, rpt_id, cmd, hldnum, hldcod, hldpfx, reacod, moddte, mod_usr_id)
         VALUES
            ('@serv_ins_id@', '@serv_action_typ@', '@serv_action_cod@', @seqnum@, '@rf_frm_id@', '@gui_frm_id@', '@cnfrm_val_var_nam@', '@post_cnfrm_val_cmd@', '@invsts@', '@ems_evt_nam@', '@rpt_id@', '@cmd@', '@hldnum@', '@hldcod@', '@hldpfx@', '@reacod@', to_date('@moddte@','YYYYMMDDHH24MISS'), '@mod_usr_id@') ] 
}
