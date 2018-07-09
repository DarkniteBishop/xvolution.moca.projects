[ select count(*) row_count 
    from carhdr 
   where carcod = '@carcod@' ] | 

    if (@row_count > 0) 
    { 
        [ update carhdr 
             set carcod = '@carcod@',
                 accnum = '@accnum@',
                 carnam = '@carnam@',
                 scacod = '@scacod@',
                 autoclsflg = '@autoclsflg@',
                 autocls_mansts = '@autocls_mansts@',
                 autocls_wait_tim = '@autocls_wait_tim@',
                 adr_id = '@adr_id@',
                 gen_pronum_flg = '@gen_pronum_flg@',
                 vndr_id = '@vndr_id@',
                 tndr_timeout = '@tndr_timeout@',
                 comm_typ = '@comm_typ@',
                 alert_comm_typ = '@alert_comm_typ@',
                 delinq_alert_flg = '@delinq_alert_flg@',
                 timeout_alert_flg = '@timeout_alert_flg@',
                 tmpr_rpt_flg = '@tmpr_rpt_flg@',
                 tmpr_rpt_interval = '@tmpr_rpt_interval@',
                 override_ins_proc_flg = '@override_ins_proc_flg@',
                 remit_to_adr_id = '@remit_to_adr_id@',
                 hrs_opr_set_id = '@hrs_opr_set_id@',
                 excp_hrs_set_id = '@excp_hrs_set_id@',
                 tolerancepct = '@tolerancepct@',
                 toleranceamt = '@toleranceamt@',
                 credithold_flg = '@credithold_flg@',
                 freightpaymode = '@freightpaymode@',
                 autoapprove_flg = '@autoapprove_flg@',
                 bankroutingnumber = '@bankroutingnumber@',
                 ontimediscountamount = '@ontimediscountamount@',
                 invoiceduedays = '@invoiceduedays@',
                 discountperioddays = '@discountperioddays@',
                 voucherlimitamount = '@voucherlimitamount@',
                 ontimediscounttype = '@ontimediscounttype@',
                 accountingcontact = '@accountingcontact@',
                 taxpayerid = '@taxpayerid@',
                 fp_ena_flg = '@fp_ena_flg@',
                 generate_appt = '@generate_appt@',
                 crncy_code = '@crncy_code@'
	   where carcod = '@carcod@' ] 
    }
    else 
    { 
        [ insert into carhdr 
            (carcod, 
             accnum, 
             carnam, 
             scacod, 
             autoclsflg, 
             autocls_mansts, 
             autocls_wait_tim, 
             adr_id, 
             gen_pronum_flg, 
             vndr_id, 
             tndr_timeout, 
             comm_typ, 
             alert_comm_typ, 
             delinq_alert_flg, 
             timeout_alert_flg, 
             tmpr_rpt_flg, 
             tmpr_rpt_interval, 
             override_ins_proc_flg, 
             remit_to_adr_id, 
             hrs_opr_set_id, 
             excp_hrs_set_id, 
             tolerancepct, 
             toleranceamt, 
             credithold_flg, 
             freightpaymode, 
             autoapprove_flg, 
             bankroutingnumber, 
             ontimediscountamount, 
             invoiceduedays, 
             discountperioddays, 
             voucherlimitamount, 
             ontimediscounttype, 
             accountingcontact, 
             taxpayerid, 
             fp_ena_flg,
             generate_appt,
             crncy_code) 
           values 
            ('@carcod@', 
             '@accnum@', 
             '@carnam@', 
             '@scacod@', 
             '@autoclsflg@', 
             '@autocls_mansts@', 
             '@autocls_wait_tim@', 
             '@adr_id@', 
             '@gen_pronum_flg@', 
             '@vndr_id@', 
             '@tndr_timeout@', 
             '@comm_typ@', 
             '@alert_comm_typ@', 
             '@delinq_alert_flg@', 
             '@timeout_alert_flg@', 
             '@tmpr_rpt_flg@', 
             '@tmpr_rpt_interval@', 
             '@override_ins_proc_flg@',  
             '@remit_to_adr_id@', 
             '@hrs_opr_set_id@', 
             '@excp_hrs_set_id@', 
             '@tolerancepct@', 
             '@toleranceamt@', 
             '@credithold_flg@', 
             '@freightpaymode@', 
             '@autoapprove_flg@', 
             '@bankroutingnumber@', 
             '@ontimediscountamount@', 
             '@invoiceduedays@', 
             '@discountperioddays@', 
             '@voucherlimitamount@', 
             '@ontimediscounttype@', 
             '@accountingcontact@', 
             '@taxpayerid@', 
             '@fp_ena_flg@',
             '@generate_appt@',
             '@crncy_code@') ] 
    } 
