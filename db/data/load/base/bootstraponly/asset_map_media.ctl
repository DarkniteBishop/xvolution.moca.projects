[ select count(*) row_count 
    from asset_map_media 
   where asset_media_id = '@asset_media_id@' ] 
| 
if (@row_count > 0) 
{ 
    [ update asset_map_media 
         set asset_media_id = '@asset_media_id@',             
             media_typ      = '@media_typ@',
             media_loc      = '@media_loc@'            
       where asset_media_id = '@asset_media_id@'] 
}  
else 
{ 
    [ insert into asset_map_media 
          (asset_media_id, media_typ, media_loc) 
        values 
          ('@asset_media_id@', '@media_typ@', '@media_loc@') ]
}