Attribute VB_Name = "Module1"
[ select count(*) row_count
    from bldg_mst 
   where bldg_id = '@bldg_id@' ] 
   
  | 
  
  if (@row_count > 0) 
  { 
      [ update bldg_mst 
           set bldg_id = '@bldg_id@',
               business_unt = '@business_unt@',
               adr_id = '@adr_id@',
               wh_id = '@wh_id@',
               fluid_load_flg = to_number('@fluid_load_flg@'),
               sort_attr_locsts = '@sort_attr_locsts@',
               sort_default_flg = to_number('@sort_default_flg@')
         where bldg_id = '@bldg_id@' ] 
  }  
  else 
  { 
      [ insert into bldg_mst 
          (bldg_id, business_unt, adr_id, wh_id, fluid_load_flg, sort_attr_locsts, sort_default_flg)
        values 
          ('@bldg_id@', '@business_unt@', '@adr_id@', '@wh_id@', to_number('@fluid_load_flg@'), '@sort_attr_locsts@', to_number('@sort_default_flg@')) ]
  } 
