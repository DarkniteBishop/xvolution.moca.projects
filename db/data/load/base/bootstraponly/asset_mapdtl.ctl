[ select count(*) row_count 
    from asset_mapdtl 
   where map_dtl_id = '@map_dtl_id@' ] 
| 
if (@row_count > 0) 
{ 
    [ update asset_mapdtl 
         set map_dtl_id   = '@map_dtl_id@',
             map          = '@map@', 
             dsp_type     = '@dsp_type@',
             dsp_target   = '@dsp_target@',
             dsp_width    = '@dsp_width@',
             dsp_height   = '@dsp_height@',
             dsp_top      = '@dsp_top@',
             dsp_left     = '@dsp_left@',
             target_typ   = '@target_typ@',
             target_obj   = '@target_obj@',
             draw_seq     = '@draw_seq@'
       where map_dtl_id   = '@map_dtl_id@'] 
}  
else 
{ 
    [ insert into asset_mapmst 
          (map_dtl_id, map, dsp_type, dsp_target, dsp_width, 
           dsp_height, dsp_top, dsp_left, target_typ,
           target_obj, draw_seq) 
        values 
          ('@map_dtl_id@', '@map@', '@dsp_type@', '@dsp_target@', '@dsp_width@', 
           '@dsp_height@', '@dsp_top@', '@dsp_left@', '@target_typ@',
           '@target_obj@', '@draw_seq@') ]
}