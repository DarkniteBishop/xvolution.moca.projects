[ select count(*) row_count 
    from asset_mapmst 
   where map = '@map@' ] 
| 
if (@row_count > 0) 
{ 
    [ update asset_mapmst 
         set map          = '@map@',
             wh_id        = '@wh_id@',
             dsp_type     = '@dsp_type@',
             dsp_target   = '@dsp_target@',
             dsp_width    = '@dsp_width@',
             dsp_height   = '@dsp_height@',
             dsp_top      = '@dsp_top@',
             dsp_left     = '@dsp_left@',
             top_lvl      = '@top_lvl@'
       where map  = '@map@'] 
}  
else 
{ 
    [ insert into asset_mapmst 
          (map, wh_id, dsp_type, dsp_target, dsp_width, 
           dsp_height, dsp_top, dsp_left, top_lvl) 
        values 
          ('@map@', '@wh_id@', '@dsp_type@', '@dsp_target@', '@dsp_width@', 
           '@dsp_height@', '@dsp_top@', '@dsp_left@', '@top_lvl@') ]
}