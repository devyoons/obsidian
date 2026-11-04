CREATE OR REPLACE PROCEDURE TER_MAIN."P_MAKE_MACHINE_DEVICE"
(
    INPUT_TNCODE          IN VARCHAR2
   ,INPUT_MACHINECODE     IN VARCHAR2
)
IS
    MAXSEQ                NUMBER(10)    :=  0;
    V_MSG                 VARCHAR2(200) := '';

CURSOR MY_CUR1 IS
            SELECT COUNT(*) CNT
              FROM T_AFMF_OPND_INSR01M1
             WHERE 1=1
               AND TUNL_CD = INPUT_TNCODE
            ;

C1 MY_CUR1%ROWTYPE;

BEGIN

        IF SQL%ROWCOUNT > 0 THEN
            COMMIT;
            -- 기존터널자료 삭제
            DELETE FROM T_AFMF_TNRM_INSR01M1
            WHERE 1=1
              AND TUNL_CD           = INPUT_TNCODE
              AND TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE;
        END IF;

        OPEN MY_CUR1;

        LOOP

        FETCH MY_CUR1 INTO C1;
        EXIT WHEN MY_CUR1%NOTFOUND;

        BEGIN

          DELETE FROM T_AFMF_TNRM_INSR01M1
           WHERE 1=1
             AND TUNL_CD           = INPUT_TNCODE
             AND TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE;

            SELECT MAX(INSR_SEQ)+10 
              INTO MAXSEQ 
              FROM T_AFMF_TNRM_INSR01M1;

            INSERT INTO T_AFMF_TNRM_INSR01M1 (
                                                INSR_SEQ               
                                              , TUNL_CD         
                                              , TNRM_EQPMT_CLSS_CD     
                                              , TNRM_MCHN_CLSS_CD     
                                              , TNRM_MCHN_SQNO     
                                              , TNRM_INSL_LOCT_LCLSS_CD
                                              , TNRM_INSL_LOCT_MCLSS_CD
                                              , DETL_LOCT_NM         
                                              , MODL_NM         
                                              , INSL_STAT_VAL         
                                              , TNRM_INSR_ID         
                                              , TNRM_INSR_DETL_ID     
                                              , EVNT_USE_YN         
                                              , RPLC_DATES         
                                              , RMRK_CTNT         
                                              , MDBS_ADDR         
                                              , PLC_IP_ADDR         
                                              , PLC_PORT_NO         
                                              , PLC_FILD_INSR_NO     
                                              , ELTR_INSR_CLSS_CD     
                                              , RPLC_RESN         
                                              , EQPMT_ID         
                                              , ODNW_TUNL_CLSS_CD     
                                              , USE_YN
                                              , FSTTM_RGSR_ID
                                              , FSTTM_RGST_DTTM
                                              , LSTTM_MODFR_ID
                                              , LSTTM_ALTR_DTTM                                              
                                            )
                                            
            SELECT INSR_SEQ               
                 , TUNL_CD                
                 , TNRM_EQPMT_CLSS_CD     
                 , TNRM_MCHN_CLSS_CD      
                 , TNRM_MCHN_SQNO         
                 , TNRM_INSL_LOCT_LCLSS_CD
                 , TNRM_INSL_LOCT_MCLSS_CD
                 , DETL_LOCT_NM           
                 , MODL_NM                
                 , INSL_STAT_VAL          
                 , TNRM_INSR_ID           
                 , TNRM_INSR_DETL_ID      
                 , EVNT_USE_YN            
                 , REPR_DATES             
                 , RMRK_CTNT              
                 , MDBS_ADDR              
                 , PLC_IP_ADDR            
                 , PLC_PORT_NO            
                 , PLC_FILD_INSR_NO       
                 , ELTR_INSR_CLSS_CD      
                 , CHNG_RESN_CTNT         
                 , EQPMT_ID               
                 , '0'                
                 , USE_YN
                 , 'system'
                 , SYSDATE
                 , 'system'
                 , SYSDATE                 
            FROM 
                 (
                  SELECT MAXSEQ + INSR_SEQ AS INSR_SEQ
                       , TUNL_CD
                       , TNRM_EQPMT_CLSS_CD
                       , TNRM_MCHN_CLSS_CD
                       , TNRM_MCHN_SQNO
                       , TNRM_INSL_LOCT_LCLSS_CD
                       , TNRM_INSL_LOCT_MCLSS_CD
                       , DETL_LOCT_NM
                       , MODL_NM          
                       , INSL_STAT_VAL    
                       , TNRM_INSR_ID     
                       , TNRM_INSR_DETL_ID
                       , EVNT_USE_YN      
                       , REPR_DATES       
                       , RMRK_CTNT        
                       , DECODE(TNRM_MCHN_CLSS_CD, 101, 10000, 102, 11360, 103, 11660, 104, 11280, 105, 11420,
                                                   201, 11700, 202, 11860, 203, 11990, 204, 12090, 205, 12190,
                                                   301, 12250, 302, 12270, 303, 12350, 304, 12450, 305, 12470,306, 12550, 307, 12630, 308, 14240, 309, 14250, 310, 14260,
                                                   401, 14280, 402, 14380, 403, 19430, 404, 19450, 405, 19470, 406, 19610, 407, 19630, 408, 20500, 409, 20680, 410, 20720, 411, 20760, 412, 20800, 413, 21540, 414, 21560, 415, 21580, 416, 21584, 417, 21050, 418, 21300, 419, 18380, 420, 28200, 421, 28710, 422, 28800, 423, 29600, 424, 31800, 425, 26560, 426, 20240,
                                                   501, 21600, 502, 23100, 503, 25480, 
                                                   601, 23120,602, 23240, 603, 23300, 604, 23360, 605, 23420, 606, 23480,607, 23540, 608, 23780, 609, 24020, 610, 24840,
                                                   611, 24860,612, 24880, 613, 24900, 614, 24920, 615, 24960, 616, 25020,617, 25080, 618, 25100, 619, 25560, 620, 25600,
                                                   701, 25620,702, 26040, 703, 26780, 704, 27080, 705, 27200, 706, 27270, 
                                                   801, 27280, 802, 27300,803, 27380, 804, 27400, 805, 27620, 806, 27640, 807, 27642, 808, 27700, 809, 28010, 811, 27540, TNRM_MCHN_CLSS_CD) +
                         DECODE(TNRM_MCHN_CLSS_CD, 101, 8, 102, 12, 103, 8, 104, 8, 105, 24,
                                                   201, 7, 202, 4, 203, 6, 204, 7, 205, 1,
                                                   301, 2, 302, 1, 303, 1, 304, 1, 305, 1, 306, 1, 307, 2, 308, 1, 309, 2, 310, 2,
                                                   401, 2, 402, 50, 403, 1,404, 1, 405, 5, 406, 1, 407, 50, 408, 2,409, 1, 410, 4, 411, 3, 412, 1, 413, 1, 414, 1, 415, 1, 416, 2, 417, 1, 418, 30, 419, 50, 420, 50, 421, 2, 422, 70, 423, 90, 424, 50, 425, 10, 426, 16,
                                                   501, 10, 502, 2, 503, 7,
                                                   601, 8,602, 8, 603, 8, 604, 8, 605, 8, 606, 8, 607, 8, 608, 8, 609, 10, 610, 2,
                                                   611, 2,612, 2, 613, 2, 614, 2, 615, 2, 616, 8,617, 8, 618, 3, 619, 1, 620, 1,
                                                   701, 6,702, 9, 703, 2, 704, 29, 705, 3, 706, 2,
                                                   801, 9, 802, 43, 803, 4, 804, 140, 805, 4, 806, 2, 807, 2, 808, 38, 809, 2, 811, 13, TNRM_MCHN_CLSS_CD) *
                         CASE WHEN TNRM_MCHN_CLSS_CD = 302 OR TNRM_MCHN_CLSS_CD = 303 OR TNRM_MCHN_CLSS_CD = 304 OR TNRM_MCHN_CLSS_CD = 305 OR TNRM_MCHN_CLSS_CD = 306 OR 
                                   TNRM_MCHN_CLSS_CD = 308 OR TNRM_MCHN_CLSS_CD = 403 OR TNRM_MCHN_CLSS_CD = 404 OR TNRM_MCHN_CLSS_CD = 406 OR TNRM_MCHN_CLSS_CD = 413 OR 
                                   TNRM_MCHN_CLSS_CD = 414 OR TNRM_MCHN_CLSS_CD = 415 OR TNRM_MCHN_CLSS_CD = 620 
                                   THEN  FLOOR(TNRM_MCHN_SQNO/16) + MOD(TNRM_MCHN_SQNO,16)/100
                              ELSE TNRM_MCHN_SQNO
                          END MDBS_ADDR        
                       , PLC_IP_ADDR      
                       , PLC_PORT_NO      
                       , '1' AS PLC_FILD_INSR_NO 
                       , ELTR_INSR_CLSS_CD
                       , CHNG_RESN_CTNT   
                       , EQPMT_ID         
                       , MPNG_CD          
                       , USE_YN
                       , RANK () OVER (PARTITION BY TM.TUNL_CD, TM.TNRM_MCHN_CLSS_CD, TM.TNRM_MCHN_SQNO ORDER BY TM.MPNG_CD ASC) AS RANK_SEQ
                    FROM T_AFMF_OPND_INSR01M1 TM
                   WHERE 1=1
                     AND TUNL_CD           = INPUT_TNCODE
                     AND TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE
                   ORDER BY INSR_SEQ
                 )
           WHERE RANK_SEQ = 1
           ;


        END;


        COMMIT;

    END LOOP;
    CLOSE MY_CUR1;


EXCEPTION
    WHEN OTHERS THEN
        V_MSG := SUBSTR(SQLERRM, 1, 100);
        ROLLBACK;

        INSERT INTO TERIF_MAIN.TB_BATCH_RESULT
        VALUES ('MAKE_MACHINE_DEVICE 배치', 'P_MAKE_MACHINE_DEVICE', 0,'에러발생', V_MSG, SYSDATE );
        COMMIT;
END P_MAKE_MACHINE_DEVICE;
/