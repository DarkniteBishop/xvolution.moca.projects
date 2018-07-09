[ select count(*) row_count 
    from cancod 
   where codval = '@codval@' ] 
| 
 
if (@row_count > 0) 
{ 
    [ update cancod 
         set codval = '@codval@',
             srtseq = @srtseq@,
             reaflg = to_number('@reaflg@'),
             alctyp = '@alctyp@',
             defflg = to_number('@defflg@'),
             rftflg = to_number('@rftflg@'),
             reuse_locflg = to_number('@reuse_locflg@'),
             cyc_cnt_cod = '@cyc_cnt_cod@',
             voc_cod = @voc_cod@,
             unassign_flg = to_number('@unassign_flg@'),             
             stage_shpflg = to_number('@stage_shpflg@')
       where codval = '@codval@' ] 
}
else 
{ 
    [ insert into cancod
         (codval, srtseq, reaflg, alctyp, defflg, rftflg,reuse_locflg,
          cyc_cnt_cod, voc_cod, unassign_flg, stage_shpflg)
       values
         ('@codval@', @srtseq@, to_number('@reaflg@'), '@alctyp@',
          to_number('@defflg@'), to_number('@rftflg@'),
          to_number('@reuse_locflg@'), '@cyc_cnt_cod@', @voc_cod@,
          to_number('@unassign_flg@'), to_number('@stage_shpflg@'))]
} 
