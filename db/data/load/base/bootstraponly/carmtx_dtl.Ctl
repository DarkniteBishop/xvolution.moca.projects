[ select count(*) row_count 
    from carmtx_dtl 
   where carmtx_id = '@carmtx_id@'
     and colnam  = '@colnam@']
|
if (@row_count > 0)
{
    [ update carmtx_dtl 
         set carmtx_id = to_number('@carmtx_id@'),
             colnam = '@colnam@',
             colval = '@colval@'
       where carmtx_id = '@carmtx_id@'
         and colnam = '@colnam@'] 
}
else
{ 
    [ insert into carmtx_dtl
        (carmtx_id,
         colnam,
         colval)
      values
         ('@carmtx_id@',
          '@colnam@',
          '@colval@')] 
}
