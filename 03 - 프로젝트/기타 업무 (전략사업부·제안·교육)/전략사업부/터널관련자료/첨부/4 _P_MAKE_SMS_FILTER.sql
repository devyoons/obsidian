CREATE OR REPLACE PROCEDURE TER_MAIN.P_MAKE_SMS_FILTER
(
    INPUT_TNCODE      IN VARCHAR2
   ,INPUT_MACHINECODE IN VARCHAR2
)
IS
    MAXSEQ NUMBER(10) :=0;
    V_MSG  VARCHAR2(200) :='';

CURSOR MY_CUR1 IS
            SELECT
              COUNT(*) CNT
            FROM T_AFMF_TNRM_INSR01M1
            WHERE 1=1
            AND TUNL_CD = INPUT_TNCODE
            AND TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE
            ;

C1 MY_CUR1%ROWTYPE;

BEGIN

        IF SQL%ROWCOUNT > 0 THEN
            COMMIT;
            -- 기존터널자료 삭제
                        DELETE FROM T_AFMF_SMS_STUP01M1
                        WHERE 1=1
                          AND INSR_SEQ IN
                              (
                                SELECT INSR_SEQ
                                FROM
                                (
                                    SELECT TASSM.INSR_SEQ
                                      FROM T_AFMF_SMS_STUP01M1  TASSM, T_AFMF_TNRM_INSR01M1 TATIM
                                     WHERE 1=1
                                       AND TASSM.INSR_SEQ = TATIM.INSR_SEQ
                                       AND TATIM.TUNL_CD = INPUT_TNCODE
                                       AND TATIM.TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE
                                )
                              )
                        ;
        END IF;

        OPEN MY_CUR1;

        LOOP

        FETCH MY_CUR1 INTO C1;
        EXIT WHEN MY_CUR1%NOTFOUND;

        BEGIN

                        DELETE FROM T_AFMF_SMS_STUP01M1
                        WHERE 1=1
                          AND INSR_SEQ IN
                              (
                                SELECT INSR_SEQ
                                FROM
                                (
                                    SELECT TASSM.INSR_SEQ
                                      FROM T_AFMF_SMS_STUP01M1  TASSM, T_AFMF_TNRM_INSR01M1 TATIM
                                     WHERE 1=1
                                       AND TASSM.INSR_SEQ = TATIM.INSR_SEQ
                                       AND TATIM.TUNL_CD = INPUT_TNCODE
                                       AND TATIM.TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE
                                )
                              )
                        ;

            INSERT INTO T_AFMF_SMS_STUP01M1
            (
                INSR_SEQ
              , SMS_STUP_SEQ
              , SMS_LTRS_TRNM_YN
              , SMS_NTSD_RESN
              , USE_YN
              , FSTTM_RGSR_ID
              , FSTTM_RGST_DTTM
              , LSTTM_MODFR_ID
              , LSTTM_ALTR_DTTM
            )
            SELECT TD.INSR_SEQ
              , SQ_AFMF_SMS_STUP_PRHS01.NEXTVAL AS IDX
              , 'Y'
              , '미발송 설정후 8시간 초과로 인한 자동해제'
              , 'Y'
              , 'SYSTEM'
              , SYSDATE
              , 'SYSTEM'
              , SYSDATE
            FROM 
            (
                SELECT TD.INSR_SEQ
                FROM T_AFMF_TNRM_INSR01M1 TD
                  , T_AFMF_TNRM_INSR_PONT01M1 TP
                  , T_AFMF_EVNT01M1 TE
                WHERE TD.TUNL_CD = INPUT_TNCODE
                AND TD.TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE
                AND TD.USE_YN = 'Y'
                AND TE.EVNT_USE_YN = 'Y'
                AND TP.USE_YN = 'Y'
                AND TD.TNRM_MCHN_CLSS_CD = TP.TNRM_MCHN_CLSS_CD
                AND TP.TNRM_MCHN_CLSS_CD = TE.TNRM_MCHN_CLSS_CD
                AND TP.TNRM_TAG_ID = TE.TNRM_TAG_ID
                GROUP BY TD.INSR_SEQ
            ) TD;
                
        END;

        COMMIT;

    END LOOP;
    CLOSE MY_CUR1;

EXCEPTION
    WHEN OTHERS THEN
        V_MSG := SUBSTR(SQLERRM, 1, 100);
        ROLLBACK;

        INSERT INTO TER_MAIN.TB_BATCH_RESULT
        VALUES ('SMS_FILTER 배치', 'P_MAKE_SMS_FILTER', 0,'에러발생', V_MSG, SYSDATE );
        COMMIT;
END P_MAKE_SMS_FILTER;
/