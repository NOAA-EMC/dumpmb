C-----------------------------------------------------------------------
C-----------------------------------------------------------------------
      SUBROUTINE MNEMONICS(SUBSET,NEMOS,NEMS,COMPRESS)
 
      CHARACTER SUBSET*8,NEMOS(10)*80
      LOGICAL   COMPRESS
 
C-----------------------------------------------------------------------
C-----------------------------------------------------------------------

      NEMOS = '          '
      NEMS = 0
 
      IF(SUBSET.EQ.'METAR') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)='QMPR PRES PMSL QMDD TMDP QMAT TMDB QMWN WDIR WSPD'
         NEMOS(4)='CORN QMST SST1                                   '
         COMPRESS = .TRUE.
         NEMS = 4
      ELSEIF(SUBSET.EQ.'SHIPS') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)=
     &       'QMPR PRES PMSL QMDD TMDP REHU QMAT TMDB QMWN WDIR WSPD'
         NEMOS(4)='CORN TOST TIMW MSST ASMP QMST SST1               '
         NEMOS(5)='RSRD  EXPRSRD                                    '
         COMPRESS = .TRUE.
         NEMS = 5
      ELSEIF(SUBSET.EQ.'SHIPSU') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)=
     &       'QMPR PRES PMSL QMDD TMDP REHU QMAT TMDB QMWN WDIR WSPD'
         NEMOS(4)='CORN TOST TIMW MSST ASMP QMST SST1               '
         COMPRESS = .TRUE.
         NEMS = 4
      ELSEIF(SUBSET.EQ.'DBUOY') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)=
     &       'QMPR PRES PMSL QMDD TMDP REHU QMAT TMDB QMWN WDIR WSPD'
         NEMOS(4)='QCLS QDEP QBST QCIL QCTSP QCCUR                  '
         NEMOS(5)='PSYR PSMN PSDY PSHR PSMI  PLDS                   '
         NEMOS(6)='DOMO DROT DROD HPLE DLATH DLONH                  '
         NEMOS(7)='CALT BUYT ANHT AHAC ANTP  MSDM                   '
         NEMOS(8)='CORN TOST TIWM MSST                              '
         NEMOS(9)='MRMV DTCC QMST                                   '
         COMPRESS = .FALSE.
         NEMS = 9
      ELSEIF(SUBSET.EQ.'DBUOYSUB') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)=
     &       'QMPR PRES PMSL QMDD TMDP REHU QMAT TMDB QMWN WDIR WSPD'
         NEMOS(4)='QCLS QDEP QBST QCIL QCTSP QCCUR                  '
         NEMOS(5)='PSYR PSMN PSDY PSHR PSMI  PLDS                   '
         NEMOS(6)='DOMO DROT DROD HPLE DLATH DLONH                  '
         NEMOS(7)='CALT BUYT ANHT AHAC ANTP  MSDM                   '
         NEMOS(8)='CORN TOST TIWM MSST                              '
         NEMOS(9)='MRMV DTCC QMST SST1                              '
         NEMOS(10)='DBSS STMP SALN DROC SPOC                        '
         COMPRESS = .FALSE.
         NEMS = 10
      ELSEIF(SUBSET.EQ.'MBUOY') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)=
     &       'QMPR PRES PMSL QMDD TMDP REHU QMAT TMDB QMWN WDIR WSPD'
         NEMOS(4)='CORN TOST TIWM MSST QMST SST1                    '
         COMPRESS = .TRUE.
         NEMS = 4
      ELSEIF(SUBSET.EQ.'LCMAN') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)=
     &       'QMPR PRES PMSL QMDD TMDP REHU QMAT TMDB QMWN WDIR WSPD'
         NEMOS(4)='CORN TOST TIWM MSST QMST SST1                    '
         COMPRESS = .TRUE.
         NEMS = 4
      ELSEIF(SUBSET.EQ.'TIDEG') THEN
         NEMOS(1)='RPID SELV                                        '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)='QMPR PRES PMSL QMDD TMDP QMAT TMDB QMWN WDIR WSPD'
         NEMOS(4)='CORN TOST TIWM MSST AWCK MWCK AMCK MMCK QMST SST1'
         COMPRESS = .TRUE.
         NEMS = 4
      ELSEIF(SUBSET.EQ.'SLPBG') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)='CORN QMPR PMSL                                   '
         COMPRESS = .TRUE.
         NEMS = 3
      ELSEIF(SUBSET.EQ.'CSTGD') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)=
     &       'QMPR PRES PMSL QMDD TMDP REHU QMAT TMDB QMWN WDIR WSPD'
         NEMOS(4)='CORN TOST TIWM MSST QMST SST1 TERC TIDER         '
         COMPRESS = .TRUE.
         NEMS = 4
      ELSEIF(SUBSET.EQ.'SSTNV'   .OR.
     .       SUBSET.EQ.'SSTNS'   .OR.
     .       SUBSET.EQ.'SSTNVH') THEN
         NEMOS(1)='YEAR MNTH DAYS HOUR MINU SECO                    '
         NEMOS(2)='SSTYPE SSTSRC SST1                               '
         COMPRESS = .TRUE.
         NEMS = 2
      ELSEIF(SUBSET.EQ.'SSMIPN') THEN
         NEMOS(1)='uses definition in subroutine ssmipn             '
         COMPRESS = .TRUE.
         NEMS = 1
      ELSEIF(SUBSET.EQ.'BATHY') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)='QMAT TMDB                                        '
         NEMOS(4)='TIWM QMWN WDIR WSPD                              '
         NEMOS(5)='CORN TOWD IDGT MCMS IWTEMP WTEMPR                '
         NEMOS(6)='DBSS STMP SALN DROC SPOC                         '
         COMPRESS = .FALSE.
         NEMS = 6
      ELSEIF(SUBSET.EQ.'TESAC') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)='QMAT TMDB                                        '
         NEMOS(4)='TIWM QMWN WDIR WSPD                              '
         NEMOS(5)='CORN TOWD IDGT MSDM MRMV IWTEMP WTEMPR           '
         NEMOS(6)='DBSS STMP SALN DROC SPOC                         '
         COMPRESS = .FALSE.
         NEMS = 6
      ELSEIF(SUBSET.EQ.'TRKOB') THEN
         NEMOS(1)='RPID SELV YEAR MNTH DAYS HOUR MINU               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)='CORN                                             '
         NEMOS(4)='AVGPER                                           '
         NEMOS(5)='DBSS STMP SALN DROC SPOC                         '
         COMPRESS = .FALSE.
         NEMS = 5
      ELSEIF(SUBSET.EQ.'ERSHAL'  .OR.
     .       SUBSET.EQ.'TOPHAL'  .OR.
     .       SUBSET.EQ.'TOPLAL'  .OR.
     .       SUBSET.EQ.'GFOHAL')  THEN
         NEMOS(1)='YEAR MNTH DAYS HOUR MINU                         '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)='CORN ECLN STKO NSLR SLHD                         '
         COMPRESS = .TRUE.
         NEMS = 3
      ELSEIF(SUBSET.EQ.'NERSAL'  .OR.
     .       SUBSET.EQ.'NGFOAL'  .OR.
     .       SUBSET.EQ.'NTPXAL'  .OR.
     .       SUBSET.EQ.'NJSNAL'  .OR.
     .       SUBSET.EQ.'ENVSAL')  THEN
         NEMOS(1)='SAID YEAR MNTH DAYS HOUR MINU SECO               '
         NEMOS(2)='RCYR RCMO RCDY RCHR RCMI                         '
         NEMOS(3)='SACYLN SCLF ORBN OBQL SLHD1                      '
         COMPRESS = .TRUE.
         NEMS = 3
      ENDIF
 
      RETURN
      END
