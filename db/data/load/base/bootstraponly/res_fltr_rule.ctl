get installed configuration where config = 'WM'
|
if(@installed = 1)
{
[ select count(*) row_count 
    from res_fltr_rule 
   where res_key = '@res_key@' 
     and res_val = '@res_val@'
     and arg_key = '@arg_key@'
     and arg_val = '@arg_val@']  
}
|
if (@installed and @row_count > 0) 
{ 
    [ update res_fltr_rule 
         set incl_flg = '@incl_flg@'
       where res_key = '@res_key@' 
         and res_val = '@res_val@'
         and arg_key = '@arg_key@'
         and arg_val = '@arg_val@' ] 
}  
else if(@installed)
{ 
    [ insert into res_fltr_rule 
         (res_key, 
          res_val, 
          arg_key, 
          arg_val, 
          incl_flg, 
          ins_dt, 
          last_upd_dt, 
          ins_user_id, 
          last_upd_user_id)
       values 
         ('@res_key@', 
'@res_val@', 
'@arg_key@', 
'@arg_val@', 
to_number('@incl_flg@'), 
sysdate,
sysdate,
'MLOAD',
'MLOAD')] 
} 
