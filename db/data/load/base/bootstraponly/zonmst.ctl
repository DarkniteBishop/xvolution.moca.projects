[ select count(*) row_count
    From zonmst
   where wh_id = '@wh_id@'
     and wrkzon = '@wrkzon@' ]
   
  |
  
  if (@row_count > 0)
  {
      [ update zonmst
           set wh_id = '@wh_id@',
               wrkzon = '@wrkzon@',
               wrkare = '@wrkare@',
               maxdev = '@maxdev@',
               oosflg = '@oosflg@',
               trvseq = '@trvseq@',
               prithr = '@prithr@',
               maxprithr = '@maxprithr@',
               moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
               mod_usr_id = '@mod_usr_id@'
         where wh_id = '@wh_id@' and wrkzon = '@wrkzon@' ]
  }
  Else
  {
      [ insert into zonmst
          (wh_id, wrkzon, wrkare, maxdev, oosflg, trvseq, prithr, maxprithr, moddte, mod_usr_id)
        Values
          ('@wh_id@', '@wrkzon@', '@wrkare@', '@maxdev@', '@oosflg@', '@trvseq@', '@prithr@', '@maxprithr@', to_date('@moddte@', 'YYYYMMDDHH24MISS'), '@mod_usr_id@') ]
  }
