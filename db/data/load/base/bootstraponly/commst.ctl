[select count(*) row_count 
   from commst 
  where comcod = '@comcod@']
|
if (@row_count > 0) 
{
    [update commst
       set  comcod = '@comcod@',
            ltlcls = '@ltlcls@',
            stccod = '@stccod@'
     where  comcod = '@comcod@'
    ] 
}
else
{
    [insert into commst
    (comcod, ltlcls, stccod)
     VALUES 
       ('@comcod@', '@ltlcls@', '@stccod@')]
}