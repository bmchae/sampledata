SELECT
    I_YYYYMMDD,
    I_NCN,
    max(I_MODEL_SER_CLS)  i_protocol_rev,
    max(I_TERMINAL_CAP)   i_terminal_cap,
    sum(voice_out_comp  ) voice_out_comp  ,
    sum(voice_out_ncomp ) voice_out_ncomp ,
    sum(voice_out_drop  ) voice_out_drop  ,
    sum(voice_out_try   ) voice_out_try   ,
    sum(amt_out_call    ) amt_out_call    ,
    sum(voice_in_comp   ) voice_in_comp   ,
    sum(voice_in_ncomp  ) voice_in_ncomp  ,
    sum(voice_in_drop   ) voice_in_drop   ,
    sum(voice_in_try    ) voice_in_try    ,
    sum(amt_in_call     ) amt_in_call     ,
    sum(comp_in_amt_call) comp_in_amt_call,
    sum(comp_out_amt_call) comp_out_amt_call
FROM
 (SELECT 
        to_char(i_call_dt,'yyyyMMdd') I_YYYYMMDD,
        I_NCN,
        ''I_MODEL_SER_CLS,
        I_TERMINAL_CAP,
        0 voice_out_comp,     
        0 voice_out_ncomp,     
        0 voice_out_drop,    
        0 amt_out_call,    
        0 voice_out_try,    
        0 voice_in_comp,    
        0 voice_in_ncomp,   
        0 voice_in_drop,     
        0  amt_in_call,    
        0 voice_in_try,    
        0 comp_in_amt_call,    
        0 comp_out_amt_call   
FROM      Z_SQD_WCD_VOICE_001 K1
WHERE   to_date(i_etl_dt)  = '2011-07-14'
AND     to_date(i_call_dt) >= '2011-07-14'
AND     to_date(i_call_dt) <  date_add('2011-07-14',1)
AND   VALID_CNT='1' 
    and I_CELL <> '255' and I_CELL IS NOT NULL
    and I_BSC  <> '255' and I_BSC IS NOT NULL
    and I_INOUT  in ('0','1')
UNION ALL
SELECT 
        to_char(i_call_dt,'yyyyMMdd') I_YYYYMMDD,
        I_NCN,
        I_MODEL_SER_CLS,
        I_TERMINAL_CAP,
        CASE WHEN i_inout = '0' AND i_cfc_type IN ('1','2') THEN
                cast(1 as BIGINT)
                ELSE
                cast(0 as BIGINT)
        END  voice_out_comp, 
        case when I_INOUT = '0' and I_CFC_TYPE = '3' then
                cast(1 as BIGINT)
                else
                cast(0 as BIGINT)
        END  voice_out_ncomp, 
        CASE WHEN i_inout = '0' AND i_cfc_type ='2' THEN
                cast(1 as BIGINT)
                ELSE
                cast(0 as BIGINT)
        END  voice_out_drop, 
        CASE WHEN i_inout = '0'  THEN
                amt_call
                ELSE
                cast(0 as BIGINT)
        END amt_out_call, 
        CASE WHEN i_inout = '0'  THEN
                cast(1 as BIGINT)
                ELSE
                cast(0 as BIGINT)
        END  voice_out_try, 
        CASE WHEN i_inout = '1' AND i_cfc_type IN ('1','2') THEN
                cast(1 as BIGINT)
                ELSE
                cast(0 as BIGINT)
        END  voice_in_comp, 
        CASE WHEN i_inout = '1' AND i_cfc_type = '3' THEN
                cast(1 as BIGINT)
                ELSE
                cast(0 as BIGINT)
        END  voice_in_ncomp, 
        CASE WHEN i_inout = '1' AND i_cfc_type = '2' THEN
                cast(1 as BIGINT)
                ELSE
                cast(0 as BIGINT)
        END  voice_in_drop, 
        CASE WHEN i_inout = '1'  THEN
                amt_call
                ELSE
                cast(0 as BIGINT)
        END  amt_in_call, 
        CASE WHEN i_inout = '1'  THEn
                cast(1 as BIGINT)
                ELSE
                cast(0 as BIGINT)
        END  voice_in_try, 
        CASE WHEN i_inout = '1' AND i_cfc_type IN ('1','2') THEN
                amt_call
                ELSE
                cast(0 as BIGINT)
        END  comp_in_amt_call, 
        CASE WHEN i_inout = '0' AND i_cfc_type IN ('1','2') THEN
                amt_call
                ELSE
                cast(0 as BIGINT)
        END  comp_out_amt_call 
FROM      SRF_VOICE_NEW K1
WHERE to_date(i_etl_dt)  = '2011-07-14'
AND     to_date(i_call_dt) >= '2011-07-14'
AND     to_date(i_call_dt) <  date_add('2011-07-14',1)
        and I_CELL <> '255' and I_CELL IS NOT NULL
        and I_BSC  <> '255' and I_BSC IS NOT NULL
        and I_INOUT  in ('0','1')
        and ((i_service_grp  = '1' AND i_service = '0')
            OR (i_service_grp  = '2' AND i_service in ('61','62','63','64','65','66','67','68','69','70')))
) A
GROUP BY I_YYYYMMDD , i_ncn
