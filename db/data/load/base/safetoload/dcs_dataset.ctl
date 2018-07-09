[ select count(*) row_count 
  from   dcs_dataset 
  where  ds_name = '@ds_name@' ] |
if (@row_count > 0)
{ 
    [ update dcs_dataset 
      set    ds_name = '@ds_name@',
	     ds_desc = '@ds_desc@',
	     ds_dir  = '@ds_dir@',
	     ds_seq  = '@ds_seq@' 
      where  ds_name = '@ds_name@' ]
}
else
{
    [ insert into dcs_dataset (ds_name, ds_desc, ds_dir, ds_seq) 
      values ('@ds_name@', '@ds_desc@', '@ds_dir@', '@ds_seq@') ]
}
