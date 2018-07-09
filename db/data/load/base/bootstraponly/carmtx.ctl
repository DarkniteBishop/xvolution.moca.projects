[ select count(*) row_count 
   from carmtx 
  where mtxcol = '@mtxcol@' 
    and mtxval = '@mtxval@' 
    and cargrp = '@cargrp@' 
    and seqnum = '@seqnum@'
    and wh_id = '@wh_id@' ] | 

    if (@row_count > 0) 
    {
        [ update carmtx 
             set mtxcol = '@mtxcol@',
                 mtxval = '@mtxval@',
                 cargrp = '@cargrp@',
                 seqnum = to_number('@seqnum@'), 
                 wh_id  = '@wh_id@',
                 carcod = '@carcod@',
                 srvlvl = '@srvlvl@',
                 numpcs = to_number('@numpcs@'), 
                 estpak = to_number('@estpak@'), 
                 estcas = to_number('@estcas@'), 
                 estpal = to_number('@estpal@'), 
                 maxgir = to_number('@maxgir@'),
                 cubvol = to_number('@cubvol@'), 
                 netwgt = to_number('@netwgt@'),
                 grswgt = to_number('@grswgt@'),
                 mod_usr_id = '@mod_usr_id@',
                 moddte = to_date('@moddte@','YYYYMMDDHH24MISS')
           where mtxcol = '@mtxcol@' 
             and mtxval = '@mtxval@' 
             and cargrp = '@cargrp@' 
             and seqnum = '@seqnum@'
             and wh_id = '@wh_id@' ] 
    }
    else 
    { 
        [ insert into carmtx
               (mtxcol, mtxval, cargrp, seqnum, wh_id, carcod, srvlvl, 
                numpcs, estpak, estcas, estpal, maxgir, cubvol, 
                netwgt, grswgt, mod_usr_id, moddte )
           values
               ('@mtxcol@', '@mtxval@', '@cargrp@', 
                 to_number('@seqnum@'), '@wh_id@', '@carcod@', '@srvlvl@', 
		 to_number('@numpcs@'), to_number('@estpak@'),
		 to_number('@estcas@'), to_number('@estpal@'),
                 to_number('@maxgir@'), to_number('@cubvol@'),
		 to_number('@netwgt@'), to_number('@grswgt@'),
		 '@mod_usr_id@', to_date('@moddte@','YYYYMMDDHH24MISS')) ]
    }
