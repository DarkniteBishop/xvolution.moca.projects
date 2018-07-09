[ select count(*) row_count 
   from carmtx_hdr
  where carmtx_id = '@carmtx_id@' ] 
| 
if (@row_count > 0) 
{
    [ update carmtx_hdr
         set wh_id = '@wh_id@',
             seqnum = to_number('@seqnum@'),
             cargrp = '@cargrp@',
             carcod = '@carcod@',
             srvlvl = '@srvlvl@'
           where carmtx_id = '@carmtx_id@']
}
else 
{ 
    [ insert into carmtx_hdr
           ( carmtx_id, 
             wh_id,
             seqnum,
             cargrp,
             carcod,
             srvlvl )
      values
           ( to_number('@carmtx_id@'),
             '@wh_id@',
             to_number('@seqnum@'), 
             '@cargrp@',
             '@carcod@',
             '@srvlvl@') ]
}
