[ select count(*) row_count 
   from fedex_tran_data 
  where srvnam = '@srvnam@'
    and tran_id = '@tran_id@'
    and fld_pos = @fld_pos@ ]
|
if (@row_count > 0)
{
    [ update fedex_tran_data
         set srvnam = '@srvnam@',
             tran_id = '@tran_id@',
             parnam = '@parnam@',
             parfmt = '@parfmt@',
             fld_pos = @fld_pos@,
             fld_len = to_number('@fld_len@'),
             fld_typ = to_number('@fld_typ@')
       where srvnam = '@srvnam@'
         and tran_id = '@tran_id@'
         and fld_pos = @fld_pos@ ]
}
else
{
    [ insert into fedex_tran_data
         (srvnam, tran_id, parnam, parfmt, fld_pos, fld_len, fld_typ)
      values
         ('@srvnam@', '@tran_id@', '@parnam@', '@parfmt@', @fld_pos@, to_number('@fld_len@'), to_number('@fld_typ@')) ]
}
