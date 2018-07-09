[ select count(*) row_count
    From brk_stop_seq
   where brk_stop_seq_cod = '@brk_stop_seq_cod@']
   
  |
  
  if (@row_count > 0)
  {
      [ update brk_stop_seq
           set seqnum = '@seqnum@'
         where brk_stop_seq_cod = '@brk_stop_seq_cod@']
  }
  Else
  {
      [ insert into brk_stop_seq
          (brk_stop_seq_cod, seqnum)
        Values
          ('@brk_stop_seq_cod@', to_number('@seqnum@'))]
  }
