[ select count(*) row_count
  from invtypmst
  where invtyp = '@invtyp@' ]

  |

  if (@row_count > 0)
  {
      [ update invtypmst
          set invtyp = '@invtyp@',
	  bill_anvstg_flg = '@bill_anvstg_flg@',
          retflg = '@retflg@',
          delvflg = '@delvflg@',
          std_put_flg = '@std_put_flg@'
        where invtyp = '@invtyp@' ]
  }
  else
  {
      [ insert into invtypmst
          (invtyp, bill_anvstg_flg, retflg, delvflg, std_put_flg)
           values
             ('@invtyp@', '@bill_anvstg_flg@', '@retflg@', '@delvflg@', '@std_put_flg@') ]
  }
