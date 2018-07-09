[select count(*) row_count
   from trlr_usr
  where trlr_id = '@trlr_id@'
    and usr_id = '@usr_id@']
|
if (@row_count > 0)
{
    [update trlr_usr
        set trlr_id = '@trlr_id@',
            usr_id = '@usr_id@',
            lock_flg = '@lock_flg@',
            ins_dt = '@ins_dt@',
            last_upd_dt = '@last_upd_dt@',
            ins_user_id = '@ins_user_id@',
            last_upd_user_id = '@last_upd_user_id@'
      where trlr_id = '@trlr_id@'
        and usr_id = '@usr_id@']
}
else
{
    [insert into trlr_usr
            (trlr_id, usr_id, lock_flg, ins_dt, last_upd_dt, ins_user_id, last_upd_user_id)
     values
            ('@trlr_id@', '@usr_id@', '@lock_flg@', '@ins_dt@', '@last_upd_dt@', '@ins_user_id@','@last_upd_user_id@')]
}
