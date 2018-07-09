    [ select count(*) row_count
        from ptwy_last_loc
       where wh_id         = '@wh_id@'
         and arecod        = '@arecod@'
         and stoloc        = '@stoloc@'
         and prtnum        = '@prtnum@'
         and prt_client_id = '@prt_client_id@' ]
    |
    if (@row_count > 0)
    {
        [ update ptwy_last_loc
             set last_upd_dt      = sysdate,
                 last_upd_user_id = '@last_upd_user_id@'
           where wh_id            = '@wh_id@'
             and arecod           = '@arecod@'
             and stoloc           = '@stoloc@'
             and prtnum           = '@prtnum@'
             and prt_client_id    = '@prt_client_id@' ]
    }
    else
    {
        [ insert into ptwy_last_loc
             (wh_id,
              arecod,
              stoloc,
              prtnum,
              prt_client_id)
            values
              ('@wh_id@',
               '@arecod@',
               '@stoloc@',
               '@prtnum@',
               '@prt_client_id@')]
    }
