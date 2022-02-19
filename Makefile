FC=ftn
FFLAGS=-xCORE-AVX2

# Serial netCDF paths and flag
SNETCDF=/opt/cray/pe/netcdf/4.7.4.4/intel/19.1
SNETCDFINCS=-I$(SNETCDF)/include
SNETCDFLIBS=-L$(SNETCDF)/lib -lnetcdf

# Parallel netCDF paths and flag
PNETCDF=/opt/cray/pe/parallel-netcdf/1.12.1.4/intel/19.1
PNETCDFINCS=-I$(SNETCDF)/include
PNETCDFLIBS=-L$(SNETCDF)/lib -lpnetcdf

serial:
	${FC} serial.F90 -o serial ${FFLAGS} ${SNETCDFINCS} ${SNETCDFLIBS}
	./serial

