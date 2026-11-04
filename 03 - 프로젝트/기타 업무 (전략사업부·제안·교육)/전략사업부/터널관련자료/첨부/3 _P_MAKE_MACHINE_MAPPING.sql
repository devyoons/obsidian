CREATE OR REPLACE PROCEDURE TER_MAIN."P_MAKE_MACHINE_MAPPING" 
(
    INPUT_TNCODE           IN VARCHAR2
   ,INPUT_MACHINECODE      IN VARCHAR2
)
IS
    MAXSEQ                 NUMBER(10) :=0;  
    V_MSG                  VARCHAR2(200) :='';
    
CURSOR MY_CUR1 IS
            SELECT COUNT(*) CNT
              FROM T_AFMF_TNRM_INSR01M1
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
        
            DELETE FROM T_AFMF_OPND_INSR_MPNG01M1
             WHERE 1=1
               AND INSR_SEQ IN (
                                SELECT INSR_SEQ
                                  FROM T_AFMF_TNRM_INSR01M1
                                 WHERE 1=1
                                   AND TUNL_CD           = INPUT_TNCODE
                                   AND TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE
                               )
            ;
            
            INSERT INTO T_AFMF_OPND_INSR_MPNG01M1 (
                                                     INSR_SEQ
                                                   , MPNG_CD
                                                   , TNRM_INSR_ID                                                   
                                                   , TNRM_INSL_LOCT_LCLSS_CD
                                                   , TNRM_MCHN_CLSS_CD
                                                   , TNRM_MCHN_SQNO
                                                   , TNRM_EQPMT_CLSS_CD
                                                   , TNRM_INSR_DETL_ID
                                                   , USE_YN
                                                   , FSTTM_RGSR_ID
                                                   , FSTTM_RGST_DTTM
                                                   , LSTTM_MODFR_ID
                                                   , LSTTM_ALTR_DTTM
                                                  )
            SELECT B.INSR_SEQ
                 , A.MPNG_CD
                 , A.TNRM_INSR_ID                 
                 , B.TNRM_INSL_LOCT_LCLSS_CD
                 , A.TNRM_MCHN_CLSS_CD
                 , A.TNRM_MCHN_SQNO
                 , A.TNRM_EQPMT_CLSS_CD
                 , A.TNRM_INSR_DETL_ID
                 , 'Y'
                 , 'SYSTEM'
                 , SYSDATE
                 , 'SYSTEM'
                 , SYSDATE
              FROM T_AFMF_OPND_INSR01M1 A
                 , T_AFMF_TNRM_INSR01M1 B
             WHERE 1=1
               AND A.TUNL_CD           = B.TUNL_CD
               AND A.TNRM_MCHN_CLSS_CD = B.TNRM_MCHN_CLSS_CD
               AND A.TNRM_INSR_ID      = B.TNRM_INSR_ID
               AND A.TUNL_CD           = INPUT_TNCODE
               AND A.TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE
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
        VALUES ('MACHINE_MAPPING 배치', 'P_MAKE_MACHINE_MAPPING', 0,'에러발생', V_MSG, SYSDATE );
        COMMIT;
        
END P_MAKE_MACHINE_MAPPING;
/
