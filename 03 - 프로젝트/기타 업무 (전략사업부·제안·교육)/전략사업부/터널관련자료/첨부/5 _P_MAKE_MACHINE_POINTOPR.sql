CREATE OR REPLACE PROCEDURE TER_MAIN."P_MAKE_MACHINE_POINTOPR" 
(
    INPUT_TNCODE         IN VARCHAR2
   ,INPUT_MACHINECODE    IN VARCHAR2
)
IS
    MAXSEQ               NUMBER(10)    :=  0;  
    V_MSG                VARCHAR2(200) := '';
    
CURSOR MY_CUR1 IS
            SELECT COUNT(*) CNT
              FROM T_AFMF_TNRM_INSR01M1
             WHERE 1=1
               AND TUNL_CD           = INPUT_TNCODE
               AND TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE                  
            ;
    
C1 MY_CUR1%ROWTYPE;

BEGIN
      
        IF SQL%ROWCOUNT > 0 THEN
            COMMIT;
            -- 기존터널자료 삭제
            DELETE FROM TERIF_MAIN.TB_POINTOPR
            WHERE 1=1
              AND TUNL_CD      = INPUT_TNCODE
              AND MACHINE_CODE = INPUT_MACHINECODE;                        
        END IF;
        
        OPEN MY_CUR1;
        
        LOOP
        
        FETCH MY_CUR1 INTO C1;
        EXIT WHEN MY_CUR1%NOTFOUND;
            
        BEGIN
            
            DELETE FROM TERIF_MAIN.TB_POINTOPR
             WHERE 1=1
               AND TUNL_CD      = INPUT_TNCODE
               AND MACHINE_CODE = INPUT_MACHINECODE;      
              
            INSERT INTO TERIF_MAIN.TB_POINTOPR (
                                             TUNL_CD
                                           , DEVICE_CODE
                                           , POINT_CODE
                                           , EQUIP_CODE
                                           , MACHINE_CODE
                                           , POINT_STAT
                                           , POINT_VALUE
                                           , ALARM_TYPE
                                           , ALARM_LEVEL
                                           , ALARM_STAT
                                           , POINT_TYPE            
                                          )
           SELECT TUNL_CD
                , TNRM_INSR_ID
                , TNRM_TAG_ID
                , TNRM_EQPMT_CLSS_CD
                , TNRM_MCHN_CLSS_CD
                , 0 POINT_STAT
                , 0 POINT_VALUE
                , 0 ALARM_TYPE
                , 0 ALARM_LEVEL
                , 0 ALARM_STAT
                , POINT_TYPE
             FROM (
                   SELECT B.TUNL_CD
                        , B.TNRM_INSR_ID
                        , A.TNRM_TAG_ID
                        , A.PONT_ISTC
                        , B.TNRM_EQPMT_CLSS_CD
                        , B.TNRM_MCHN_CLSS_CD
                        , DECODE(A.TNRM_PONT_TYPE_CD,'DI',0,'DO',1,'AI',2,'AO',3,'AI32',4 ,'AO32',5,6) POINT_TYPE
                     FROM T_AFMF_TNRM_INSR_PONT01M1 A
                        , T_AFMF_TNRM_INSR01M1 B
                    WHERE 1=1
                      AND A.TNRM_EQPMT_CLSS_CD  = B.TNRM_EQPMT_CLSS_CD
                      AND A.TNRM_MCHN_CLSS_CD   = B.TNRM_MCHN_CLSS_CD
                      AND B.TUNL_CD             = INPUT_TNCODE
                      AND A.TNRM_MCHN_CLSS_CD   = INPUT_MACHINECODE 
                      AND A.USE_YN       = 'Y'
                   UNION ALL
                   SELECT TUNL_CD
                        , TNRM_INSR_ID
                        , 0 POINT_CODE 
                        , '가상포인터0' POINT_NAME
                        , TNRM_EQPMT_CLSS_CD
                        , TNRM_MCHN_CLSS_CD
                        , 6 POINT_TYPE
                     FROM T_AFMF_TNRM_INSR01M1
                    WHERE 1=1
                      AND TUNL_CD             = INPUT_TNCODE
                      AND TNRM_MCHN_CLSS_CD   = INPUT_MACHINECODE
                   UNION ALL
                   SELECT TUNL_CD
                        , TNRM_INSR_ID
                        , 800 POINT_CODE 
                        , '가상포인터800' POINT_NAME
                        , TNRM_EQPMT_CLSS_CD
                        , TNRM_MCHN_CLSS_CD
                        , 6 POINT_TYPE
                     FROM T_AFMF_TNRM_INSR01M1
                    WHERE 1=1
                      AND TUNL_CD             = INPUT_TNCODE
                      AND TNRM_MCHN_CLSS_CD   = INPUT_MACHINECODE
                   UNION ALL
                   SELECT TUNL_CD
                        , TNRM_INSR_ID
                        , 900 POINT_CODE 
                        , '가상포인터900' POINT_NAME
                        , TNRM_EQPMT_CLSS_CD
                        , TNRM_MCHN_CLSS_CD
                        , 6 POINT_TYPE
                     FROM T_AFMF_TNRM_INSR01M1
                    WHERE 1=1
                      AND TUNL_CD             = INPUT_TNCODE
                      AND TNRM_MCHN_CLSS_CD   = INPUT_MACHINECODE
                  )
            ORDER BY TNRM_INSR_ID
                   , TNRM_TAG_ID
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
        VALUES ('MACHINE_POINTOPR 배치', 'P_MAKE_MACHINE_POINTOPR', 0,'에러발생', V_MSG, SYSDATE );
        COMMIT;        
END P_MAKE_MACHINE_POINTOPR;
/
