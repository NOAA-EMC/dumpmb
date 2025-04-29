# ###########################################################################
# makefile (bufr_bathydump) -  23 May 2018 
# 
#                use to convert bathy type 031006 to bathy format 031001
# ----
#
# Source files & objects
#
SRCS	= bufr_bathydump.f  
OBJS	= bufr_bathydump.o


#CHKOUT = 	-ftrapuv  -check all  -fp-stack-check  -fstack-protector
DEBUG = 	-g -traceback
FFLAGS =        -O2 $(DEBUG) $(CHKOUT) -free
LDFLAGS=

CMD = 		bufr_bathydump

all:		$(CMD)

$(CMD):		$(OBJS)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(CMD) $(SRCS) $(LIBS)

clean:
	-rm -f $(OBJS)

clobber:	clean
	-rm -f $(CMD)    

install:
	mv $(CMD) ../../exec/

# -- end of Makefile

