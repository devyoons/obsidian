CREATE OR REPLACE PROCEDURE TER_MAIN."P_MAKE_MACHINE_DEVICEBASE"
(
   INPUT_TNCODE       IN VARCHAR2
 , INPUT_MACHINECODE  IN VARCHAR2
)
IS
    V_MSG             VARCHAR2(200) := '';
    V_MACHINE_CODE    VARCHAR2(4)   := '';
    V_INDEX           NUMBER(3)     :=  0;
    V_CNT             NUMBER(3)     :=  1;
    V_ID              NUMBER(3)     :=  0;
    ID                VARCHAR2(6)   := '';
    SEQ               NUMBER(4)     :=  1;
    NUM               NUMBER(3)     :=  0;

    MAPPING_KEY       VARCHAR2(20)  := '';
    MAPPING_NUM       VARCHAR2(5)   := '';
    V_MAPKEYNAME      VARCHAR2(200) := '';
    V_POSITION_CODE   VARCHAR2(4)   := '1';
    V_MACHINE_INDEX   NUMBER(4)     :=  1;
    V_START           NUMBER(1)     :=  1;
    V_LINE            NUMBER(1)     :=  1;

CURSOR MY_CUR1 IS
       SELECT A.TUNL_CD
            , A.TNRM_EQPMT_CLSS_CD
            , A.TNRM_MCHN_CLSS_CD
            , A.TNRM_MCHN_TRCN
            , A.TNRM_INSL_LOCT_LCLSS_CD
            , A.TNRM_INSL_LOCT_MCLSS_CD
            , A.INSL_LOCT_ISTC
            , A.MODL_NM
            , A.TNRM_INSR_ID
            , A.OPND_INSR_SQNO
            , A.PLC_IP_ADDR
            , A.PLC_PORT_NO
            , A.PLC_FILD_INSR_NO
            , B.SPAR_ETC_OPTN_CTNT AS MAPPINGKEY
         FROM T_AFMF_OPND_INSR_TRCN01M1 A
            , T_AFMF_TNRM_INSR_GRP01M1  B
        WHERE 1=1
          AND A.TNRM_MCHN_CLSS_CD = B.TNRM_MCHN_CLSS_CD(+)
          AND B.TNRM_INSR_GRP_ID  = '508'
          AND A.TUNL_CD           = INPUT_TNCODE
          AND A.TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE
        ORDER BY A.TNRM_EQPMT_CLSS_CD
               , A.OPND_INSR_SQNO
       ;

C1 MY_CUR1%ROWTYPE;

BEGIN


    IF SQL%ROWCOUNT > 0 THEN
        COMMIT;
    END IF;

    -- 기존터널자료 삭제
    DELETE FROM T_AFMF_OPND_INSR01M1
     WHERE 1=1
       AND TUNL_CD           = INPUT_TNCODE
       AND TNRM_MCHN_CLSS_CD = INPUT_MACHINECODE
    ;


    OPEN MY_CUR1;


    LOOP
        FETCH MY_CUR1 INTO C1;
        EXIT WHEN MY_CUR1%NOTFOUND;

        -- MACHINE_CODE가 다르면 V_INDEX를 0으로 초기화 한다
        IF C1.TNRM_MCHN_CLSS_CD != V_MACHINE_CODE THEN
           V_INDEX         :=  0;
           V_MACHINE_INDEX :=  1;
           V_POSITION_CODE := '1';
        END IF;

        -- 최초 조회시 설비 위치정보를 변수에 입력한다.
--        IF V_START = 1 THEN
--           V_POSITION_CODE := C1.POSITION_2 ;
--           V_START  :=0 ;
--         END IF;


        -- MACHINE_CODE 대입
        V_MACHINE_CODE    := C1.TNRM_MCHN_CLSS_CD;
        V_CNT             := 1;
        MAPPING_KEY       := C1.MAPPINGKEY;


        -- T_AFMF_OPND_INSR_MPNG01M1 테이블에 입력할 코드값생성

         -- 1. 터널내에 위치한 설비
         --     제트팬, VICO, 풍향풍속계, 진입차단설비, 비상경보발신기, 자동화재 탐지설비, 수동소화기, 옥내소화전 ,VDS,LCS,비상전화,VMS
         --    은 POSITION_2 에따라   0101은   101 ~     0102 은 201 ~ 순번으로 번호가 증가
         -- 2. 나머지 설비
         --     순서대로 001~ 로 증가
          BEGIN
          IF   V_POSITION_CODE != C1.TNRM_INSL_LOCT_MCLSS_CD THEN
                  IF    C1.TNRM_MCHN_CLSS_CD = '0101' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0101' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0104' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0104' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0105' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0105' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0201' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0201' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0202' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0202' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0301' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0301' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0302' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 1001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0302' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 2001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0303' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 1001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0303' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 2001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0305' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 1001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0305' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 2001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0306' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 1001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0306' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 2001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0309' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0309' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0310' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0310' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0501' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0501' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0618' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0618' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0620' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0620' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0701' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0701' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0702' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 1001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0702' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 2001;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0703' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0703' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0705' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0705' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0706' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0101' THEN V_MACHINE_INDEX := 101;
                  ELSIF C1.TNRM_MCHN_CLSS_CD = '0706' AND C1.TNRM_INSL_LOCT_MCLSS_CD = '0102' THEN V_MACHINE_INDEX := 201;
             END IF;

        END IF;

        END;



        -- 기기 대수만큼 입력
        -- FOR NUM IN 1..C1.MACHINE_CNT LOOP

        LOOP

            EXIT WHEN V_CNT > C1.TNRM_MCHN_TRCN;

            BEGIN
              SELECT TO_CHAR(V_INDEX,'000') INTO ID FROM DUAL;
            END;

            BEGIN
              SELECT DECODE(C1.TNRM_MCHN_CLSS_CD,'0302',TO_CHAR(V_MACHINE_INDEX, '0000'),
                      '0303',TO_CHAR(V_MACHINE_INDEX, '0000'),
                      '0305',TO_CHAR(V_MACHINE_INDEX, '0000'),
                      '0306',TO_CHAR(V_MACHINE_INDEX, '0000'),
                      '0702',TO_CHAR(V_MACHINE_INDEX, '0000'),TO_CHAR(V_MACHINE_INDEX, '000'))
              INTO MAPPING_NUM
              FROM DUAL;
            END;

              V_LINE := 1;

              BEGIN
                   -- LCS인경우 차선만큼 Mapping Key를 생성헌다.
                   IF   INPUT_MACHINECODE = '0702' THEN
                        LOOP
                           -- 차선만큼 반복한다. [1..8]
                            EXIT WHEN V_LINE > 8;

                            BEGIN

                                INSERT INTO T_AFMF_OPND_INSR01M1 (
                                                                    TUNL_CD
                                                                  , INSR_SEQ
                                                                  , TNRM_EQPMT_CLSS_CD
                                                                  , TNRM_MCHN_CLSS_CD
                                                                  , TNRM_MCHN_SQNO
                                                                  , TNRM_INSL_LOCT_LCLSS_CD
                                                                  , TNRM_INSL_LOCT_MCLSS_CD
                                                                  , DETL_LOCT_NM
                                                                  , INSL_STAT_VAL
                                                                  , MODL_NM
                                                                  , USE_YN
                                                                  , TNRM_INSR_ID
                                                                  , TNRM_INSR_DETL_ID
                                                                  , PLC_IP_ADDR
                                                                  , PLC_PORT_NO
                                                                  , PLC_FILD_INSR_NO
                                                                  , MPNG_CD
                                                                  , FSTTM_RGSR_ID
                                                                  , MDBS_ADDR
                                                                  , FSTTM_RGST_DTTM
                                                                  , LSTTM_MODFR_ID
                                                                  , LSTTM_ALTR_DTTM
                                                                 )
                                                          VALUES (
                                                                   TO_NUMBER(C1.TUNL_CD)                   
                                                                 , SEQ
                                                                 , C1.TNRM_EQPMT_CLSS_CD
                                                                 , C1.TNRM_MCHN_CLSS_CD 
                                                                 , V_INDEX           
                                                                 , C1.TNRM_INSL_LOCT_LCLSS_CD     
                                                                 , C1.TNRM_INSL_LOCT_MCLSS_CD  
                                                                 , 0   
                                                                 , 1               
                                                                 , C1.MODL_NM     
                                                                 , 'Y'                
                                                                 , TRIM(C1.TNRM_INSR_ID)||TRIM(ID)
                                                                 , TRIM(MAPPING_NUM)   
                                                                 , C1.PLC_IP_ADDR
                                                                 , C1.PLC_PORT_NO
                                                                 , C1.PLC_FILD_INSR_NO
                                                                 --,TRIM(MAPPING_KEY)||'_'||TRIM(MAPPING_NUM )--0801,0803은 뒤에 일련 번호 뺀다.(현시점에선 기기는 하나만 존재)
                                                                 , DECODE(C1.TNRM_MCHN_CLSS_CD, '0801', TRIM(MAPPING_KEY), '0803', TRIM(MAPPING_KEY), '0809', TRIM(MAPPING_KEY), TRIM(MAPPING_KEY)||'_'||TRIM(MAPPING_NUM))
                                                                 , 'system'
                                                                 , '0.0'
                                                                 , SYSDATE
                                                                 , 'system'   
                                                                 , SYSDATE                                                              
                                                                );

                            END;

                        V_LINE := V_LINE + 1;

                     END LOOP;

                   ELSE
                    INSERT INTO T_AFMF_OPND_INSR01M1 (
                                                        TUNL_CD
                                                      , INSR_SEQ
                                                      , TNRM_EQPMT_CLSS_CD
                                                      , TNRM_MCHN_CLSS_CD
                                                      , TNRM_MCHN_SQNO
                                                      , TNRM_INSL_LOCT_LCLSS_CD
                                                      , TNRM_INSL_LOCT_MCLSS_CD
                                                      , DETL_LOCT_NM
                                                      , INSL_STAT_VAL
                                                      , MODL_NM
                                                      , USE_YN
                                                      , TNRM_INSR_ID
                                                      , TNRM_INSR_DETL_ID
                                                      , PLC_IP_ADDR
                                                      , PLC_PORT_NO
                                                      , PLC_FILD_INSR_NO
                                                      , MPNG_CD
                                                      , FSTTM_RGSR_ID
                                                      , MDBS_ADDR
                                                      , FSTTM_RGST_DTTM
                                                      , LSTTM_MODFR_ID
                                                      , LSTTM_ALTR_DTTM
                                                    )
                                                    VALUES
                                                    (
                                                       TO_NUMBER(C1.TUNL_CD)                   
                                                     , SEQ
                                                     , C1.TNRM_EQPMT_CLSS_CD
                                                     , C1.TNRM_MCHN_CLSS_CD 
                                                     , V_INDEX           
                                                     , C1.TNRM_INSL_LOCT_LCLSS_CD     
                                                     , C1.TNRM_INSL_LOCT_MCLSS_CD
                                                     , 0     
                                                     , 1               
                                                     , C1.MODL_NM     
                                                     , 'Y'                
                                                     , TRIM(C1.TNRM_INSR_ID)||TRIM(ID)
                                                     , TRIM(MAPPING_NUM)   
                                                     , C1.PLC_IP_ADDR
                                                     , C1.PLC_PORT_NO
                                                     , C1.PLC_FILD_INSR_NO
                                                     --,TRIM(MAPPING_KEY)||'_'||TRIM(MAPPING_NUM )--0801,0803은 뒤에 일련 번호 뺀다.(현시점에선 기기는 하나만 존재)
                                                     , DECODE(C1.TNRM_MCHN_CLSS_CD, '0801', TRIM(MAPPING_KEY), '0803', TRIM(MAPPING_KEY), '0809', TRIM(MAPPING_KEY), TRIM(MAPPING_KEY)||'_'||TRIM(MAPPING_NUM))
                                                     , 'system'
                                                     , '0.0'
                                                     , SYSDATE
                                                     , 'system'
                                                     , SYSDATE
                                                    );
                 END IF;
               END;

               SEQ      := SEQ     + 1;
               V_INDEX  := V_INDEX + 1;
               V_ID     := V_ID    + 1;
               V_CNT    := V_CNT   + 1;

              V_MACHINE_INDEX  := V_MACHINE_INDEX+1;
               -- 현재 위치정보 저장
               V_POSITION_CODE := C1.TNRM_INSL_LOCT_MCLSS_CD;

         END LOOP;

         COMMIT;

    END LOOP;
    CLOSE MY_CUR1;


EXCEPTION
    WHEN OTHERS THEN
        V_MSG := SUBSTR(SQLERRM, 1, 100);
        ROLLBACK;

        INSERT INTO TERIF_MAIN.TB_BATCH_RESULT
        VALUES ('MAKE_MACHINE_DEVICEBASE 배치', 'P_MAKE_MACHINE_DEVICEBASE', 0,'에러발생', V_MSG, SYSDATE );
        COMMIT;
END P_MAKE_MACHINE_DEVICEBASE;
/
