[ select count(*) row_count from cstmst where
    client_id = '@client_id@' and cstnum = '@cstnum@' ] | if (@row_count > 0) {
       [ update cstmst set
          client_id = '@client_id@'
,          cstnum = '@cstnum@'
,          adr_id = '@adr_id@'
,          bckflg = to_number('@bckflg@')
,          parflg = to_number('@parflg@')
,          carflg = to_number('@carflg@')
,          splflg = to_number('@splflg@')
,          stdflg = to_number('@stdflg@')
,          shplbl = '@shplbl@'
,          shipby = '@shipby@'
,          cargrp = '@cargrp@'
,          manfid = '@manfid@'
,          deptno = '@deptno@'
,          ordinv = '@ordinv@'
,          requir_tms_cod = '@requir_tms_cod@'
,          trk_shp_flg = to_number('@trk_shp_flg@')
,          pltbld_consby = '@pltbld_consby@'
,          grp_nam = '@grp_nam@'
,          mc_csttyp = '@mc_csttyp@'
,          mc_invsts_prg = '@mc_invsts_prg@'
,          mc_frscod = '@mc_frscod@'
,          mc_min_shelf_hrs = to_number('@mc_min_shelf_hrs@')
,          mc_rsvpri = '@mc_rsvpri@'
,          acct_chkdigit = to_number('@acct_chkdigit@')
,          acct_num_len = to_number('@acct_num_len@')
,          lod_tag_sngle_encode = '@lod_tag_sngle_encode@'
,          lod_tag_mix_encode = '@lod_tag_mix_encode@'
,          sub_tag_sngle_encode = '@sub_tag_sngle_encode@'
,          sub_tag_mix_encode = '@sub_tag_mix_encode@'
,          urn_format = '@urn_format@'
,          asn_sys = '@asn_sys@'
,          store_typ = '@store_typ@'
,          store_grp = '@store_grp@'
,          concept_code = '@concept_code@'
,          early_dlv_thresh = to_number('@early_dlv_thresh@')
,          late_dlv_thresh = to_number('@late_dlv_thresh@')
,          ord_split_flg = to_number('@ord_split_flg@')
,          line_split_flg = to_number('@line_split_flg@')
,          ovr_shp_tol = to_number('@ovr_shp_tol@')
,          ovr_shp_tol_pct = to_number('@ovr_shp_tol_pct@')
,          und_shp_tol = to_number('@und_shp_tol@')
,          und_shp_tol_pct = to_number('@und_shp_tol_pct@')
,          transit_serv_id = '@transit_serv_id@'
,          sf_ovr_flg = to_number('@sf_ovr_flg@')
,          early_dlv_thresh_flg = to_number('@early_dlv_thresh_flg@')
,          late_dlv_thresh_flg = to_number('@late_dlv_thresh_flg@')
,          und_shp_tol_cod = '@und_shp_tol_cod@'
,          ovr_shp_tol_cod = '@ovr_shp_tol_cod@'
,          shp_mod_rule_cod = '@shp_mod_rule_cod@'
,          alc_search_path = '@alc_search_path@'
,          shp_meas_ovr_flg = to_number('@shp_meas_ovr_flg@')
,          req_shp_wgt_flg = to_number('@req_shp_wgt_flg@')
,          req_shp_cube_flg = to_number('@req_shp_cube_flg@')
,          req_shp_pal_flg = to_number('@req_shp_pal_flg@')
,          req_shp_cas_flg = to_number('@req_shp_cas_flg@')
,          req_shp_misc_flg = to_number('@req_shp_misc_flg@')
,          req_shp_misc2_flg = to_number('@req_shp_misc2_flg@')
,          abs_ordinv_win = to_number('@abs_ordinv_win@')
,          abs_ordinv_code = '@abs_ordinv_code@'
             where  client_id = '@client_id@' and cstnum = '@cstnum@' ] }
             else { [ insert into cstmst
                      (client_id, cstnum, adr_id, bckflg, parflg, carflg, splflg, stdflg, shplbl, shipby, cargrp, manfid, deptno, ordinv, requir_tms_cod, trk_shp_flg, pltbld_consby, grp_nam, mc_csttyp, mc_invsts_prg, mc_frscod, mc_min_shelf_hrs, mc_rsvpri, acct_chkdigit, acct_num_len, lod_tag_sngle_encode, lod_tag_mix_encode, sub_tag_sngle_encode, sub_tag_mix_encode, urn_format, asn_sys, store_typ, store_grp, concept_code, early_dlv_thresh, late_dlv_thresh, ord_split_flg, line_split_flg, ovr_shp_tol, ovr_shp_tol_pct, und_shp_tol, und_shp_tol_pct, transit_serv_id, sf_ovr_flg, early_dlv_thresh_flg, late_dlv_thresh_flg, und_shp_tol_cod, ovr_shp_tol_cod, shp_mod_rule_cod, alc_search_path, shp_meas_ovr_flg, req_shp_wgt_flg, req_shp_cube_flg, req_shp_pal_flg, req_shp_cas_flg, req_shp_misc_flg, req_shp_misc2_flg, abs_ordinv_win, abs_ordinv_code)
                      VALUES
                      ('@client_id@', '@cstnum@', '@adr_id@', to_number('@bckflg@'), to_number('@parflg@'), to_number('@carflg@'), to_number('@splflg@'), to_number('@stdflg@'), '@shplbl@', '@shipby@', '@cargrp@', '@manfid@', '@deptno@', '@ordinv@', '@requir_tms_cod@', to_number('@trk_shp_flg@'), '@pltbld_consby@', '@grp_nam@', '@mc_csttyp@', '@mc_invsts_prg@', '@mc_frscod@', to_number('@mc_min_shelf_hrs@'), '@mc_rsvpri@', to_number('@acct_chkdigit@'), to_number('@acct_num_len@'), '@lod_tag_sngle_encode@', '@lod_tag_mix_encode@', '@sub_tag_sngle_encode@', '@sub_tag_mix_encode@', '@urn_format@', '@asn_sys@', '@store_typ@', '@store_grp@', '@concept_code@', to_number('@early_dlv_thresh@'), to_number('@late_dlv_thresh@'), to_number('@ord_split_flg@'), to_number('@line_split_flg@'), to_number('@ovr_shp_tol@'), to_number('@ovr_shp_tol_pct@'), to_number('@und_shp_tol@'), to_number('@und_shp_tol_pct@'), '@transit_serv_id@', to_number('@sf_ovr_flg@'), to_number('@early_dlv_thresh_flg@'), to_number('@late_dlv_thresh_flg@'), '@und_shp_tol_cod@', '@ovr_shp_tol_cod@', '@shp_mod_rule_cod@', '@alc_search_path@', to_number('@shp_meas_ovr_flg@'), to_number('@req_shp_wgt_flg@'), to_number('@req_shp_cube_flg@'), to_number('@req_shp_pal_flg@'), to_number('@req_shp_cas_flg@'), to_number('@req_shp_misc_flg@'), to_number('@req_shp_misc2_flg@'), to_number('@abs_ordinv_win@'), '@abs_ordinv_code@') ] }
