[ select count(*) row_count 
    from pckbat 
   where schbat = '@schbat@' ] | 

    if (@row_count > 0) 
    { 
        [ update pckbat 
             set schbat = '@schbat@',
                 pricod = '@pricod@',
                 batcod = '@batcod@',
                 lblsst = '@lblsst@',
                 adddte = to_date('@adddte@','YYYYMMDDHH24MISS'),
                 rpldte = to_date('@rpldte@','YYYYMMDDHH24MISS'),
                 reldte = to_date('@reldte@','YYYYMMDDHH24MISS'),
                 cmpdte = to_date('@cmpdte@','YYYYMMDDHH24MISS'),
	         numsls = to_number ('@numsls@'),
	         totpcs = to_number ('@totpcs@'),
	         numstc = to_number ('@numstc@'),
	         numppk = to_number ('@numppk@'),
	         numcpk = to_number ('@numcpk@'),
	         numpck = to_number ('@numpck@'),
	         palvol = to_number ('@palvol@'),
	         estpal = to_number ('@estpal@'),
	         estwgt = to_number ('@estwgt@'),
                 moddte = to_date('@moddte@','YYYYMMDDHH24MISS'),
                 mod_usr_id = '@mod_usr_id@',
                 batsts = '@batsts@',
                 wave_prc_flg = to_number('@wave_prc_flg@'),
                 rule_nam = '@rule_nam@',
                 wh_id = '@wh_id@'
           where schbat = '@schbat@' ]
    }  
    else 
    { 
        [ insert into pckbat
             (schbat, pricod, batcod, lblsst, 
	      adddte, rpldte, 
	      reldte, cmpdte, 
	      numsls, totpcs, numstc, numppk, 
	      numcpk, numpck, palvol, estpal,
	      estwgt, moddte, mod_usr_id,
              batsts, wave_prc_flg, rule_nam, wh_id)
            values 
             ('@schbat@', '@pricod@', '@batcod@', '@lblsst@', 
	      to_date('@adddte@','YYYYMMDDHH24MISS'),
	      to_date('@rpldte@','YYYYMMDDHH24MISS'),
	      to_date('@reldte@','YYYYMMDDHH24MISS'),
	      to_date('@cmpdte@','YYYYMMDDHH24MISS'),
              to_number('@numsls@'), to_number('@totpcs@'),
	      to_number('@numstc@'), to_number('@numppk@'), 
	      to_number('@numcpk@'), to_number('@numpck@'),
	      to_number('@palvol@'), to_number('@estpal@'),
	      to_number('@estwgt@'), to_date('@moddte@','YYYYMMDDHH24MISS'),
              '@mod_usr_id@',
              '@batsts@',
              to_number('@wave_prc_flg@'),
              '@rule_nam@',
              '@wh_id@') ] 
    } 
