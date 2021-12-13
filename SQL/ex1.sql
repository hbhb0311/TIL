SELECT COL1
     , COL2
     , SUM(COL4) AS COL4
     , SUM(COL5) AS COL5
     , SUM(COL6) AS COL6
     , SUM(COL7) AS COL7
     , SUM(COL8) AS COL8
     , SUM(COL9) AS COL9
     , SUM(COL10) AS COL10
     , SUM(COL11) AS COL11
  FROM (
           SELECT COL1
                , COL2
                , COL
                , VAL
                , COL||RN X
             FROM (
                      SELECT *
                        FROM (
                                  SELECT COL1
                                       , COL2
                                       , 'COL4' AS COL
                                       , COL4 AS VAL
                                       , ROW_NUMBER() OVER(PARTITION BY COL1, COL2 ORDER BY NULL) RN
                                    FROM (
                                              SELECT *
                                                FROM TBL
                                              ORDER BY 1, 2
                                         )
                                    UNION ALL
                                    SELECT COL1
                                         , COL2
                                         , 'COL5' AS COL
                                         , COL5 AS VAL
                                         , ROW_NUMBER() OVER(PARTITION BY COL1, COL2 ORDER BY NULL) RN
                                    FROM (
                                              SELECT *
                                                FROM TBL
                                              ORDER BY 1, 2
                                         )
                             )
                      )
         )
PIVOT (SUM(VAL) FOR X IN ('COL41' AS COL4
                        , 'COL42' AS COL5
                        , 'COL43' AS COL6
                        , 'COL44' AS COL7
                        , 'COL51' AS COL8
                        , 'COL52' AS COL9
                        , 'COL53' AS COL10
                        , 'COL54' AS COL11))
GROUP BY COL1, COL2
ORDER BY COL1, COL2
;
                                    
