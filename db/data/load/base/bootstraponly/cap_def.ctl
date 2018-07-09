[select count(*) row_count
   from cap_def
  where cap_cod = '@cap_cod@']
|
if (@row_count > 0)
{
    [update cap_def
        set cap_tbl           = '@cap_tbl@',
            cap_col           = '@cap_col@',
            cap_typ           = '@cap_typ@',
            cap_color         = '@cap_color@',
            cap_seq           = to_number('@cap_seq@')
     where cap_cod = '@cap_cod@']

}
else
{
    [insert into cap_def
            (cap_cod, cap_tbl, cap_col, cap_typ, cap_color, cap_seq)
     values ('@cap_cod@', '@cap_tbl@', '@cap_col@', '@cap_typ@', 
             '@cap_color@',to_number('@cap_seq@'))]
}
