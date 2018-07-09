[ select count(*) row_count 
    from rulmst 
   where rule_nam = '@rule_nam@' ]
   | 
  
    if (@row_count > 0) 
    { 
         change rule 
           where rule_nam   = '@rule_nam@'
             and summary_cmd = '@summary_cmd@'
	     and cancel_cmd = '@cancel_cmd@'
             and lngdsc     = '@lngdsc@'
             and short_dsc  = '@short_dsc@'
	     and locale_id  = 'US_ENGLISH'
    }  
    else 
    { 
        create rule
         where rule_nam   = '@rule_nam@'
           and summary_cmd = '@summary_cmd@'
	   and cancel_cmd = '@cancel_cmd@'
           and locale_id = 'US_ENGLISH'
           and lngdsc    = '@lngdsc@'
           and short_dsc = '@short_dsc@'
    } 
