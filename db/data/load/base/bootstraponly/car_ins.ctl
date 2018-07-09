[ select count(*) row_count 
    from car_ins 
   where carcod = '@carcod@' 
     and pol_num = '@pol_num@' 
     and provider_adr_id = '@provider_adr_id@' ] | 
if (@row_count > 0) 
{
   [ update car_ins set
          carcod = '@carcod@',          
          pol_num = '@pol_num@',          
          provider_adr_id = '@provider_adr_id@',          
          max_coverage_amt = to_number('@max_coverage_amt@'),          
          cargo_ins_flg = @cargo_ins_flg@,          
          liability_ins_flg = @liability_ins_flg@,          
          wrkcomp_ins_flg = @wrkcomp_ins_flg@,          
          effdte = to_date('@effdte@','YYYYMMDDHH24MISS'),          
          expdte = to_date('@expdte@','YYYYMMDDHH24MISS')
      where carcod = '@carcod@' 
        and pol_num = '@pol_num@' 
        and provider_adr_id = '@provider_adr_id@'] 
}
else 
{ 
    [ insert into car_ins
                      (carcod, pol_num, provider_adr_id, max_coverage_amt, cargo_ins_flg, liability_ins_flg, wrkcomp_ins_flg, effdte, expdte)
                      VALUES
                      ('@carcod@', '@pol_num@', '@provider_adr_id@', to_number('@max_coverage_amt@'), @cargo_ins_flg@, @liability_ins_flg@, @wrkcomp_ins_flg@, to_date('@effdte@','YYYYMMDDHH24MISS'), to_date('@expdte@','YYYYMMDDHH24MISS')) ] }
