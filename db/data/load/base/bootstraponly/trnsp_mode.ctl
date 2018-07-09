[ select count(*) row_count
    from trnsp_mode 
   where trnsp_mode = '@trnsp_mode@' ]
|
if (@row_count > 0)
{
    [ update trnsp_mode 
         set trnsp_mode = '@trnsp_mode@',
             sml_pkg_flg = to_number('@sml_pkg_flg@'),
             dir_flg = to_number('@dir_flg@'),
	     palletctl_flg = to_number('@palletctl_flg@'),
             ins_dt = sysdate,
             last_upd_dt = sysdate,
             ins_user_id = 'LOAD',
             last_upd_user_id = 'LOAD'
       where trnsp_mode = '@trnsp_mode@' ] 
}
else
{ 
    [ insert into trnsp_mode 
         (trnsp_mode,
          sml_pkg_flg,
          dir_flg,
          tst_trans_serv_id,
	  palletctl_flg,
          u_version,
          ins_dt,
          last_upd_dt,
          ins_user_id,
          last_upd_user_id) 
        values 
          ('@trnsp_mode@',
           to_number('@sml_pkg_flg@'),
           to_number('@dir_flg@'),
           '@tst_trans_serv_id@',
	   to_number('@palletctl_flg@'),
           1,
           sysdate,
           sysdate,
           'LOAD',
           'LOAD') ]
}
