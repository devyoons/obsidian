-- SMS, 팝업 미발송
UPDATE T_AFMF_SMS_STUP01M1 SET SMS_LTRS_TRNM_YN = 'N', USE_YN = 'N'
 WHERE 1=1
   AND INSR_SEQ IN (
                    SELECT INSR_SEQ
                      FROM (
                            SELECT TASSM.INSR_SEQ
                              FROM T_AFMF_SMS_STUP01M1 TASSM, T_AFMF_TNRM_INSR01M1 TATIM
                             WHERE 1=1
                               AND TASSM.INSR_SEQ = TATIM.INSR_SEQ
                               AND TATIM.TUNL_CD IN ('40608')
                               AND TATIM.TNRM_MCHN_CLSS_CD IN ('0101', '0202', '0706', '0803', '0808')
                           )
                   )
;

-- SMS 차단
UPDATE T_AFMF_RPTR_MPNG01M1 SET USE_YN = 'T'
 WHERE TUNL_CD IN ('50504');

-- 디밍 키 변경
UPDATE T_AFMF_OPND_INSR_MPNG01M1 SET MPNG_CD = 'dm2_001'
 WHERE 1=1
   AND INSR_SEQ IN (
                    SELECT INSR_SEQ
                      FROM (
                            SELECT TAOIM.INSR_SEQ
                              FROM T_AFMF_OPND_INSR_MPNG01M1 TAOIM, T_AFMF_TNRM_INSR01M1 TATIM
                             WHERE 1=1
                               AND TAOIM.INSR_SEQ = TATIM.INSR_SEQ
                               AND TATIM.TUNL_CD IN ('50504')
                               AND TATIM.TNRM_MCHN_CLSS_CD = 0422
                           )
                   )
;

-- 디밍부가장치 키 변경
UPDATE T_AFMF_OPND_INSR_MPNG01M1 SET MPNG_CD = 'dmae2_001' 
 WHERE 1=1
   AND INSR_SEQ IN (
                    SELECT INSR_SEQ
                      FROM (
                            SELECT TAOIM.INSR_SEQ
                              FROM T_AFMF_OPND_INSR_MPNG01M1 TAOIM, T_AFMF_TNRM_INSR01M1 TATIM
                             WHERE 1=1
                               AND TAOIM.INSR_SEQ = TATIM.INSR_SEQ
                               AND TATIM.TUNL_CD IN ('50504')
                               AND TATIM.TNRM_MCHN_CLSS_CD = 0423
                           )
                   )
;

--COMMIT;