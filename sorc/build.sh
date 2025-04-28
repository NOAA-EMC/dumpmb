set -eua

. ../versions/build.ver

module reset
module load PrgEnv-intel/${PrgEnv_intel_ver}
module load intel/${intel_ver}
module load craype/${craype_ver} 
module load w3emc/${w3emc_ver}
module load w3nco/${w3nco_ver}
module load bufr/${bufr_ver}
module list

mkdir -p ../exec

(cd bufr_argodump.fd;  ./makefile.sh)
(cd bufr_prepmods.fd;  ./makefile.sh)
(cd bufr_buoydump.fd;  ./makefile.sh)
(cd bufr_bathydump.fd; ./makefile.sh)

