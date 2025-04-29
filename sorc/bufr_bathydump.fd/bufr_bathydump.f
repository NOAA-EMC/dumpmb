!$$$  MAIN PROGRAM DOCUMENTATION BLOCK
!
! MAIN PROGRAM: bufr_bathydump
!   PRGMMR: Woollen          ORG: NP20        DATE: 2018-05-15
!
! ABSTRACT: GENERATES tesac dumpfiles from NC031005 (argo) dump files
!
! PROGRAM HISTORY LOG:
! 2024-08-12  JWoollen    ORIGINAL VERSION FOR IMPLEMENTATION
!
! USAGE:
!   INPUT FILES:
!     UNIT 20  - DCOM format bathy file            
!
!   OUTPUT FILES:
!     UNIT 50  - BATHY data in DCOM format tesac file  
!     UNIT 06  - UNIT 6 (STANDARD PRINTFILE)
!
!   SUBPROGRAMS CALLED:
!     UNIQUE:   - 
!
!     LIBRARY:
!      W3LIB    - W3TAGB W3TAGE ERREXIT
!      BUFRLIB  - OPENBF MAXOUT OPENMB UFBINT
!               - WRITSB WRITCP CLOSBF
!
!   EXIT STATES:
!     COND =   0 - SUCCESSFUL RUN
!          >   0 - ABNORMAL RUN
!
! REMARKS:
!
! ATTRIBUTES:
!   LANGUAGE: FORTRAN 90
!   MACHINE:  WCOSS
!
!$$$
      PROGRAM BUFR_BATHYDUMP
 
      PARAMETER(MAX1=11,MAX2=2550)
 
      CHARACTER*8  SUBSET,SUBOUT,SUBINN
      CHARACTER*8  CARR(MAX1,MAX2) 
      EQUIVALENCE  (ARR,CARR)
      LOGICAL      COMPRESS,argos
      REAL*8       ARR(MAX1,MAX2),P,Z,ARRLEN
      REAL*8 ,     ALLOCATABLE :: ARI(:,:)
      REAL*8 ,     ALLOCATABLE :: ARO(:,:)
 
      DATA LUBFR/20/
      DATA LUBFO/50/

      DATA SUBINN/'NC031006'/ ! bathy dcom message type (new)
      DATA SUBOUT/'NC031001'/ ! bathy dcom message type (old)
 
!-----------------------------------------------------------------------
!-----------------------------------------------------------------------
 
      CALL W3TAGB('bufr_bathydump',2013,035,50,'NP20')
 
!  OPEN THE INPUT AND OUTPUT BUFR FILES
!  ------------------------------------

      CALL OPENBF(LUBFR,'IN ',LUBFR)
      CALL OPENBF(LUBFO,'OUT',LUBFR)
 
      call maxout(50000)

!  READ THE MESSAGES FROM THE INPUT FILE
!  -------------------------------------
 
      NRPT_NCO = 0
      NRPT_MOD = 0
 
      DO WHILE(IREADMG(LUBFR,SUBSET,IDATE).EQ.0)
      IF(SUBSET/=SUBINN) CALL BORT('ARGODUMP - INPUT NOT '//SUBINN)
      DO WHILE(IREADSB(LUBFR).EQ.0)
 
      NRPT_NCO = NRPT_NCO + 1
 
!  copy the 031005 elements into the tesac format 
!  ----------------------------------------------
 
      CALL OPENMB(LUBFO,SUBOUT,IDATE)
 
      ! copy x,y,t elements

      CALL UFBINT(LUBFR,ARR,MAX1,MAX2,IRET,'YEAR MNTH DAYS HOUR MINU CLAT CLON CLATH CLONH ')
      CALL UFBINT(LUBFO,ARR,MAX1,IRET,JRET,'YEAR MNTH DAYS HOUR MINU CLAT CLON CLATH CLONH ')

      ! copy receipt time elements

      CALL UFBINT(LUBFR,ARR,MAX1,MAX2,IRET,'RCTS RCYR RCMO RCDY RCHR RCMI IWTEMP ')  
      CALL UFBINT(LUBFO,ARR,MAX1,IRET,JRET,'RCTS RCYR RCMO RCDY RCHR RCMI IWTEMP ')  

      ! read the (TMSLPFSQ) sequence to get subsurface elements for 031001

      call ufbint(lubfr,arrlen,1,1,iret,'(TMSLPFSQ)')
      maxa=nint(arrlen)
      ALLOCATE(ari(12,maxa))
      ALLOCATE(aro( 3,maxa))

      call ufbseq(lubfr,ari,12,maxa,iret,'TMSLPFSQ')
      do n=1,maxa 
      aro(1,n) = ari(7 ,n) ! sst1
      aro(2,n) = ari(10,n) ! salnh
      aro(3,n) = ari(1 ,n) ! dbss
      wpres    = ari(4 ,n) ! wpres
      enddo
      call ufbint(lubfo,aro,3,maxa,jret,'STMP SALN DBSS')

      ! copy the WMOP (numeric) to RPID (char) and left justify RPID string 

      CALL UFBINT(LUBFR,ARR,MAX1,MAX2,IRET,'WMOP')   
      write(carr(1,1),'(i8)') nint(arr(1,1))
      carr(1,1)=adjustl(carr(1,1))

      ! write the finished character ID in RPID

      CALL UFBINT(LUBFO,ARR,MAX1,IRET,JRET,'RPID')  

      ! write the 031001 templated subset

      call writsb(lubfo)

      NRPT_MOD=NRPT_MOD+1
 
!  END OF READ AND CONVERT LOOPS
!  -----------------------------

      deallocate(ari,aro)
 
      ENDDO  !  end of readSB loop
      ENDDO  !  end of readMG loop
 
      CALL CLOSBF(LUBFO)
 
!  FINISHED
!  --------
 
      PRINT'(/,80("-"))'
      PRINT'("Read    ",I7," reports from NC031006 messages: ",a8)', NRPT_NCO
      PRINT'("Wrote   ",I7," reports to   NC031001 messages: ",a8)', NRPT_MOD
      PRINT'(80("-"))'
 
      CALL W3TAGE('bufr_bathydump')
      STOP
      END
!---------------------------------------------------------------------------------
      subroutine bort2(st1,st2)
      character(*) st1,st2
      print*,st1
      print*,st2
      call tracebackqq()
      stop
      end
